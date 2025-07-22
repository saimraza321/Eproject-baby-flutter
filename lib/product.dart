import 'package:flutter/material.dart';
import 'package:myapp/first.dart';
import 'package:myapp/drawerside.dart' ; 

class product extends StatefulWidget {
  const product({ Key? key }) : super(key: key);

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("product"),
        backgroundColor: Colors.black12,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          height: 600,
          width: 400,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ) 
          ),
          
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(

               children: [
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtwudVchzMBXk3A0GMg8GBN3QajZwqdI9Dyg&s',
              
              height: 250,
              width: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10,),
            Text("infinx not 40",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black
            ),
            ),
                 SizedBox(height: 10,),
            Text("The Infinix Note 40 Pro boasts a sleek design that catches the eye. Its large display, measuring 6.78 inches",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black
            ),
            ),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               ElevatedButton(onPressed: () {

               },
               child: Text('add to cart'),
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),                
               ),
               ),

               ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => First()));
               },
               child: Text("go to nextpage"),
               ),

              ],
            )
          
            ],
        
              ),

              

           
          )
        
          ),
        ),
     drawer: Drawerside(),
      );

  
  }}

