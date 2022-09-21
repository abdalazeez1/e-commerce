import 'package:get_it/get_it.dart';

import 'features.dart';

final si = GetIt.I;

Future<void> inject(context) async {
  await common(context);
  await user();
  await products();
  await profile();
}
