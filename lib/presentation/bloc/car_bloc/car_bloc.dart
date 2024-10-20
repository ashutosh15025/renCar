import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rentcar/domain/usecases/car_usecase.dart';

import '../../../data/models/car.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final CarUseCase carUseCase;
  CarBloc(this.carUseCase) : super(CarInitial()) {
    on<CarEvent>((event, emit) async {
     emit(CarsLoading());
     try{
        final cars = await carUseCase.getCars();
        emit(CarsLoaded(cars));
     }
     catch(e){
       emit(CarsError(e.toString()));
     }
    });
  }
}
