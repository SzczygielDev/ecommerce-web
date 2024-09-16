import 'command_error.dart';
import 'command_id.dart';
import 'command_result_status.dart';

class CommandResult {
  final CommandId id;
  final CommandResultStatus status;
  final DateTime timestamp;
  final double duration;
  final List<CommandError> errors;

  CommandResult({
    required this.id,
    required this.status,
    required this.timestamp,
    required this.duration,
    required this.errors,
  });

  factory CommandResult.fromJson(Map<String, dynamic> json) => CommandResult(
        id: CommandId(json["id"]),
        status: CommandResultStatus.fromString(json["status"])!,
        timestamp: DateTime.parse(json["timestamp"]),
        duration: json["duration"],
        errors: List<CommandError>.from(
            json["errors"].map((x) => CommandError.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id.value,
        "status": status.name,
        "timestamp": timestamp,
        "duration": duration,
        "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
      };
}
