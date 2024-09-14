import 'dart:async';

import 'package:ecommerce_web/domain/command/util/batch_command.dart';
import 'package:ecommerce_web/domain/command/util/command_result.dart';
import 'package:ecommerce_web/domain/command/util/command_result_status.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ProcessBatchCommandItem extends StatefulWidget {
  final BatchCommand command;
  final List<CommandResult> results;
  const ProcessBatchCommandItem(
      {super.key, required this.results, required this.command});

  @override
  State<ProcessBatchCommandItem> createState() =>
      _ProcessBatchCommandItemState();
}

class _ProcessBatchCommandItemState extends State<ProcessBatchCommandItem> {
  bool closed = false;
  bool fade = false;
  Timer? fadeTimer;

  @override
  void initState() {
    fadeTimer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        final batchCommand = widget.command;

        final foundResults = widget.results.where((result) =>
            batchCommand.commands.firstWhereOrNull(
                (command) => command.id.value == result.id.value) !=
            null);

        bool completed = foundResults.length == batchCommand.commands.length;
        bool containsErrors =
            foundResults.any((result) => result.errors.isNotEmpty) ||
                batchCommand.failedIds.isNotEmpty;

        if (completed && !containsErrors) {
          setState(() {
            fade = true;
          });
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    fadeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final batchCommand = widget.command;

    final foundResults = widget.results.where((result) =>
        batchCommand.commands.firstWhereOrNull(
            (command) => command.id.value == result.id.value) !=
        null);

    final resultsWithErrors =
        foundResults.where((result) => result.errors.isNotEmpty);
    bool containsErrors =
        resultsWithErrors.isNotEmpty || batchCommand.failedIds.isNotEmpty;
    int errorCount = resultsWithErrors.length;

    bool completed = foundResults.length == batchCommand.commands.length;

    CommandResultStatus status = CommandResultStatus.running;

    if (completed) {
      if (containsErrors) {
        status = CommandResultStatus.error;
      } else {
        status = CommandResultStatus.success;
      }
    }
    if (closed) {
      return const SizedBox.shrink();
    }

    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      onEnd: () {
        setState(() {
          closed = true;
        });
      },
      opacity: fade ? 0 : 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          batchCommand.commands.isEmpty
                              ? const Text(
                                  "Przetwarzanie",
                                  style: AppTypography.medium3,
                                )
                              : Text(
                                  "Przetwarzanie ${foundResults.length}/${batchCommand.commands.length}",
                                  style: AppTypography.medium3,
                                ),
                          const SizedBox(
                            width: 40,
                          ),
                          Builder(
                            builder: (context) {
                              switch (status) {
                                case CommandResultStatus.running:
                                  return const CircularProgressIndicator();
                                case CommandResultStatus.success:
                                  return const Icon(
                                    Icons.done,
                                    color: AppColors.green,
                                  );
                                case CommandResultStatus.error:
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.error_outline,
                                          color: AppColors.red),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              closed = true;
                                            });
                                          },
                                          icon:
                                              const Icon(Icons.cancel_outlined))
                                    ],
                                  );
                              }
                            },
                          )
                        ],
                      ),
                      errorCount > 0
                          ? Text(
                              "Liczba operacji zakończonych niepowodzeniem: $errorCount")
                          : const SizedBox.shrink(),
                      batchCommand.failedIds.isNotEmpty
                          ? Text(
                              "Liczba operacji odrzuconych: ${batchCommand.failedIds.length}")
                          : const SizedBox.shrink(),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
