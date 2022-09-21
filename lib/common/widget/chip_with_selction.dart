import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

class ChipWithSelection extends StatelessWidget {
  const ChipWithSelection(
      {Key? key,this.fontSize, required this.text,this.onTap,this.size, this.isSelected = true,this.padding,this.colorSelected})
      : super(key: key);
  final bool isSelected;
  final String text;
  final EdgeInsets? padding;
  final List<Color>? colorSelected;
final VoidCallback? onTap;
final Size? size;
final  double? fontSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RPadding(
        padding: padding ??REdgeInsets.symmetric(horizontal: 4),

        child: Material(
          borderRadius: PBorderRadius.borderRadiusAllM2,
          clipBehavior: Clip.antiAlias,elevation: 2,

          child: Container(
            height: size?.height.h,
            width: size?.width.w,
            padding: REdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.deepPurple.withOpacity(.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 3)),
                BoxShadow(
                    color: Colors.blue.withOpacity(.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(-3, 0)),
              ],
              gradient: isSelected
                  ?  LinearGradient(
                  colors:colorSelected?? [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
                  : const LinearGradient(
                  colors: [Colors.white30, Colors.white54],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)
              ,
              // color: isSelected ? Colors.blue : Colors.white,
              border: isSelected
                  ? null
                  : Border.all(color: Theme.of(context).disabledColor, width: .5),
              borderRadius: PBorderRadius.borderRadiusAllM2,
            ),
            child: FittedBox(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: isSelected ? Colors.white : Colors.black87,fontSize: fontSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
