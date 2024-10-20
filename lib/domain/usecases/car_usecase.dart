import 'package:rentcar/domain/repositories/car_repository.dart';

import '../../data/models/car.dart';

class CarUseCase{
  final CarRepository repository;
  CarUseCase(this.repository);


  Future<List<Car>> getCars() async {
    return await repository.fetchCars();
  }
}