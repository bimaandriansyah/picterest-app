// To parse this JSON data, do
//
//     final imageItem = imageItemFromJson(jsonString);

import 'dart:convert';

ImageItem imageItemFromJson(String str) => ImageItem.fromJson(json.decode(str));

String imageItemToJson(ImageItem data) => json.encode(data.toJson());

class ImageItem {
  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  ImageItem({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json) => ImageItem(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}
