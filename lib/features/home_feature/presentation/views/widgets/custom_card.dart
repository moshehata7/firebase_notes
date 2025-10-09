import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key,  required this.txt});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(children: 
      [
        Image.asset("images/5994710.png",height: 120,),
         Text(txt,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)])),
    );
  }
}
