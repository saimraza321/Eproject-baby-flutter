import 'package:flutter/material.dart';
import 'package:myapp/drawerside.dart';


class First extends StatefulWidget {
  const First({ Key? key }) : super(key: key);

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Ahtisham"),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: 
      Padding(padding: const EdgeInsets.all(8),
        child: Center(
        child: ListView(
          children: [
            // Text("wellcome to flutter",
            // style: TextStyle(
            //   fontSize: 30,
            //   fontWeight: FontWeight.bold,
            //   color: Colors.black87,
            // ),
            // ),
            SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 247, 6, 6),
                 child: Icon(Icons.start_sharp , color:Colors.white, size: 50,),
              ),
               SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(255, 0, 0, 0),
                 child: Icon(Icons.laptop, color:Colors.white, size: 50,),
              ),
               SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 235, 6, 124),
                 child: Icon(Icons.account_balance_wallet_sharp, color:Colors.white, size: 50,),
              ), SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 4, 255, 163),
              child: Icon(Icons.add_ic_call),
              ),
               SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 246, 226, 4),
              child: Icon(Icons.home, color:Colors.white, size: 50,),
              ), SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 3, 6, 100),
                 child: Icon(Icons.facebook, color:const Color.fromARGB(255, 245, 246, 248), size: 50,),
              ),
              SizedBox(height: 20,),
                Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 245, 58, 1),
                 child: Icon(Icons.mail_sharp, color:Colors.white, size: 50,),
              ),
                  SizedBox(height: 20,),
                Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 107, 4, 241),
                 child: Icon(Icons.bed, color:Colors.white, size: 50,),
              ),
              SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 2, 168, 245),
                 child: Icon(Icons.barcode_reader, color:Colors.white, size: 50,),
              ),
               SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(255, 7, 234, 79),
                 child: Icon(Icons.phone, color:Colors.white, size: 50,),
              ),
               SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 241, 2, 2),
                 child: Icon(Icons.atm, color:Colors.white, size: 50,),
              ), SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Icon(Icons.local_hospital, color:const Color.fromARGB(255, 238, 8, 8), size: 50, ),
              ),
               SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 5, 73, 82),
              child: Icon(Icons.phone_iphone, color:Colors.white, size: 50,),
              ), SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 241, 3, 190),
                 child: Icon(Icons.badge_sharp, color:const Color.fromARGB(255, 245, 246, 248), size: 50,),
              ),
              SizedBox(height: 20,),
                Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 11, 243, 235),
                 child: Icon(Icons.pedal_bike, color:Colors.white, size: 50,),
              ),
                  SizedBox(height: 20,),
                Container(
              height: 100,
              width: 100,
              color: const Color.fromARGB(115, 148, 157, 14),
                 child: Icon(Icons.stop_circle_rounded, color:Colors.white, size: 50,),
              ),
          ],
        ),
      ),
      ),
      drawer: Drawerside(),
    );
   
  }
}