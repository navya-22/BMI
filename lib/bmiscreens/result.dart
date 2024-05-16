import 'package:flutter/material.dart';

import 'package:ibm/bmiscreens/calculatescreen.dart';


class Result extends StatelessWidget {
  final double bmi;
 final String healthState;
 final String healthText;
  const Result({super.key, required this.bmi,required this.healthState, required this.healthText
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text(' Your Result ',style: TextStyle(fontSize: 32,color: Colors.white),),
      backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
    body:Container(
      height: MediaQuery.of(context).size.height-4.0,
      width: MediaQuery.of(context).size.width-5.0,
      decoration: BoxDecoration(color: Colors.white30,borderRadius: BorderRadius.circular(15)),
    child:Center(
      child: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const SizedBox(height: 60),
          Text(
            healthState,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 150,),
          Text(
            bmi.toStringAsFixed(2),
            style: const TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 60),
         Text(
            healthText,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[900],
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.transparent),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Calculatescreen(),
                ));},
          child: const Text(
            ' RE-CALCULATE',
            style: TextStyle(backgroundColor: Colors.transparent,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
