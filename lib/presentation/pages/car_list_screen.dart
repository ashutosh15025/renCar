import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentcar/presentation/widgets/car_card.dart';

import '../../data/models/car.dart';


class CarListScreen extends StatelessWidget {

  final List<Car> cars =[
    Car(model: 'Mahindra XUV 700', distance: 890, fuelCapacity: 50, pricePerHour: 30),
    Car(model: 'Mahindra XUV 500', distance: 2332, fuelCapacity: 40, pricePerHour: 20),
    Car(model: 'Tata Harrier', distance: 90, fuelCapacity: 70, pricePerHour: 80),
    Car(model: 'Tata Safari', distance: 1100, fuelCapacity: 80, pricePerHour: 60),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Choose Your Car",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount:cars.length,
          itemBuilder: (context,index){
          return CarCard(car: cars[index]);
          }),
    );
  }
}
