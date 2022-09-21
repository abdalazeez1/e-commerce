import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({
    Key? key,
    this.onTap,
    this.color,
    this.icon,
    this.child,
    required this.text,
  }) : super(key: key);
  final String text;
  final Color? color;
  final VoidCallback? onTap;
  final Icon? icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: PBorderRadius.borderRadiusAllM1,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Space.vS3,
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                padding: REdgeInsets.symmetric(
                  horizontal: 0,
                ),
              ),
              icon: child ??
                  Icon(icon?.icon,
                      color: icon?.color ?? color?.withOpacity(.7)),
              onPressed: onTap,
              label: Text(
                text,
                style:
                Theme.of(context).textTheme.button?.copyWith(color: color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
