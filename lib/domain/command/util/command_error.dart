class CommandError {
  final String name;
  final String message;

  CommandError({
    required this.name,
    required this.message,
  });

  factory CommandError.fromJson(Map<String, dynamic> json) => CommandError(
        name: json["name"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "message": message,
      };
}
