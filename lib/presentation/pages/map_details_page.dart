import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../data/models/car.dart';


class MapDetailsPage extends StatelessWidget {
  const MapDetailsPage({super.key, required this.car});
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_sharp)),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(22.7330,75.8934),
              initialZoom: 13
            ), children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ["a","b","c"],
              )
          ],
          ),
          Positioned(
              bottom: 0,
          left: 0,
              right: 0,
              child: carDetailsCard(car))
        ],
      )

    );
  }

}

Widget carDetailsCard(Car car){
  return SizedBox(
    height: 350,
    child: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 20),
          width: double.infinity,
          decoration:BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 10
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text('${car.model}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(Icons.directions_car,color: Colors.white,size:16),
                  SizedBox(width: 5,),
                  Text('> distance km',
                    style: TextStyle(fontSize: 14,color: Colors.white),),
                  SizedBox(width: 10,),
                  Icon(Icons.battery_full,color: Colors.white,size:16),
                  SizedBox(width: 5,),
                  Text('> ${car.fuelCapacity} L',
                    style: TextStyle(fontSize: 14,color: Colors.white),),

                ],
              )
            ],
          ),

        ),
        Positioned(
          bottom: 0,
            left:0,
            right: 0,
            child: Container(
              padding:EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Features',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                  featureIcons(),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${car.pricePerHour}/day',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                          child: Text('Book Now',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),)

                    ],
                  )
                ],
              ),
            )),
        Positioned(
            right: 10,
            top:50,
            child: Image.asset('assets/white_car.png'))
      ],
    ),
  );
}

Widget featureIcons(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station,'Diesel','Commom Rail'),
      featureIcon(Icons.speed,'Acceloration','0-100km/s'),
      featureIcon(Icons.ac_unit,'Cold','Temp Control')
    ],
  );
}

Widget featureIcon(IconData icon,String title, String subtitle){
  return Container(
    width: 100,
    height: 100,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border:Border.all(color: Colors.grey,width:1)
    ),
    child: Column(
      children: [
        Icon(icon,size: 28,),
        Text(title),
        Text(
          subtitle,
          style: TextStyle(color: Colors.grey,fontSize:10),
        )
      ],
    ),
  );
}
