import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rentcar/data/datasources/firebase_car_data_source.dart';
import 'package:rentcar/data/repositories/car_repository_impl.dart';
import 'package:rentcar/domain/repositories/car_repository.dart';
import 'package:rentcar/domain/usecases/car_usecase.dart';
import 'package:rentcar/presentation/bloc/car_bloc/car_bloc.dart';

GetIt getIt = GetIt.instance;

void initInjection(){
  try{
    getIt.registerLazySingleton<FirebaseFirestore>(()=>FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(()=>FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<CarRepository>(()=>CarRepositoryImpl(getIt<FirebaseCarDataSource>()));
    getIt.registerLazySingleton<CarUseCase>(()=>CarUseCase(getIt<CarRepository>()));
   getIt.registerFactory(()=>CarBloc(getIt<CarUseCase>()));
  }
  catch(e){
    throw e;
  }
}