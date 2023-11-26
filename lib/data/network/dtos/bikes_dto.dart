import 'dart:convert';

import 'package:hoegen_fietsverhuur/data/db/entities/bikes_entity.dart';

List<BikesDto> bikesDtoFromJson(String str) =>
    List<BikesDto>.from(json.decode(str).map((x) => BikesDto.fromJson(x)));

String bikesDtoToJson(List<BikesDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BikesDto {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  BikesDto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory BikesDto.fromJson(Map<String, dynamic> json) => BikesDto(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}

extension BikesDtoExtensions on BikesDto {
  BikeEntity toEntity() => BikeEntity(id, albumId, title, url, thumbnailUrl);
}
