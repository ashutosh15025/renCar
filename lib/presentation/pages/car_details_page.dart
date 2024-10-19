import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentcar/data/data_models/car.dart';
import 'package:rentcar/presentation/widgets/car_card.dart';
import 'package:rentcar/presentation/widgets/car_history_card.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text("Information")
          ],
        ),

      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            CarCard(car: Car(model: 'Tata Safari', distance: 1100, fuelCapacity: 80, pricePerHour: 60)),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0xffF3F3F3),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5
                          )]
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(radius: 40,backgroundImage: AssetImage('assets/user.png'),),
                          SizedBox(height: 10,),
                          Text("Ashutosh Hada",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text('\$4,524',style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage('assets/maps.png'),
                              fit:BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 10
                            )
                          ]
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Past Rides", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                  CarHistoryCard(),
                  CarHistoryCard(),
                CarHistoryCard()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
