import 'dart:async';

import 'package:ecommerce_web/domain/command/util/command_result.dart';
import 'package:ecommerce_web/domain/command/util/command_result_status.dart';
import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:flutter/material.dart';

class ProcessingCommandItem extends StatefulWidget {
  final String message;
  final CommandResult? result;
  const ProcessingCommandItem(
      {super.key, required this.message, required this.result});

  @override
  State<ProcessingCommandItem> createState() => _ProcessingCommandItemState();
}

class _ProcessingCommandItemState extends State<ProcessingCommandItem> {
  bool closed = false;
  bool fade = false;
  Timer? fadeTimer;

  @override
  void initState() {
    fadeTimer = Timer(
      const Duration(seconds: 5),
      () {
        if (widget.result?.status == CommandResultStatus.success) {
          setState(() {
            fade = true;
          });
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                          Text(
                            widget.message,
                            style: AppTypography.medium3,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Builder(
                            builder: (context) {
                              if (widget.result == null) {
                                return const CircularProgressIndicator();
                              }

                              switch (widget.result!.status) {
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
                      ...(widget.result?.errors ?? []).map(
                        (e) => Text(e.message),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
