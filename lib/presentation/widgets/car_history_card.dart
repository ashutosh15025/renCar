import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarHistoryCard extends StatelessWidget {
  const CarHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding:EdgeInsets.all(8),
      decoration:BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 10
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Title',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.directions_car,color: Colors.white,),
                    SizedBox(width: 2,),
                    Icon(Icons.chevron_right,color: Colors.white,),
                    Text('200 km',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                    SizedBox(width: 20,),
                    Icon(Icons.battery_4_bar_sharp,color: Colors.white,),
                    SizedBox(width: 2,),
                    Icon(Icons.chevron_right,color: Colors.white,),
                    Text('5L',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),),
                  ],
                ),
              )
            ],


          ),
          Icon(Icons.chevron_right,color: Colors.white,size: 40,)
        ],
      ),
    );
  }
}
