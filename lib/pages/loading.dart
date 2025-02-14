import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:math';
import 'package:grocery_shop_app/main.dart';
import 'maps.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyMap()
      ));
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
      title: Text("Mapping Pune!", style: TextStyle(fontFamily: 'boldfont'),),
      backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      
    ),
      body: Scaffold(
        backgroundColor: Colors.white,
    body: Center(
        child: LoadingAnimationWidget.inkDrop(color: Colors.blue, size: 100)
      ),
      )
    );
  }
}