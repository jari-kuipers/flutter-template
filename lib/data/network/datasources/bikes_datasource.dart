import 'package:hoegen_fietsverhuur/data/network/backend.dart';
import 'package:hoegen_fietsverhuur/data/network/dtos/bikes_dto.dart';

abstract interface class BikesDataSource {
  Future<List<BikesDto>> getBikes();
}

class BikesDataSourceImpl implements BikesDataSource {
  final backend = BackendImpl();

  @override
  Future<List<BikesDto>> getBikes() async {
    return await backend.get<List<BikesDto>>(
      'https://jsonplaceholder.typicode.com/photos',
      (json) => bikesDtoFromJson(json),
    );
  }
}
