part of 'admin_order_bloc.dart';

class AdminOrderState extends Equatable {
  final List<OrderWrapper> orders;
  final List<PaymentServiceProvider> paymentServiceProviders;
  final List<DeliveryProvider> deliveryProviders;
  final List<OrderCommand> processingCommands;
  final List<CommandResult> commandResults;
  final List<BatchCommand<OrderCommand>> batchCommands;

  const AdminOrderState({
    this.orders = const [],
    this.paymentServiceProviders = const [],
    this.deliveryProviders = const [],
    this.processingCommands = const [],
    this.commandResults = const [],
    this.batchCommands = const [],
  });

  AdminOrderState copyWith(
      {List<OrderWrapper>? orders,
      List<PaymentServiceProvider>? paymentServiceProviders,
      List<DeliveryProvider>? deliveryProviders,
      List<OrderCommand>? processingCommands,
      List<CommandResult>? commandResults,
      List<BatchCommand<OrderCommand>>? batchCommands}) {
    return AdminOrderState(
        orders: orders ?? this.orders,
        paymentServiceProviders:
            paymentServiceProviders ?? this.paymentServiceProviders,
        deliveryProviders: deliveryProviders ?? this.deliveryProviders,
        processingCommands: processingCommands ?? this.processingCommands,
        commandResults: commandResults ?? this.commandResults,
        batchCommands: batchCommands ?? this.batchCommands);
  }

  @override
  List<Object> get props => [
        orders,
        paymentServiceProviders,
        deliveryProviders,
        processingCommands,
        commandResults,
        batchCommands
      ];
}
