import 'package:aroundix_design/design.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: PEdgeInsets.horizontal,
            child: Text(text,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall)),
        Space.vS3,
      ],
    );
  }
}
