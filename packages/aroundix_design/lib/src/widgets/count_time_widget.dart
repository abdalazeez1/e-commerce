import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

//
class CountTimeWidget extends StatelessWidget {
  const CountTimeWidget(
      {Key? key,
      required this.endTime,
      this.onEndCountTime,
      required this.countdownTimerController,
      this.widgetBuilder})
      : super(key: key);
  final Widget Function(BuildContext, CurrentRemainingTime?)? widgetBuilder;
  final CountdownTimerController countdownTimerController;
  final Function()? onEndCountTime;
  final int endTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: CountdownTimer(
          controller: countdownTimerController,
          onEnd: onEndCountTime,
          widgetBuilder: widgetBuilder ??
              (BuildContext context, CurrentRemainingTime? time) {
                return time == null
                    ? const Text('finished Time')
                    : _CustomTimeWidget1(
                        time: time,
                      );
              },
          endTime: endTime,
        ),
      ),
    );
  }
}

class _CustomTimeWidget1 extends StatelessWidget {
  const _CustomTimeWidget1({Key? key, required this.time}) : super(key: key);
  final CurrentRemainingTime time;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        child: Text(
          getTime,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: Theme.of(context).colorScheme.primary),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  String get getTime =>
      '${time.days ?? 00} : ${time.hours ?? 00} : ${time.min ?? 00} : ${time.sec ?? 00}';
}
