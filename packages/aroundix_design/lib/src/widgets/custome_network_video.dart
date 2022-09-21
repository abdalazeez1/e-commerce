// import 'package:elkood_responsive/elkood_responsive.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:visibility_detector/visibility_detector.dart';
//
// //https://github.com/flutter/flutter/issues/25558
// class CustomNetworkVideo extends StatefulWidget {
//   const CustomNetworkVideo(
//       {Key? key,
//       required this.url,
//       this.isSilent = false,
//       this.customController})
//       : super(key: key);
//   final String
//       url; //'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'
//   final bool isSilent;
//   final VideoPlayerController? customController;
//
//   @override
//   State<CustomNetworkVideo> createState() => _CustomNetworkVideoState();
// }
//
// class _CustomNetworkVideoState extends State<CustomNetworkVideo> {
//   late VideoPlayerController _controller;
//   bool disposeVideo = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = widget.customController ??
//         VideoPlayerController.network(
//           widget.url,
//         );
//
//     _controller.addListener(listener);
//     _controller.setLooping(true);
//     _controller.initialize().then((_) => setState(() {}));
//     _controller.play();
//     if (widget.isSilent) {
//       _controller.setVolume(0.0);
//     }
//   }
//
//   void listener() {
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _controller.value.isInitialized
//         ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: Stack(
//               alignment: Alignment.bottomCenter,
//               children: <Widget>[
//                 VisibilityDetector(
//                   key: Key('visible-video-${widget.url} -key--1'),
//                   onVisibilityChanged: (visibilityInfo) {
//                     var visiblePercentage =
//                         visibilityInfo.visibleFraction * 100;
//
//                     if (visiblePercentage < 1) {
//                       //the magic is done here
//                       if (disposeVideo == false) {
//                         _controller.pause();
//                       }
//                     } else {
//                       if (disposeVideo == false) {
//                         _controller.play();
//                       }
//                     }
//
//                     /// debugPrint(
//                     ///     'Widget ${visibilityInfo.key} is $visiblePercentage% visible');
//                   },
//                   child: VideoPlayer(_controller),
//                 ),
//                 _ControlsOverlay(controller: _controller),
//                 VideoProgressIndicator(
//                   _controller,
//                   allowScrubbing: true,
//                 ),
//               ],
//             ),
//           )
//         : const Center(child: CircularProgressIndicator());
//   }
//
//   @override
//   void dispose() {
//     print('dispose');
//     disposeVideo = true;
//     _controller.pause();
//     _controller.removeListener(listener);
//     _controller.dispose();
//     super.dispose();
//   }
//
// // @override
// // void deactivate() {
// //   print('deactivate');
// //   _controller.pause();
// //   _controller.removeListener(listener);
// //   _controller.dispose();
// //   super.deactivate();
// // }
// }
//
// class _ControlsOverlay extends StatelessWidget {
//   const _ControlsOverlay({Key? key, required this.controller})
//       : super(key: key);
//
//   static const List<Duration> _exampleCaptionOffsets = <Duration>[
//     Duration(seconds: -10),
//     Duration(seconds: -3),
//     Duration(seconds: -1, milliseconds: -500),
//     Duration(milliseconds: -250),
//     Duration(milliseconds: 0),
//     Duration(milliseconds: 250),
//     Duration(seconds: 1, milliseconds: 500),
//     Duration(seconds: 3),
//     Duration(seconds: 10),
//   ];
//   static const List<double> _examplePlaybackRates = <double>[
//     0.25,
//     0.5,
//     1.0,
//     1.5,
//     2.0,
//     3.0,
//     5.0,
//     10.0
//   ];
//
//   final VideoPlayerController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: const Duration(milliseconds: 50),
//           reverseDuration: const Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? const SizedBox.shrink()
//               : Container(
//                   color: Colors.black26,
//                   child: Center(
//                     child: Icon(
//                       Icons.play_arrow,
//                       color: Colors.white,
//                       size: 40.0.r,
//                       semanticLabel: 'Play',
//                     ),
//                   ),
//                 ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.value.isPlaying ? controller.pause() : controller.play();
//           },
//         ),
//
//         Positioned(
//           bottom: 0,
//           right: 0,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: () {
//                 controller.value.volume == 0.0
//                     ? controller.setVolume(5.0)
//                     : controller.setVolume(0.0);
//               },
//               child: AnimatedSwitcher(
//                 duration: const Duration(milliseconds: 50),
//                 reverseDuration: const Duration(milliseconds: 200),
//                 child: Container(
//                   color: Colors.black26,
//                   child: Center(
//                     child: Icon(
//                       controller.value.volume == 0.0
//                           ? Icons.volume_mute
//                           : Icons.volume_up,
//                       color: Colors.white,
//                       size: 30.r,
//                       semanticLabel: 'Play',
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//         // Align(
//         //   alignment: Alignment.topLeft,
//         //   child: PopupMenuButton<Duration>(
//         //     initialValue: controller.value.captionOffset,
//         //     tooltip: 'Caption Offset',
//         //     onSelected: (Duration delay) {
//         //       controller.setCaptionOffset(delay);
//         //     },
//         //     itemBuilder: (BuildContext context) {
//         //       return <PopupMenuItem<Duration>>[
//         //         for (final Duration offsetDuration in _exampleCaptionOffsets)
//         //           PopupMenuItem<Duration>(
//         //             value: offsetDuration,
//         //             child: Text('${offsetDuration.inMilliseconds}ms'),
//         //           )
//         //       ];
//         //     },
//         //     child: Padding(
//         //       padding: const EdgeInsets.symmetric(
//         //         // Using less vertical padding as the text is also longer
//         //         // horizontally, so it feels like it would need more spacing
//         //         // horizontally (matching the aspect ratio of the video).
//         //         vertical: 12,
//         //         horizontal: 16,
//         //       ),
//         //       child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
//         //     ),
//         //   ),
//         // ),
//         Align(
//           alignment: Alignment.topRight,
//           child: PopupMenuButton<double>(
//             initialValue: controller.value.playbackSpeed,
//             tooltip: 'Playback speed',
//             onSelected: (double speed) {
//               controller.setPlaybackSpeed(speed);
//             },
//             itemBuilder: (BuildContext context) {
//               return <PopupMenuItem<double>>[
//                 for (final double speed in _examplePlaybackRates)
//                   PopupMenuItem<double>(
//                     value: speed,
//                     child: Text('${speed}x'),
//                   )
//               ];
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 // Using less vertical padding as the text is also longer
//                 // horizontally, so it feels like it would need more spacing
//                 // horizontally (matching the aspect ratio of the video).
//                 vertical: 12,
//                 horizontal: 16,
//               ),
//               child: Text('${controller.value.playbackSpeed}x'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // void pushFullScreenVideo() {
// //
// // //This will help to hide the status bar and bottom bar of Mobile
// // //also helps you to set preferred device orientations like landscape
// //
// //   SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
// //   SystemChrome.setEnabledSystemUIOverlays([]);
// //   SystemChrome.setPreferredOrientations(
// //     [
// //       DeviceOrientation.portraitUp,
// //       DeviceOrientation.portraitDown,
// //       DeviceOrientation.landscapeLeft,
// //       DeviceOrientation.landscapeRight,
// //     ],
// //   );
// //
// // //This will help you to push fullscreen view of video player on top of current page
// //
// //   Navigator.of(navigatorKey.currentContext)
// //       .push(
// //     PageRouteBuilder(
// //       opaque: false,
// //       settings: RouteSettings(),
// //       pageBuilder: (
// //           BuildContext context,
// //           Animation<double> animation,
// //           Animation<double> secondaryAnimation,
// //           ) {
// //         return Scaffold(
// //             backgroundColor: Colors.transparent,
// //             resizeToAvoidBottomPadding: false,
// //             body: Dismissible(
// //             key: const Key('key'),
// //         direction: DismissDirection.vertical,
// //         onDismissed: (_) => Navigator.of(context).pop(),
// //         child: OrientationBuilder(
// //         builder: (context, orientation) {
// //         isPortrait = orientation == Orientation.portrait;
// //         return Center(
// //         child: Stack(
// //         //This will help to expand video in Horizontal mode till last pixel of screen
// //         fit: isPortrait ? StackFit.loose : StackFit.expand,
// //         children: [
// //         AspectRatio(
// //         aspectRatio: controller.value.aspectRatio,
// //         child: VideoPlayer(controller),
// //         ),
// //         ],
// //         ),
// //         );
// //         },
// //         );
// //       },
// //     ),
// //   )
// //       .then(
// //         (value) {
// //
// // //This will help you to set previous Device orientations of screen so App will continue for portrait mode
// //
// //       SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
// //       SystemChrome.setPreferredOrientations(
// //         [
// //           DeviceOrientation.portraitUp,
// //           DeviceOrientation.portraitDown,
// //         ],
// //       );
// //     },
// //   );
// // }
