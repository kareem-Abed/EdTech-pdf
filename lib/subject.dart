
import 'package:flutter/material.dart';


import 'package:get/get.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
Color myColor =  Colors.blue.shade900;
Color myColor2 =  Colors.grey;
Color TextColor =  Colors.white;
String title="EdTech";
Stream<List<user>> readuser()=>FirebaseFirestore.instance.collection('sub1').snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => user.Fromjason( doc.data())).toList());

Stream<List<user>> readuser2()=>FirebaseFirestore.instance.collection('sub2').snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => user.Fromjason( doc.data())).toList());

Stream<List<user>> readuser3()=>FirebaseFirestore.instance.collection('sub3').snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => user.Fromjason( doc.data())).toList());

Stream<List<user>> readuser4()=>FirebaseFirestore.instance.collection('sub4').snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => user.Fromjason( doc.data())).toList());

Stream<List<user>> readuser5()=>FirebaseFirestore.instance.collection('sub5').snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => user.Fromjason( doc.data())).toList());
Stream<List<user>> readuser6()=>FirebaseFirestore.instance.collection('sub6').snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => user.Fromjason( doc.data())).toList());
Stream<List<user>> readuser7()=>FirebaseFirestore.instance.collection('sub7').snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => user.Fromjason( doc.data())).toList());
Stream<List<user>> readuser8()=>FirebaseFirestore.instance.collection('sub8').snapshots().map((snapshot) =>
    snapshot.docs.map((doc) => user.Fromjason( doc.data())).toList());

class sub1 extends StatelessWidget {
  const sub1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title:TextTitle(),
        centerTitle: true,
      ),
      body:

      StreamBuilder<List<user>>(

        stream: readuser(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Text('error');}

          else if(snapshot.hasData){final users=snapshot.data!;

          return ListView(
            children:users.map(buildUser).toList() ,
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }


        },
      ),

    );

  }

}


Widget buildUser(user user)=>Column(


  children: [
    SizedBox(height: 20,),

    Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.maxFinite,

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(16),  color: myColor2,
      ),
      child: TextButton(child: Text(user.name,style: GoogleFonts.cairo(

        fontSize: 25,
        color:TextColor,
        fontWeight: FontWeight.w600,
      )),
        onPressed: (){

          Get.to(()=>MyPdf(url: user.url));

        },),
    ),
  ],
);

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,style: GoogleFonts.georama(

      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),);
  }
}


class sub2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title:  TextTitle(),
        centerTitle: true,
      ),
      body:

      StreamBuilder<List<user>>(

        stream: readuser2(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Text('error');}

          else if(snapshot.hasData){final users=snapshot.data!;

          return ListView(
            children:users.map(buildUser).toList() ,
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }


        },
      ),

    );

  }


}





class sub3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title:TextTitle(),
        centerTitle: true,
      ),
      body:

      StreamBuilder<List<user>>(

        stream: readuser3(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Text('error');}

          else if(snapshot.hasData){final users=snapshot.data!;

          return ListView(
            children:users.map(buildUser).toList() ,
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }


        },
      ),

    );

  }



}





class sub4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title:TextTitle(),
        centerTitle: true,
      ),
      body:

      StreamBuilder<List<user>>(

        stream: readuser4(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Text('error');}

          else if(snapshot.hasData){final users=snapshot.data!;

          return ListView(
            children:users.map(buildUser).toList() ,
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }


        },
      ),

    );

  }

}




class sub5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title:TextTitle(),
        centerTitle: true,
      ),
      body:

      StreamBuilder<List<user>>(

        stream: readuser5(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Text('error');}

          else if(snapshot.hasData){final users=snapshot.data!;

          return ListView(
            children:users.map(buildUser).toList() ,
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }


        },
      ),

    );

  }

}




class sub6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title:  TextTitle(),
        centerTitle: true,
      ),
      body:

      StreamBuilder<List<user>>(

        stream: readuser6(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Text('error');}

          else if(snapshot.hasData){final users=snapshot.data!;

          return ListView(
            children:users.map(buildUser).toList() ,
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }


        },
      ),

    );

  }


}




class sub7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:myColor,
        title: TextTitle(),
        centerTitle: true,
      ),
      body:

      StreamBuilder<List<user>>(

        stream: readuser7(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Text('error');}

          else if(snapshot.hasData){final users=snapshot.data!;

          return ListView(
            children:users.map(buildUser).toList() ,
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }


        },
      ),

    );

  }


}


class sub8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title:  TextTitle(),
        centerTitle: true,
      ),
      body:

      StreamBuilder<List<user>>(

        stream: readuser8(),
        builder: (context,snapshot){
          if(snapshot.hasError){return Text('error');}

          else if(snapshot.hasData){final users=snapshot.data!;

          return ListView(
            children:users.map(buildUser).toList() ,
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }


        },
      ),

    );

  }


}




class MyPdf extends StatelessWidget {
  MyPdf({required this.url, Key? key}) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: SafeArea(
          child: SfPdfViewer.network(
              url),
        ));
  }
}
class user{

  final String name ;
  final String url ;

  user({required this.name,required this.url,});
  Map<String,dynamic>tojason()=>{
    'name':name,
    'url':url
  };

  static user Fromjason(Map<String,dynamic> json)=> user(

    name:json['name'],
    url:json['url'],

  );


}