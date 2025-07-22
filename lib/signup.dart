import 'package:flutter/material.dart';
import 'package:myapp/drawerside.dart';

class Signup extends StatefulWidget {
  const Signup({ Key? key }) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState>_signupkey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPassController = TextEditingController();

void RegisterUser(){
  if(_signupkey.currentState!.validate()){
    print("User Added Successfully");
    print("User Name : ${userNameController.text}");
    print("User Email : ${userEmailController.text}");
    print("User Password : ${userPassController.text}");

    userNameController.text="";
    userEmailController.text="";
    userPassController.text="";

  }else{
    print(" Please Insert Valid Details");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Sign Up"),
        backgroundColor: const Color.fromARGB(255, 253, 122, 0),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
      ),
      drawer: Drawerside(),
      body: MaterialApp( 
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      title: "My App", 
      home: Scaffold( 
        
        appBar: AppBar(
          centerTitle: true, 
          
        ), 
        body:Container( 
          width: double.infinity,
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( 
                width: 250, 
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField( 
                  decoration: InputDecoration( 
                    labelText: "Email", 
                    labelStyle: TextStyle(color: Colors.black),
                   enabledBorder: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1 ,
                      color: Colors.black
                    )
                   ),
                   focusedBorder: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1 ,
                      color: Colors.black
                    )
                   ),
                  ),
                ),
              ), 
              SizedBox(height: 20),
              Container( 
                width: 250, 
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField( 
                  decoration: InputDecoration( 
                    labelText: "Password", 
                    labelStyle: TextStyle(color: Colors.black),
                   enabledBorder: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1 ,
                      color: Colors.black
                    )
                   ),
                   focusedBorder: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1 ,
                      color: Colors.black
                    )
                   ),
                  ),
                ),
              ) , 
              SizedBox(height: 20),
              Container( 
                width: 250,
                child: ElevatedButton(onPressed: ()=> {}, 
                 style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 115, 0)
                 ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Register",style: TextStyle(color: Colors.white), 
                                    
                                    ),
                  )),
              )
            ],
          ),
        )
      ),
    ),
    );
  }
}