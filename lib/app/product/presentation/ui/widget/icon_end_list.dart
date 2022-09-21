import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

class IconEndList extends StatelessWidget {
  const IconEndList({Key? key, this.onTap}) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20.h,
        width: 20.h,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            shape: BoxShape.circle),
        child: const Center(
          child: FittedBox(
              fit: BoxFit.fill,
              child: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
