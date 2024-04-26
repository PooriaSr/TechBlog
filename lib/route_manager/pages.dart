import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tech_blog/route_manager/binding.dart';
import 'package:tech_blog/route_manager/named_route.dart';
import 'package:tech_blog/view/article/article_content_editor.dart';
import 'package:tech_blog/view/article/article_list_screen.dart';
import 'package:tech_blog/view/article/manage_article_screen.dart';
import 'package:tech_blog/view/article/single_article_screen.dart';
import 'package:tech_blog/view/article/write_article_screen.dart';
import 'package:tech_blog/view/main/main_screen.dart';
import 'package:tech_blog/view/podcast/podcast_list_screen.dart';
import 'package:tech_blog/view/podcast/single_podcast_screen.dart';
import 'package:tech_blog/view/register/my_cats_screen.dart';
import 'package:tech_blog/view/splash_screen.dart';

class Pages {
  Pages._();

  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NamedRoute.initalRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
        name: NamedRoute.mainScreen,
        page: () => const MainScreen(),
        bindings: [MainBinding(), RegisterBinding()]),
    GetPage(
        name: NamedRoute.articleScreen,
        page: () => ArticleListScreen(),
        binding: ArticleBinding()),
    GetPage(
        name: NamedRoute.singleArticleScreen,
        page: () => SingleArticleScreen()),
    GetPage(
        name: NamedRoute.myCatsScreen,
        page: () => MyCatsScreen(),
        binding: CatsBinding()),
    GetPage(
        name: NamedRoute.manageArticleScreen,
        page: () => ManageArticleScreen(),
        binding: ManageArticleBinding()),
    GetPage(
        name: NamedRoute.writeArticleScreen,
        page: () => WriteArticleScreen(),
        binding: ManageArticleBinding()),
    GetPage(
        name: NamedRoute.articleContentEditor,
        page: () => const ArticleContentEditor()),
    GetPage(
        name: NamedRoute.podcastListScreen, page: () => PodcastListScreen()),
    GetPage(
        name: NamedRoute.singlePodcastScreen,
        page: () => SinglePodcastScreen(),
        binding: ManagePodcastBinding())
  ];
}
