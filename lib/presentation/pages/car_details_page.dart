import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rentcar/presentation/pages/map_details_page.dart';
import 'package:rentcar/presentation/widgets/car_card.dart';
import 'package:rentcar/presentation/widgets/car_history_card.dart';

import '../../data/models/car.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key, required this.car});
  final Car car;

  @override
  State<StatefulWidget> createState() => _CarDetailsPage();
}

class _CarDetailsPage extends State<CarDetailsPage> with SingleTickerProviderStateMixin{

  AnimationController ? _controller;
  Animation<double>? _animation;


  @override
  void initState() {
   _controller = AnimationController(
       duration:Duration(seconds: 3),
       vsync: this);
   _animation = Tween<double>(begin: 1.0,end: 1.5).animate(_controller!)..addListener((){
     setState(() {

     });
   });
   _controller!.forward();
    super.initState();
  }
  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

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
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MapDetailsPage(car:widget.car )));
                      },
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 5,
                                  blurRadius: 10
                              )
                            ]
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Transform.scale(
                            scale:_animation!.value,
                            alignment: Alignment.center,
                            child: Image.asset('assets/maps.png',fit: BoxFit.cover,),
                          )
                        ),
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
