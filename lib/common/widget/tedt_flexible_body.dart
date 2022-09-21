import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

import '../../../../../common/const/const/constant.dart';

class TextFlexibleBody extends StatelessWidget {
  const TextFlexibleBody({Key? key, this.flex = 2, this.text})
      : super(key: key);
  final int flex;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: LayoutConstrains.s3),
        child: Text(
          text ?? fakeString,
          maxLines: 2,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
