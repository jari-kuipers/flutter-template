// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bikes_entity.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class BikeEntity extends _BikeEntity
    with RealmEntity, RealmObjectBase, RealmObject {
  BikeEntity(
    int id,
    int albumId,
    String title,
    String url,
    String thumbnailUrl,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'albumId', albumId);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'url', url);
    RealmObjectBase.set(this, 'thumbnailUrl', thumbnailUrl);
  }

  BikeEntity._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  int get albumId => RealmObjectBase.get<int>(this, 'albumId') as int;
  @override
  set albumId(int value) => RealmObjectBase.set(this, 'albumId', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get url => RealmObjectBase.get<String>(this, 'url') as String;
  @override
  set url(String value) => RealmObjectBase.set(this, 'url', value);

  @override
  String get thumbnailUrl =>
      RealmObjectBase.get<String>(this, 'thumbnailUrl') as String;
  @override
  set thumbnailUrl(String value) =>
      RealmObjectBase.set(this, 'thumbnailUrl', value);

  @override
  Stream<RealmObjectChanges<BikeEntity>> get changes =>
      RealmObjectBase.getChanges<BikeEntity>(this);

  @override
  BikeEntity freeze() => RealmObjectBase.freezeObject<BikeEntity>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(BikeEntity._);
    return const SchemaObject(
        ObjectType.realmObject, BikeEntity, 'BikeEntity', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('albumId', RealmPropertyType.int),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('url', RealmPropertyType.string),
      SchemaProperty('thumbnailUrl', RealmPropertyType.string),
    ]);
  }
}
