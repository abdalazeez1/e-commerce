import 'package:flutter/material.dart';

import '../../design.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RPadding(
          padding: EdgeInsets.all(8), child: CircularProgressIndicator()),
    );

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: const [
    //     Center(child: CircularProgressIndicator()),
    //   ],
    // );
  }
}
