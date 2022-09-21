// import 'package:e_learning/common/config/theme/src/colors.dart';
// import 'package:e_learning/generated/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import 'back_button.dart';
//
// class CustomAppBar extends StatelessWidget {
//   final Color? color;
//   final List<Color>? colors;
//   final double? space;
//   final Offset? offsetLayer1;
//   final Offset? offsetLayer2;
//   final double height;
//   final double spaceHorizontal;
//   final double spaceTop;
//   const CustomAppBar(
//       {Key? key,
//       this.height = 200,
//       this.color,
//       this.colors,
//       this.offsetLayer1,
//       this.offsetLayer2,
//       this.spaceTop = 20,
//       this.spaceHorizontal = 20,
//       this.space})
//       : assert(colors != null || color != null),
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: CustomPaint(
//               child: Container(),
//               foregroundPainter: _MyPainter(
//                   color: color,
//                   colors: colors,
//                   offsetLayer1: offsetLayer1,
//                   offsetLayer2: offsetLayer2,
//                   space: space ?? 20),
//             ),
//           ),
//           Positioned(
//             child: AppBackButton(
//                 colors: [AppColors.white, AppColors.white],
//                 colorIcon: AppColors.blue),
//             top: spaceTop,
//             right: spaceHorizontal,
//           ),
//           Positioned(
//             child: Column(
//               children: [
//                 const Text(
//                   'الدروس',
//                   style: TextStyle(
//                       color: AppColors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24),
//                   textAlign: TextAlign.center,
//                 ),
//                 RichText(
//                   text: const TextSpan(
//                     children: [
//                       TextSpan(text: ' الصف الأول'),
//                       TextSpan(text: '-'),
//                       TextSpan(text: 'الرياضيات'),
//                     ],
//                     style: TextStyle(
//                         color: AppColors.white,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//             right: 0,
//             left: 0,
//             top: height / 10,
//           ),
//           Positioned(
//             top: spaceTop,
//             left: spaceHorizontal,
//             child: Container(
//                 height: 60,
//                 width: 60,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                     color: AppColors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                           offset: const Offset(4, 8),
//                           color: AppColors.shadow.withOpacity(.3),
//                           blurRadius: 16)
//                     ]),
//                 child: SvgPicture.asset(
//                   Assets.iconsSubject,
//                   color: AppColors.blue,
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class _MyPainter extends CustomPainter {
//   final Color? color;
//   final List<Color>? colors;
//   final double space;
//   final Offset? offsetLayer1;
//   final Offset? offsetLayer2;
//
//   _MyPainter(
//       {this.color,
//       this.colors,
//       this.offsetLayer1,
//       this.offsetLayer2,
//       required this.space});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path = Path();
//
//     ///Paint Object
//
//     Paint paint1 = Paint()
//       ..color = (color ?? colors?[0])!
//       ..strokeCap = StrokeCap.round;
//     Paint paint2 = Paint()
//       ..color = (color ?? colors?[1])!.withOpacity(.2)
//       ..strokeCap = StrokeCap.round;
//     Paint paint3 = Paint()
//       ..color = (color ?? colors?[0])!.withOpacity(.4)
//       ..strokeCap = StrokeCap.round;
//
//     ///Path
//     path.lineTo(0, size.height);
// //  (0 , h) =>first point control (8 ,h-22) => (20, h-25)
//     path.quadraticBezierTo(
//         8, size.height - (space * 2.2), space * 2, size.height - (space * 2.5));
//
//     // (w/2-10, h-45) =>second point control (w/2,h-48) => (w/2+10,h-45 )
//     path.lineTo(size.width / 2 - (space), size.height - (space * 4.5));
//     path.quadraticBezierTo(size.width / 2, size.height - (space * 4.8),
//         size.width / 2 + (space), size.height - (space * 4.5));
//
//     // (w-20 ,h-25) => third point control(w-8,h-22) =>(w,h)
//     path.lineTo(size.width - (space * 2), size.height - (space * 2.5));
//
//     path.quadraticBezierTo(
//         size.width - 8, size.height - (space * 2.2), size.width, size.height);
//
//     path.lineTo(size.width, 0);
//
//     ///draw
//     canvas.drawPath(path, paint1);
//     canvas.drawPath(path.shift(offsetLayer1 ?? const Offset(0, 5)), paint2);
//     canvas.drawPath(path.shift(offsetLayer2 ?? const Offset(0, 10)), paint3);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
