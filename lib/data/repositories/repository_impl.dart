import 'package:hoegen_fietsverhuur/data/db/daos/bikes_dao.dart';
import 'package:hoegen_fietsverhuur/data/db/entities/bikes_entity.dart';
import 'package:hoegen_fietsverhuur/data/network/datasources/bikes_datasource.dart';
import 'package:hoegen_fietsverhuur/data/network/dtos/bikes_dto.dart';
import 'package:hoegen_fietsverhuur/domain/models/bike.dart';
import 'package:hoegen_fietsverhuur/domain/repository.dart';

class RepositoryImpl implements Repository {
  final BikesDataSource dataSource;

  RepositoryImpl(this.dataSource);

  @override
  Future<List<Bike>> loadBikes({bool forceReload = false}) async {
    final bikeDao = BikeDao();
    var entities = bikeDao.all();
    if (entities.isEmpty || forceReload) {
      final dtos = await dataSource.getBikes();
      final newEntities = dtos.map((e) => e.toEntity()).toList();
      bikeDao.insertAll(newEntities);
      entities = bikeDao.all();
    }
    final models = entities.map((e) => e.toModel()).toList();
    bikeDao.close();
    return models;
  }
}
