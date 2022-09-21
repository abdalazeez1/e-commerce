// import 'package:e_learning/common/config/theme/src/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:package_info_plus/package_info_plus.dart';
//
// class VersionWidget extends StatelessWidget {
//   const VersionWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _version(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return Text(
//             'VER ${(snapshot.data as String)}',
//             textAlign: TextAlign.center,
//             style: const TextStyle(color: AppColors.white),
//           );
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
//
//   Future<String> _version() async {
//     return (await PackageInfo.fromPlatform()).version;
//   }
// }
