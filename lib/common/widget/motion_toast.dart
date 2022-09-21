import 'dart:ui';

import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

enum ContentType {
  success(color: Colors.teal),
  warning(color: Colors.red),
  failure(color: Colors.red),
  help(color: Colors.blueGrey);

  const ContentType({required this.color});

  final Color color;
}

///W fro Warning  m Motion
showToast({
  required BuildContext context,
  required String text,
   String description='',
  required ContentType contentType,
}) {
  FocusScope.of(context).unfocus();
  final snackBar = SnackBar(
      elevation: 3,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      padding: REdgeInsets.symmetric(vertical: 24, horizontal: 8),
      content: ClipRRect(
        borderRadius: PBorderRadius.borderRadiusAllM1,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: REdgeInsets.all(8),
            color: contentType.color.withOpacity(.7),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Flexible(
                    child: Text(
                      description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ));
  ScaffoldMessenger.of(context).clearSnackBars();
  Future.delayed(const Duration(), () =>
      ScaffoldMessenger.of(context).showSnackBar(snackBar)
  );
}
// MotionToast.warning(
//   title: Text(text),
//
//   description: Text(description),
// ).show(context);

// showToastS(
//         {required BuildContext context,
//         required String text,
//         required String description}) =>
//     MotionToast.success(
//       title: Text(
//         text,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//       ),
//       description: FittedBox(
//           child: Text(
//         description,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 3,
//       )),
//     ).show(context);
//
// showToastE(
//         {required BuildContext context,
//         required String text,
//         required String description}) =>
//     MotionToast.error(
//       title: Text(text),
//       description: Text(description),
//     ).show(context);
//
// showToastD(
//         {required BuildContext context,
//         required String text,
//         required String description}) =>
//     MotionToast.delete(
//       title: Text(text),
//       description: Text(description),
//     ).show(context);
//
// showToastI(
//         {required BuildContext context,
//         required String text,
//         required String description}) =>
//     MotionToast.info(
//       title: Text(text),
//       description: Text(description),
//     ).show(context);
