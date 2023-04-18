// ignore_for_file: camel_case_types


import 'dart:async';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studioapps/subject.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'chatgpt.dart';

void main()   async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// This widget is the root
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EdTech',
      home: SplashScreen(),
    );
  }
}

class AddData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900
          ,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(child: CircleAvatar(
            backgroundColor: const Color.fromRGBO(16, 163, 127, 1),
            child: Image.asset(
              'assets/bot.png',
              color: Colors.white,
              scale: 1.4,
            ),
          ),
          onTap: (){Get.to(()=>Chatgpt());},),
        ),
        title:  Text('EdTech',style: GoogleFonts.georama(

          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w600,
         ),),
       centerTitle: true,
      ),
      body:Container(
        padding:  EdgeInsets.symmetric(horizontal: 20),

        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(

    children: [
      const SizedBox(height: 20),
      subs(titile:"نظم التشغيل",function: ( ){Get.to(()=>sub1());} )
      ,subs(titile:"لغة برمجة متطورة",function: ()=>Get.to(()=>sub2()) )
      ,subs(titile:"تصميم مواقف تعليمية",function: (){Get.to(()=>sub3());} )
      ,subs(titile:"قراءات باللغة العربية",function: (){Get.to(()=>sub4());} )
      ,subs(titile:"المكتبات الشاملة",function: (){Get.to(()=>sub5());} )
      ,subs(titile:"مناهج وطرق تدريس",function: (){Get.to(()=>sub6());} )
      ,subs(titile:"تكنولوجيا التعليم عن بعد",function: (){Get.to(()=>sub7());} )
      ,subs(titile:"استخدام الجداول االلكترونية",function: (){Get.to(()=>sub8());} )
      ,const SizedBox(height: 20),


    ],
    ),
        ),
      ));

  }

  GestureDetector subs({ required String titile,function } ) {


    return GestureDetector(
      onTap:function ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding:  const EdgeInsets.symmetric(horizontal: 20),
              height: 150,
              width: double.maxFinite,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),  color: Colors.grey,
              ),

                child: Center(child: Text(titile,overflow: TextOverflow.clip,style: GoogleFonts.cairo(fontSize: 25,color: Colors.white,fontWeight:FontWeight.w700 ))),),
          const SizedBox(height: 20), ],
      ),
    );
  }

  
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) => AddData())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.blue.shade900,
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text("EdTech",style: GoogleFonts.roboto (
          textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 48,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
      )),
              SizedBox(height:20 ,),
              Text("by kareem ahmed",style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 20,
                color: Colors.white,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),)



            ],
          )
      ),
    );
  }
}