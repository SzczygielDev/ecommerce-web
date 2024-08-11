enum CommandResultStatus {
  running,
  success,
  error;

  static CommandResultStatus? fromString(String value) {
    switch (value) {
      case "RUNNING":
        return CommandResultStatus.running;
      case "SUCCESS":
        return CommandResultStatus.success;
      case "ERROR":
        return CommandResultStatus.error;
    }
    return null;
  }
}
