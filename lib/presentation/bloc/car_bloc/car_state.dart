part of 'car_bloc.dart';

@immutable
sealed class CarState {}

final class CarInitial extends CarState {}


class CarsLoading extends CarState{}
class CarsLoaded extends CarState{
  final List<Car> car;
  CarsLoaded(this.car);
}

class CarsError extends CarState{
  final String error;
  CarsError(this.error);
}


