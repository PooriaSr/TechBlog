import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/controller/my_cats_controller.dart';
import '../../gen/assets.gen.dart';

class MyCatsScreen extends StatelessWidget {
  MyCatsScreen({super.key});
  final myCatsController = Get.find<MyCatsController>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size phoneSize = MediaQuery.of(context).size;
    double bodyMargin = phoneSize.width / 10;
    return Scaffold(
      backgroundColor: SolidColors.backGround,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              Assets.images.tcbot.path,
              height: phoneSize.height / 7,
            ),
            const SizedBox(height: 20),
            Text(
              MyStrings.successfullRegistertion,
              style: textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
              child: TextField(
                controller: myCatsController.nameTextEditingController,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: MyStrings.nameTextFieldHint,
                    hintStyle: textTheme.labelSmall),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              MyStrings.yourFavCats,
              style: textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            //TagsGridView
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 100,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: myCatsController.tagsList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.19,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 || index == 1 ? bodyMargin : 0),
                      child: InkWell(
                        onTap: () {
                          if (myCatsController.selectedTagsList
                              .contains(myCatsController.tagsList[index])) {
                          } else {
                            myCatsController.selectedTagsList
                                .add(myCatsController.tagsList[index]);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: const LinearGradient(
                                  colors: GradientColors.tags,
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22, right: 12),
                            child: Row(
                              children: [
                                ImageIcon(
                                  Assets.icons.hashtagicon.provider(),
                                  size: 14,
                                  color: SolidColors.tags,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  myCatsController.tagsList[index].title!,
                                  style: textTheme.titleSmall,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(
              height: 22,
            ),
            Image(
              image: Assets.icons.downCatArrow.provider(),
              height: phoneSize.height / 15,
            ),
            const SizedBox(
              height: 22,
            ),
            //SelectedTagGridView
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 100,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: myCatsController.selectedTagsList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.17,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 || index == 1 ? bodyMargin : 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: SolidColors.surface),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                myCatsController.selectedTagsList[index].title!,
                                style: textTheme.bodyMedium,
                              ),
                              IconButton(
                                  color: Colors.grey,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    myCatsController.selectedTagsList
                                        .removeAt(index);
                                  },
                                  icon: const Icon(CupertinoIcons.delete)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            ElevatedButton(
                onPressed: () {
                  if (myCatsController.nameTextEditingController.text != '') {
                    myCatsController.setName();
                  }
                },
                child: const Text(MyStrings.continueButton))
          ]),
        ),
      ),
    );
  }
}
