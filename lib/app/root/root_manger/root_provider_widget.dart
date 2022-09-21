import 'package:aroundix_store/app/root/root_manger/root_manger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootProvidersWidget extends StatelessWidget {
  final Widget root;

  const RootProvidersWidget({Key? key, required this.root}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => RootManger()..setContext(context),
      ),
    ], child: root);
  }
}
