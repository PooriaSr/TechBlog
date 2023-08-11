import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import 'my_colors.dart';
import 'my_strings.dart';

class BluePenIconTextTitleTechBlog extends StatelessWidget {
  const BluePenIconTextTitleTechBlog({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          Assets.icons.bluePen.provider(),
          color: SolidColors.seeMore,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          MyStrings.viewMostHitPosts,
          style: textTheme.bodySmall,
        )
      ],
    );
  }
}

class GreyDividerTechBlog extends StatelessWidget {
  const GreyDividerTechBlog({
    super.key,
    required this.phoneSize,
  });

  final Size phoneSize;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      thickness: 1,
      indent: phoneSize.width / 6,
      endIndent: phoneSize.width / 6,
    );
  }
}
