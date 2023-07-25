class VideoModel {
  late int id;
  late String title;
  late String description;
  late String linkYt;
  late String thumbnailYt;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.linkYt,
    required this.thumbnailYt,
  });

  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id_event'];
    title = json['title'];
    description = json['description'];
    linkYt = json['link_yt'];
    thumbnailYt = json['thumbnail_yt'];
  }
}
