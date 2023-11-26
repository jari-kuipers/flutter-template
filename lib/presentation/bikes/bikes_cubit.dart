import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hoegen_fietsverhuur/domain/repository.dart';
import 'package:hoegen_fietsverhuur/presentation/bikes/bikes_state.dart';

class BikesCubit extends Cubit<BikesState> {
  final Repository repository;

  BikesCubit(this.repository) : super(const BikesLoadingState()) {
    load();
  }

  Future<void> load() async {
    try {
      emit(const BikesLoadingState());
      final bikes = await repository.loadBikes();
      emit(BikesLoadedState(bikes: bikes));
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
        print(s);
      }
      emit(const BikesErrorState());
    }
  }
}
