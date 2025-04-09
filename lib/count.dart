import 'package:flutter/material.dart';

class count extends StatefulWidget {
  const count({super.key});

  @override
  State<count> createState() => _countState();
}

class _countState extends State<count> {
  var number =0;
  void increment(){
    setState(() {
      number++;
    });
  }
  void decrement(){
    setState(() {
      number--;
    });
  }
  void reset(){
    setState(() {
      number=0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count : $number"),
            TextButton(onPressed: () {
              increment();
            }, child: Text("plus")),
            TextButton(onPressed: () {
              decrement();
            }, child: Text("minus")),
            TextButton(onPressed: () {
              reset();
            }, child: Text("reset"))

          ],


        ),
      ),
    );
  }
}
