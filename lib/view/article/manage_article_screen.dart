import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_components.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/constant/my_text_style.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class ManageArticleScreen extends StatelessWidget {
  const ManageArticleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool test = false;
    return Scaffold(
      appBar: appBar(MyStrings.manageArticles),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: Get.height / 1.4,
                child: test == true ? state1() : state2()),
            const SizedBox(
              height: 16,
            ),
            TextButton(
                onPressed: () {},
                child: Container(
                    height: 60,
                    width: Get.width / 1.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: SolidColors.primaryColor),
                    child: Center(
                      child: Text(
                        MyStrings.letsGoWriteAnArticle,
                        style: MyTextStyle.manageArticleScreenBtn,
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  Column state1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.images.tcbot.path,
          height: Get.height / 7,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(MyStrings.manageArticleScreenText,
              style: MyTextStyle.articleTitles, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

SizedBox state2() {
  return SizedBox(
    child: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(children: [
          CachedNetworkImage(
            imageUrl: "",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: imageProvider)),
            ),
            placeholder: (context, url) => const SpinKitLoading(),
            errorWidget: (context, url, error) => const ErrorImage(),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: Get.width / 1.5,
            child: const Column(
              children: [
                Text(
                  "راز های اساسنیز کرید والهالا از هری پاتر و ارباب حلقه ها تا دارک سولز",
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text("ملیکا عزیزی"),
                    Text("بازدید ۲۳۵"),
                    Text('تایید شده')
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    ),
  );
}
