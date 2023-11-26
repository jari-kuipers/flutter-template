import 'package:hoegen_fietsverhuur/data/db/daos/dao.dart';
import 'package:hoegen_fietsverhuur/data/db/entities/bikes_entity.dart';

class BikeDao extends Dao<BikeEntity> {
  BikeDao() : super(BikeEntity.schema);
}
