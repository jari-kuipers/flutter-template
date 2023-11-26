import 'package:realm/realm.dart';

abstract class Dao<T extends RealmObject> {
  Realm? realm;

  Dao(SchemaObject schema) {
    realm = Realm(Configuration.local([schema]));
  }

  RealmResults<T> all() => realm!.all<T>();

  void insertAll(List<T> entities) =>
      realm!.write(() => realm!.addAll(entities));

  void close() {
    realm?.close();
    realm = null;
  }
}
