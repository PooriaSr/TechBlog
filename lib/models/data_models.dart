class HashTagModels {
  String title;

  HashTagModels({required this.title});
}

class BlogModel {
  int id;
  String imageUrl;
  String title;
  String writer;
  String writerImageUrl;
  String date;
  String content;
  String views;

  BlogModel(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.writer,
      required this.writerImageUrl,
      required this.date,
      required this.content,
      required this.views});
}

class PodcastModels {
  String title;
  String publisher;
  String image;

  PodcastModels({
    required this.title,
    required this.publisher,
    required this.image,
  });
}
