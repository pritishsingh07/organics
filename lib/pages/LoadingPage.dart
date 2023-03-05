import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgimage;

import 'LoginPage.dart';
import 'StartUP.dart';

class LoadingPage extends StatefulWidget  {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyLoadingPage createState() => _MyLoadingPage();
}

class  _MyLoadingPage extends State<LoadingPage> with SingleTickerProviderStateMixin{
late final AnimationController _animationController=AnimationController(duration:const Duration(seconds: 2),vsync: this,)..repeat(max: 1,reverse: false);
late  final Animation<Offset> _offsetAnimation =Tween<Offset>(begin: const Offset(-1.7,0), end: Offset.zero,).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInBack,));
late  final Animation<Offset> _offsetAnimation1 =Tween<Offset>(begin: const Offset(1.7,0), end: Offset.zero,).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInBack,));
late  final Animation<Offset> _offsetAnimation2 =Tween<Offset>(begin: const Offset(0,1.7), end: Offset.zero,).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInBack,));



void repeatOnce() async {
  await _animationController.forward();
}

@override
void initState(){
  super.initState();
  repeatOnce();
  Timer(const Duration(seconds: 5), (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
        const StartUp()));
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 122, 122),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.96,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Center(
                  child:Card(
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.10),
                       child:  const Image(image:AssetImage("lib/asset/splashlogo.png"),
                         width: 100,
                         height: 100,
                       ),
                  ),
               ),
                Card(
                  margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.15),
                  elevation: 0,
                  color: const Color.fromARGB(255, 0, 122, 122),
                  child: const CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SlideTransition(position: _offsetAnimation,
                      child: Image(image: const svgimage.Svg("lib/asset/chick.svg"),
                        width: MediaQuery.of(context).size.width/3),),
                    SlideTransition(position: _offsetAnimation2,
                      child:  Image(image: const svgimage.Svg("lib/asset/ice.svg"),
                        width:  MediaQuery.of(context).size.width/3),),
                    SlideTransition(position: _offsetAnimation1,
                      child:  Image(image:const svgimage.Svg("lib/asset/pizza.svg"),
                        width: MediaQuery.of(context).size.width/3,),),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}

