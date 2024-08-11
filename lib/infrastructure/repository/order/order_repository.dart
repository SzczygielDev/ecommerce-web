import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ecommerce_web/config/locator.dart';
import 'package:ecommerce_web/domain/cart/cart_id.dart';
import 'package:ecommerce_web/domain/command/commands.dart';
import 'package:ecommerce_web/domain/command/util/command_id.dart';
import 'package:ecommerce_web/domain/command/util/command_result.dart';
import 'package:ecommerce_web/domain/command/util/command_result_status.dart';
import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/domain/order/order_id.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:uuid/uuid.dart';

class OrderRepository extends OrderRepositoryAbstraction {
  final Set<Command> processingCommands = {};
  final dio = locator.get<Dio>();

  @override
  Future<List<Order>> getOrders() async {
    try {
      final response = await dio.get<List>("/orders");

      var models = (response.data ?? [])
          .map(
            (e) => Order.fromJson(e),
          )
          .toList();

      return models;
    } on Exception catch (ex) {
      return [];
    }
  }

  @override
  Future<Order?> getOrder(OrderId id) async {
    try {
      final response =
          await dio.get("/orders", queryParameters: {"orderId": id.value});

      return Order.fromJson(response.data);
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<Order?> getOrderByCartId(CartId id) async {
    try {
      final response =
          await dio.get("/orders", queryParameters: {"cartId": id.value});

      return Order.fromJson(response.data);
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Future<AcceptOrderCommand?> acceptOrder(OrderId id) async {
    try {
      var uuid = Uuid();
      CommandId commandId = CommandId(uuid.v4());
      final command = AcceptOrderCommand(commandId: commandId, orderId: id);

      final response = dio.put(
        "/orders/${id.value}/accept-commands/${commandId.value}",
      );

      processingCommands.add(command);
      return command;
    } on Exception catch (ex) {
      return null;
    }
  }

  @override
  Stream<CommandResult> get orderCommandResults =>
      getCommandResults().asBroadcastStream().expand(
            (commandResult) => commandResult,
          );

  /*
    TODO - long polling should be avoided, these command results should be received by SSE listener, but for now we use this solution.    
  */
  Stream<List<CommandResult>> getCommandResults() async* {
    yield* Stream.periodic(const Duration(seconds: 2), (_) {
      return processCommandResults();
    }).asyncMap((future) async => await future);
  }

  Future<List<CommandResult>> processCommandResults() async {
    List<CommandResult> results = [];
    List<Command> commandsToDelete = [];
    for (var command in processingCommands) {
      CommandResult? value;
      switch (command) {
        case AcceptOrderCommand():
          value = await _getAcceptOrderCommandResult(command);
          break;
      }

      if (value != null) {
        if (value.status != CommandResultStatus.running) {
          commandsToDelete.add(command);
          results.add(value);
        }
      }
    }

    for (var command in commandsToDelete) {
      processingCommands.remove(command);
    }

    return results;
  }

  Future<CommandResult?> _getAcceptOrderCommandResult(
      AcceptOrderCommand command) async {
    try {
      final response = await dio.get(
          "/orders/${command.orderId.value}/accept-commands/${command.id.value}");

      return CommandResult.fromJson(response.data);
    } on Exception catch (ex) {
      return null;
    }
  }
}
