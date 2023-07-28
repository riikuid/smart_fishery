class BelajarModel {
  late String id;
  late String title;
  late String description;
  late String linkYt;
  late String thumbnailYt;

  BelajarModel({
    required this.id,
    required this.title,
    required this.description,
    required this.linkYt,
    required this.thumbnailYt,
  });

  BelajarModel.fromJson(Map<String, dynamic> json) {
    id = json['id_event'];
    title = json['title'];
    description = json['description'];
    linkYt = json['link_yt'];
    thumbnailYt = json['thumbnail_yt'];
  }
}
