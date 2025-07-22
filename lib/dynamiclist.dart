import 'package:flutter/material.dart';
import 'package:myapp/drawerside.dart';

class Dynamiclist extends StatefulWidget {
  const Dynamiclist({Key? key}) : super(key: key);

  @override
  _DynamiclistState createState() => _DynamiclistState();
}

class _DynamiclistState extends State<Dynamiclist> {
  final Users = [
  {
    "id": 1,
    "name": "Ahtisham",
    "image": "https://images.unsplash.com/photo-1622925930212-b5b1606f0aab?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWVuc3xlbnwwfHwwfHx8MA%3D%3D",
    "phone": "+1234567890"
  },
  {
    "id": 2,
    "name": "Taha",
    "image": "https://images.unsplash.com/photo-1599032909736-0155c1d43a6c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWVuc3xlbnwwfHwwfHx8MA%3D%3D",
    "phone": "+1234567891"
  },
  {
    "id": 3,
    "name": "Talha",
    "image": "https://images.unsplash.com/photo-1620228922597-cca58f177310?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bWVuc3xlbnwwfHwwfHx8MA%3D%3D",
    "phone": "+1234567892"
  },
  {
    "id": 4,
    "name": "Ahsan",
    "image": "https://media.istockphoto.com/id/2149670228/photo/smiling-young-man-standing-with-his-bike-and-typing-on-phone.webp?a=1&b=1&s=612x612&w=0&k=20&c=ltjNbJ4e_pOJJ-VOSd30UekuPJROFTAEQbqXmqkYEd0=",
    "phone": "+1234567893"
  }
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic List"),
        backgroundColor: Colors.black12,
        foregroundColor: const Color.fromARGB(255, 10, 10, 10),
        centerTitle: true,
      ),
      drawer: Drawerside(),
      body: ListView.builder(
        itemCount: Users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("${Users[index]['name']}"),
            subtitle: Text("${Users[index]['phone']}"),
            leading: CircleAvatar( radius: 25,backgroundImage: NetworkImage("${Users[index]['image']}"),
            ),
            trailing: Icon(Icons.phone, color: Colors.black, size: 40),
          );
        },
      ),
    );
  }
}
