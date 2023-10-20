import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../gen/assets.gen.dart';
import 'my_colors.dart';
import 'my_strings.dart';
import 'dart:developer' as developer;

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

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    developer.log("link could not launch $url");
  }
}

class SpinKitLoading extends StatelessWidget {
  const SpinKitLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
      size: 30,
      color: SolidColors.primaryColor,
    );
  }
}
