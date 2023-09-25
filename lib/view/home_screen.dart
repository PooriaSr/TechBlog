import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/constant/my_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.phoneSize,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size phoneSize;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomePagePoster(phoneSize: phoneSize, textTheme: textTheme),
          const SizedBox(
            height: 30,
            width: double.infinity,
          ),
          HomePageHashtag(
              phoneSize: phoneSize,
              bodyMargin: bodyMargin,
              textTheme: textTheme),
          const SizedBox(
            height: 40,
            width: double.infinity,
          ),
          HomePageMostHitBlogsTitle(
              bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          HomePageMostHitBlogs(
              phoneSize: phoneSize,
              bodyMargin: bodyMargin,
              textTheme: textTheme),
          const SizedBox(
            height: 35,
            width: double.infinity,
          ),
          HomePageMostHitPodcastTitle(
              bodyMargin: bodyMargin, textTheme: textTheme),
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          HomePageMostHitPodcast(
            phoneSize: phoneSize,
            bodyMargin: bodyMargin,
            textTheme: textTheme,
          ),
          const SizedBox(
            height: 60,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

class HomePageMostHitPodcast extends StatelessWidget {
  const HomePageMostHitPodcast(
      {super.key,
      required this.phoneSize,
      required this.bodyMargin,
      required this.textTheme});

  final Size phoneSize;
  final double bodyMargin;
  final TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: phoneSize.height / 4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: podcastList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 14),
              child: Column(
                children: [
                  FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: phoneSize.height / 6,
                          width: phoneSize.width / 2.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: NetworkImage(podcastList[index].image),
                                  fit: BoxFit.cover)),
                        );
                      }
                      return Container(
                        height: phoneSize.height / 6,
                        width: phoneSize.width / 2.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: SizedBox(
                              width: phoneSize.width / 5.6,
                              height: phoneSize.height / 12,
                              child: const CircularProgressIndicator()),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      podcastList[index].title,
                      style: textTheme.bodyMedium,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class HomePageMostHitPodcastTitle extends StatelessWidget {
  const HomePageMostHitPodcastTitle({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.microphon.provider(),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            MyStrings.viewMostHitPodcasts,
            style: textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}

class HomePageMostHitBlogs extends StatelessWidget {
  const HomePageMostHitBlogs({
    super.key,
    required this.phoneSize,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size phoneSize;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: phoneSize.height / 4.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 14),
            child: Column(
              children: [
                SizedBox(
                  width: phoneSize.width / 2.4,
                  height: phoneSize.height / 5.8,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(blogList[index].imageUrl),
                              fit: BoxFit.cover)),
                      foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: GradientColors.blogPost,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            blogList[index].writer,
                            style: textTheme.titleSmall,
                          ),
                          Row(
                            children: [
                              Text(blogList[index].views,
                                  style: textTheme.titleSmall),
                              const SizedBox(width: 10),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Icon(
                                  CupertinoIcons.eye_fill,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: SizedBox(
                      width: phoneSize.width / 2.5,
                      child: Text(
                        blogList[index].title,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium,
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomePageMostHitBlogsTitle extends StatelessWidget {
  const HomePageMostHitBlogsTitle({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: Row(
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
      ),
    );
  }
}

class HomePageHashtag extends StatelessWidget {
  const HomePageHashtag({
    super.key,
    required this.phoneSize,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size phoneSize;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: phoneSize.height / 22.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hashTagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 14),
            child: Container(
              height: phoneSize.height / 22.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                      colors: GradientColors.tags,
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 0, 8, 0),
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
          );
        },
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.phoneSize,
    required this.textTheme,
  });

  final Size phoneSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //PhotoPosterContainer
      Container(
        width: phoneSize.width / 1.19,
        height: phoneSize.height / 4.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: homePagePosterMap["imageAsset"].provider(),
              fit: BoxFit.cover),
        ),
        foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
                colors: GradientColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
      //TextsOnHomePoster
      Positioned(
        bottom: 40,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              homePagePosterMap['writer'] + " - " + homePagePosterMap['date'],
              style: textTheme.titleSmall,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "${homePagePosterMap['view']}  ",
                    style: textTheme.titleSmall,
                  ),
                ),
                const Icon(
                  CupertinoIcons.eye_fill,
                  size: 17,
                  color: Colors.white,
                )
              ],
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              homePagePosterMap['title'],
              style: textTheme.titleMedium,
            ),
          )),
    ]);
  }
}
