import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screen/root.dart';

class IconDrawer extends StatefulWidget {
  const IconDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<IconDrawer> createState() => _IconDrawerState();
}

class _IconDrawerState extends State<IconDrawer> {
  @override
  Widget build(BuildContext context) {


    return IconButton(
        icon: const Icon(
          FontAwesomeIcons.alignLeft,
        ),
        onPressed: ()async {
           z.toggle!(forceToggle: true);
           RootScreen.stateMenuScreen.currentState?.setState(() {

          });
        });
  }
}
