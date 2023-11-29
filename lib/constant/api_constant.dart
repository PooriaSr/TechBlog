class ApiConstant {
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const hostDlUrl = "https://techblog.sasansafari.com";
  static const getHomeItems = "${baseUrl}home/?command=index";
  static const getTagsList = "${baseUrl}article/get.php?command=tags";
  static const getNewArticle =
      "${baseUrl}article/get.php?command=new&user_id=1";
  static const postRegisterUrl = "${baseUrl}register/action.php";
  static const publishedByMe =
      "${baseUrl}article/get.php?command=published_by_me&user_id=";
}
