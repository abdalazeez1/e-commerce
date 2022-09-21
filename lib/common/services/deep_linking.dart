// import 'dart:async';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // import 'package:uni_links/uni_links.dart';
//
// class DeepLinking {
//   Uri? _initialUri;
//   Uri? _latestUri;
//   bool _initialUriIsHandled = false;
//
//   // final queryParams = _latestUri?.queryParametersAll.entries.toList();
//   Object? _err;
//   final BuildContext context;
//
//   DeepLinking({required this.context});
//
//   /// Handle incoming links - the ones that the app will receive from the OS
//   /// while already started.
//   StreamSubscription<Uri?>? handleIncomingLinks(
//       {required Function(Uri uri) onchange}) {
//     if (!kIsWeb) {
//       // It will handle app links while the app is already started - be it in
//       // the foreground or in the background.
//       return uriLinkStream.listen((Uri? uri) {
//         print('got uri: $uri');
//         if (uri != null) {
//           onchange(uri);
//         }
//         _latestUri = uri;
//         _err = null;
//       }, onError: (Object err) {
//         print('got err: $err');
//         _latestUri = null;
//         if (err is FormatException) {
//           _err = err;
//         } else {
//           _err = null;
//         }
//       });
//     }
//     return null;
//   }
//
//   /// Handle the initial Uri - the one the app was started with
//   ///
//   /// **ATTENTION**: `getInitialLink`/`getInitialUri` should be handled
//   /// ONLY ONCE in your app's lifetime, since it is not meant to change
//   /// throughout your app's life.
//   ///
//   /// We handle all exceptions, since it is called from initState.
//   Future<void> handleInitialUri() async {
//     // In this example app this is an almost useless guard, but it is here to
//     // show we are not going to call getInitialUri multiple times, even if this
//     // was a weidget that will be disposed of (ex. a navigation route change).
//     if (!_initialUriIsHandled) {
//       _initialUriIsHandled = true;
//       print('_handleInitialUri called');
//       // _showSnackBar('_handleInitialUri called');
//       try {
//         final uri = await getInitialUri();
//         if (uri == null) {
//           print('no initial uri');
//         } else {
//           print('got initial uri: $uri');
//         }
//       } on PlatformException {
//         // Platform messages may fail but we ignore the exception
//         print('falied to get initial uri');
//       } on FormatException {
//         print('malformed initial uri');
//       }
//     } else {
//       print('handle before');
//     }
//   }
//
// //
// // void _showSnackBar(String msg) {
// //   WidgetsBinding.instance.addPostFrameCallback((_) {
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //       content: Text(msg),
// //     ));
// //   });
// // }
// }
