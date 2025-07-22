import 'package:flutter/material.dart';
import 'package:myapp/darazScreen.dart';
import 'package:myapp/dynamiclist.dart';
import 'package:myapp/first.dart';
import 'package:myapp/home.dart';
import 'package:myapp/product.dart';
import 'package:myapp/signup.dart';

class Drawerside extends StatefulWidget {
  const Drawerside({ Key? key }) : super(key: key);

  @override
  _DrawersideState createState() => _DrawersideState();
}

class _DrawersideState extends State<Drawerside> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
         child:ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(decoration: BoxDecoration(
            color: Colors.blue
          ),
          child: Text("Side Menu",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black 
          ),),
          ),
             ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => First()));
            },
          ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text("products"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => product()));
            },
          ),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text("Home-v2"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ), ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text("Dynamic List"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Dynamiclist()));
            },
          ),ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text("Daraz Screen"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DarazScreen()));
            },
          )
           ,ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text("Sign up"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
            },
          )
          
        ],


      )
      
    );
  }
}