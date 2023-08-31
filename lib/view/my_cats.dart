import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/models/fake_data.dart';
import '../gen/assets.gen.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size phoneSize = MediaQuery.of(context).size;
    double bodyMargin = phoneSize.width / 10;
    return Scaffold(
      backgroundColor: SolidColors.appBarBackGround,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: phoneSize.height / 10,
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
              SizedBox(
                width: double.infinity,
                height: 100,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: hashTagList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.2,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 || index == 1 ? bodyMargin : 0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedTagsList.add(hashTagList[index]);
                            hashTagList.removeAt(index);
                          });
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
                                  color: SolidColors.hashTag,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  hashTagList[index].title,
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
              SizedBox(
                width: double.infinity,
                height: 100,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: selectedTagsList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.2,
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
                          padding: const EdgeInsets.only(left: 22, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                selectedTagsList[index].title,
                                style: textTheme.bodyMedium,
                              ),
                              IconButton(
                                  color: Colors.grey,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      hashTagList.add(selectedTagsList[index]);
                                      selectedTagsList.removeAt(index);
                                    });
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
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text(MyStrings.continueButton))
            ]),
      ),
    );
  }
}
