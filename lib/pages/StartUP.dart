import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgimage;

import 'LoginPage.dart';

class StartUp extends StatefulWidget  {
  const StartUp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyStartUp createState() => _MyStartUp();
}

class  _MyStartUp extends State<StartUp> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 1), vsync: this,)
    ..repeat(max: 1, reverse: false);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, -1.7), end: Offset.zero,).animate(CurvedAnimation(
    parent: _animationController, curve: Curves.easeInBack,));


  void repeatOnce() async {
    await _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    repeatOnce();
  }

  @override
  Widget build(BuildContext context) {
      return WillPopScope(onWillPop: ()async {
        return false;
      },
        child:Scaffold(
          appBar:PreferredSize(
            preferredSize:const Size.fromHeight(0.0),
            child:  AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          backgroundColor:  const Color.fromARGB(255, 0, 122, 122),
          body:  SlideTransition(position: _offsetAnimation,
            child: Card(
              shape:const RoundedRectangleBorder( borderRadius: BorderRadius.only(bottomLeft: Radius.circular(23),bottomRight: Radius.circular(23) )),
              elevation: 3.0,
              margin: const EdgeInsets.all(0),
              color: Colors.white,
              shadowColor: const Color.fromARGB(255, 0, 122, 122),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.80,
                width: MediaQuery.of(context).size.width,
                child:CustomPaint(

                )
              ),
            )
            ,
          )
        ) ,
      );
  }
}
