import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../gen/assets.gen.dart';
import 'my_colors.dart';
import 'dart:developer' as developer;

import 'my_text_style.dart';

class BluePenIconTextTitleTechBlog extends StatelessWidget {
  const BluePenIconTextTitleTechBlog({super.key, required this.title});
  final String title;
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
        Text(title, style: MyTextStyle.bluePenTitles)
      ],
    );
  }
}

class GreyDividerTechBlog extends StatelessWidget {
  const GreyDividerTechBlog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      thickness: 1,
      indent: Get.width / 6,
      endIndent: Get.width / 6,
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

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: SafeArea(
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Center(
                  child: Text(title, style: MyTextStyle.appBarTextStyle)),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: SolidColors.primaryColor.withAlpha(120)),
                child: const Icon((Icons.arrow_back)),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class ErrorImage extends StatelessWidget {
  const ErrorImage({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: const Color.fromARGB(255, 235, 233, 233), width: 1.5)),
      child: const Icon(
        Icons.image_not_supported_outlined,
        color: Colors.grey,
        size: 50,
      ),
    );
  }
}
