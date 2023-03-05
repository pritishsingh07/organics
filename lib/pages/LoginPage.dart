import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgimage;

import '../ServerApis/GoogleSignInApi.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyLoginState createState() => _MyLoginState();
}



class _MyLoginState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 43, 52),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:   [
          const Card(
            elevation: 0,
            color: Color.fromARGB(255, 44, 43, 52),
            margin:  EdgeInsets.all( 0),
            child: SizedBox(
              child: Padding(padding: EdgeInsets.all(0),
                child:Image(
                  image: AssetImage('lib/asset/splashlogo.png'),
                ) ,),
            ),
          ) ,
          Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 25,bottom: 0,top: 0),
                child: const  Text("Premium Cars",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),) ,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 25,bottom: 0,top: 0),
                child: const  Text("Enjoy the Luxury",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),) ,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 25,bottom: 5,top: 0),
                child: const  Text("Premium and prestige car daily rental \nExperience the thrill at lower price",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 15
                  ),) ,
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child:Center(
                child:  CupertinoButton(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    child:SizedBox(
                      width: MediaQuery.of(context).size.width/3.5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children:const [
                            Card(
                              color: Colors.white,
                              elevation: 0,
                              margin: EdgeInsets.only(right: 5,top: 0,bottom: 0),
                              child: Text(
                                "Login In",style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.bold,fontSize: 20
                              ) ,
                              )
                              ,
                            ),

                            Card(
                              margin: EdgeInsets.all(0),
                              color: Colors.white,
                              elevation: 0,
                              child: Image(image: svgimage.Svg('lib/images/google.svg'),width: 24,) ,
                            )

                          ]

                      ),
                    ), onPressed: () async{
                  var user= await GoogleSignInApi.login();
                  if(user != null){

                  }
                }),
              )
          ),
        ],
      ),
    );
  }
}

