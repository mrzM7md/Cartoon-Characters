import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_subjects_lessons_2/api/http.dart';



class Signpage extends StatefulWidget {
  const Signpage({super.key});

  @override
  State<Signpage> createState() => _SignpageState();
}

class _SignpageState extends State<Signpage> {



  @override
  Widget build(BuildContext context) {
    TextEditingController controllerUserName = TextEditingController() ;
    TextEditingController controllerName = TextEditingController() ;
    TextEditingController controlleEmail = TextEditingController() ;
    TextEditingController controllerPassword = TextEditingController() ;
    return Scaffold(
        appBar:AppBar(

          title: const Text("Sign up"),
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize:const Size.fromHeight(10.0),
              child:SafeArea(
                  child:Container(
                    height: 10.0,
                    color: Colors.white,
                  ))),


        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.name,
                  controller: controllerName,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.red,fontSize: 15),
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(),
                    focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    suffixIcon: Icon(Icons.person, size: 40,color: Colors.red,),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.name,
                  controller: controllerUserName,
                  decoration: const InputDecoration(
                    labelText: "User Name",
                    labelStyle: TextStyle(color: Colors.red,fontSize: 15),
                    hintText: "Enter Your Name",
                    border: OutlineInputBorder(),
                    focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    suffixIcon: Icon(Icons.person, size: 40,color: Colors.red,),
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  keyboardType: TextInputType.name,
                  controller: controlleEmail,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.red,fontSize: 15),
                    hintText: "Enter Email",
                    border: OutlineInputBorder(),
                    focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    suffixIcon: Icon(Icons.location_city, size: 40,color: Colors.red,),
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: controllerPassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.red,fontSize:15),
                    hintText: "Enter Your Password",
                    focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    suffixIcon: Icon(Icons.lock, size: 40,color: Colors.red,),
                  ),
                ),
                const SizedBox(height: 80,),
                MaterialButton(
                  onPressed: () async {
                    print('Clicked');
                    postRequest(url: HTTP_LINK_SIGNUP, data:
                    {
                      "name":controllerName.text,
                      "username":controllerUserName.text,
                      "password":controllerPassword.text,
                      "email":controlleEmail.text,
                    }
                    ).then((response) {
                      if(response.statusCode == 200) {
                        if (jsonDecode(response.body)['status'] == 'success') {
                          print("Success");
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Loginpage()),
                            );
                          });
                        }
                      }
                      else{
                        print("Errpr occurs");
                      }
                    }).catchError((error){
                      print('Error: $error');
                    });


                  },
                  color:Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.red),
                  ),

                  child: const Text('Go to Login Page'),
                ),



              ],
            ),
          ),
        )

    );



  }
}
class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {



  @override
  Widget build(BuildContext context) {

    TextEditingController controlleLocation = TextEditingController() ;
    TextEditingController controllerPassword = TextEditingController() ;
    return Scaffold(
        appBar:AppBar(

          title: const Text("Login"),
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize:const Size.fromHeight(10.0),
              child:SafeArea(
                  child:Container(
                    height: 10.0,
                    color: Colors.white,
                  ))),


        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30, right: 15, left: 15),
          child: Column(
            children: [
              const SizedBox(height: 20,),

              TextField(
                keyboardType: TextInputType.name,
                controller: controlleLocation,
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.red,fontSize: 15),
                  hintText: "Enter Email",
                  border: OutlineInputBorder(),
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                  ),
                  suffixIcon: Icon(Icons.location_city, size: 40,color: Colors.red,),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              TextField(
                controller: controllerPassword,
                obscureText: true,
                obscuringCharacter: '*',
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.red,fontSize:15),
                  hintText: "Enter Your Password",
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                  ),
                  suffixIcon: Icon(Icons.lock, size: 40,color: Colors.red,),
                ),
              ),

              const SizedBox(height: 80,),

              MaterialButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signpage(

                    )),
                  );
                },
                color:Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.red),
                ),

                child: const Text('Go to Sign up Page'),
              ),



            ],
          ),
        )

    );



  }
}

