import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

class TogglePickImage extends StatelessWidget {
  const TogglePickImage({Key? key, required this.url, required this.isSelected})
      : super(key: key);
  final bool isSelected;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: PBorderRadius.borderRadiusAllM1,
          border:isSelected?
               Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5):null
              ),
      child: ClipRRect(
        borderRadius: PBorderRadius.borderRadiusAllM1,
        child: CustomImage(
          path: url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
