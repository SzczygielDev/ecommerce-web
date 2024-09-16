import 'package:ecommerce_web/domain/command/commands.dart';

class BatchCommand<T extends Command> {
  final List<T> commands;
  final List<String> failedIds;

  const BatchCommand({required this.commands, required this.failedIds});
}
