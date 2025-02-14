import 'package:flutter/material.dart';
import 'package:grocery_shop_app/main.dart';
import 'package:grocery_shop_app/pages/intro_page.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> IntroPage()));
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: mq.width *.5,
            left: mq.width * .15,
            width: mq.width * .7,
            child: Image.asset('assets/images/cropcart.png')),
            //label
            Positioned(
              bottom: mq.height * .35,
              width: mq.width,
              child: Text('CropCart', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'boldfont',
                fontSize: 30
                ),
              )
              ),
              //label
            Positioned(
              bottom: mq.height * .31,
              width: mq.width,
              child: Text('Where Farms Meet Families!', 
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'boldfont',
                fontWeight: FontWeight.bold,
                fontSize: 22
                ),
              )
              )
            ],
            ),
    );
  }
}