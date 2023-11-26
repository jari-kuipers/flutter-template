import 'package:hoegen_fietsverhuur/domain/models/bike.dart';

abstract interface class Repository {
  Future<List<Bike>> loadBikes({bool forceReload = false});
}
