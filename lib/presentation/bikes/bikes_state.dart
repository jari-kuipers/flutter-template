import 'package:hoegen_fietsverhuur/domain/models/bike.dart';

sealed class BikesState {
  const BikesState();
  List<Object> get props => [];
}

class BikesLoadingState extends BikesState {
  const BikesLoadingState();

  @override
  List<Object> get props => [];
}

class BikesLoadedState extends BikesState {
  List<Bike> bikes;

  BikesLoadedState({required this.bikes});

  @override
  List<Object> get props => [];
}

class BikesErrorState extends BikesState {
  const BikesErrorState();

  @override
  List<Object> get props => [];
}
