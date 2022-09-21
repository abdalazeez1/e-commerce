// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
//
// class StatusBarService {
//   static Future<void> hideStatusBar(BuildContext context) async {
//     await SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
//     // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
//     //   SystemUiOverlay.bottom
//     // ]);  // to hide only bottom bar
//   }
//
//   static Future<void> showStatusBar(BuildContext context) async {
//     var s = S.of(context);
//     EasyLoading.showToast(s.loading);
//     await SystemChrome.setEnabledSystemUIMode(
//       SystemUiMode.manual,
//       overlays: SystemUiOverlay.values,
//     );
//     EasyLoading.dismiss();
//   }
// }
