import 'package:flutter/material.dart';
import '../page_state/page_state.dart';
import '../exceptions/exceptions.dart';
class PageStateBuilder<T> extends StatelessWidget {
  const PageStateBuilder(
      {Key? key,
      required this.init,
      required this.success,
      required this.loading,
      required this.error,
      required this.result,
      required this.empty})
      : super(key: key);

  final PageState<T> result;
  final Widget Function() init;
  final Widget Function() loading;
  final Widget Function(T data) success;
  final Widget Function(AppException message,String error ) error;
  final Widget Function() empty;

  @override
  Widget build(BuildContext context) {
    late final Widget next;
    result.when(
      init: () => next = init(),
      loading: () => next = loading(),
      loaded: (data) => next = success(data),
      error: (message,e) => next = error(message,e),
      empty: () => next = empty(),
    );
    return next;
  }
}
