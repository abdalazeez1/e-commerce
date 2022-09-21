// import 'package:elkood_responsive/elkood_responsive.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// import '../constant/src/const_enum.dart';
// import 'custom_network_image.dart';
// import 'custome_network_video.dart';
//
// class DisplayMedia extends StatelessWidget {
//   const DisplayMedia(
//       {Key? key,
//       this.color,
//       this.height = 142,
//       this.margin,
//       this.fit,
//       required this.url,
//       this.child,
//       this.videoPlayerController,
//       this.type = MediaType.video})
//       : super(key: key);
//   final Color? color;
//   final MediaType type;
//   final Widget? child;
//   final BoxFit? fit;
//   final double height;
//   final EdgeInsets? margin;
//   final VideoPlayerController? videoPlayerController;
//   final String url;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: margin ?? REdgeInsets.only(left: 14, right: 14, bottom: 30),
//         decoration: BoxDecoration(
//             color: color ?? const Color(0xff985CFF).withOpacity(.5),
//             borderRadius: BorderRadius.circular(10)),
//         height: height.h,
//         child: getByTypeMedia(MediaType.image, url));
//   }
//
//   getByTypeMedia(MediaType type, String url) {
//     switch (type) {
//       case MediaType.image:
//         return CustomNetworkImage(
//           viewFullImageWhenClick: true,
//           url: url,
//           fit: fit,
//         );
//       case MediaType.video:
//         return CustomNetworkVideo(
//           url: url,
//           isSilent: true,
//           customController: videoPlayerController,
//         );
//       case MediaType.none:
//         // TODO: Handle this case.
//         break;
//
//       case MediaType.audio:
//         // TODO: Handle this case.
//         break;
//       case MediaType.pdf:
//         // TODO: Handle this case.
//         break;
//       case MediaType.other:
//         // TODO: Handle this case.
//         break;
//     }
//   }
// }
