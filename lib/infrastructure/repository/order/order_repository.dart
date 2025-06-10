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
import 'package:ecommerce_web/infrastructure/repository/common/repository_base.dart';
import 'package:ecommerce_web/infrastructure/repository/order/model/order_complete_packing_request.dart';
import 'package:uuid/uuid.dart';

class OrderRepository extends RepositoryBase
    implements OrderRepositoryAbstraction {
  final Set<OrderCommand> processingCommands = {};
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
      defaultErrorHandler(ex);
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
      defaultErrorHandler(ex);
      return null;
    }
  }

  @override
  Future<Order?> getOrderByCartId(CartId id) async {
    //TODO - retry mechanism should be reusable
    for (int i = 0; i <= 3; i++) {
      try {
        final response =
            await dio.get("/orders", queryParameters: {"cartId": id.value});

        return Order.fromJson(response.data);
      } on Exception catch (ex) {
        defaultErrorHandler(ex);
      }
      await Future.delayed(const Duration(seconds: 1));
    }
    return null;
  }

  @override
  Future<AcceptOrderCommand?> acceptOrder(OrderId id) async {
    try {
      var uuid = Uuid();
      CommandId commandId = CommandId(uuid.v4());
      final command = AcceptOrderCommand(commandId: commandId, orderId: id);

      dio.put(
        "/orders/${id.value}/accept-commands/${commandId.value}",
      );

      processingCommands.add(command);
      return command;
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
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
      CommandResult? value = await _getOrderCommandResult(command);

      if (value != null) {
        results.add(value);
        if (value.status != CommandResultStatus.running) {
          commandsToDelete.add(command);
        }
      }
    }

    processingCommands.removeAll(commandsToDelete);

    return results;
  }

  Future<CommandResult?> _getOrderCommandResult(OrderCommand command) async {
    try {
      String? commandType;
      switch (command) {
        case AcceptOrderCommand():
          commandType = "/accept-commands/";
          break;
        case BeginPackingOrderCommand():
          commandType = "/beginPacking-commands/";
          break;
        case CancelOrderCommand():
          commandType = "/cancel-commands/";
          break;
        case CompletePackingOrderCommand():
          commandType = "/completePacking-commands/";
          break;
        case RejectOrderCommand():
          commandType = "/reject-commands/";
          break;
        case ReturnOrderCommand():
          commandType = "/return-commands/";
          break;
      }

      final response = await dio.get(
          "/orders/${command.orderId.value}/$commandType/${command.id.value}");

      return CommandResult.fromJson(response.data);
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }

  @override
  Future<BeginPackingOrderCommand?> beginPackingOrder(OrderId id) async {
    try {
      var uuid = Uuid();
      CommandId commandId = CommandId(uuid.v4());
      final command =
          BeginPackingOrderCommand(commandId: commandId, orderId: id);

      dio.put(
        "/orders/${id.value}/beginPacking-commands/${commandId.value}",
      );

      processingCommands.add(command);
      return command;
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }

  @override
  Future<CancelOrderCommand?> cancelOrder(OrderId id) async {
    try {
      var uuid = Uuid();
      CommandId commandId = CommandId(uuid.v4());
      final command = CancelOrderCommand(commandId: commandId, orderId: id);

      dio.put(
        "/orders/${id.value}/cancel-commands/${commandId.value}",
      );

      processingCommands.add(command);
      return command;
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }

  @override
  Future<CompletePackingOrderCommand?> completePackingOrder(
    OrderId id,
    double width,
    double height,
    double length,
    double weight,
  ) async {
    try {
      var uuid = Uuid();
      CommandId commandId = CommandId(uuid.v4());
      final command =
          CompletePackingOrderCommand(commandId: commandId, orderId: id);

      dio.put("/orders/${id.value}/completePacking-commands/${commandId.value}",
          data: OrderCompletePackingRequest(
                  width: width, length: length, height: height, weight: weight)
              .toJson());

      processingCommands.add(command);
      return command;
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }

  @override
  Future<RejectOrderCommand?> rejectOrder(OrderId id) async {
    try {
      var uuid = Uuid();
      CommandId commandId = CommandId(uuid.v4());
      final command = RejectOrderCommand(commandId: commandId, orderId: id);

      dio.put(
        "/orders/${id.value}/reject-commands/${commandId.value}",
      );

      processingCommands.add(command);
      return command;
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }

  @override
  Future<ReturnOrderCommand?> returnOrder(OrderId id) async {
    try {
      var uuid = Uuid();
      CommandId commandId = CommandId(uuid.v4());
      final command = ReturnOrderCommand(commandId: commandId, orderId: id);

      dio.put(
        "/orders/${id.value}/return-commands/${commandId.value}",
      );

      processingCommands.add(command);
      return command;
    } on Exception catch (ex) {
      defaultErrorHandler(ex);
      return null;
    }
  }
}
