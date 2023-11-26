import 'package:hoegen_fietsverhuur/domain/models/bike.dart';
import 'package:realm/realm.dart';

part 'bikes_entity.g.dart';

@RealmModel()
class _BikeEntity {
  @PrimaryKey()
  late int id;
  late int albumId;
  late String title;
  late String url;
  late String thumbnailUrl;
}

extension BikeEntityExtensions on BikeEntity {
  Bike toModel() {
    return Bike(
      id: id,
      albumId: albumId,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl,
    );
  }
}
