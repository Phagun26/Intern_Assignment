import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double ww = Get.width;
double hh = Get.height;
class homepage extends StatefulWidget {

  final String name;

  homepage({
    required this.name,
});



  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200,),
            Text('Welcome ${widget.name}',style: TextStyle(fontSize: 25),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Get.to(()=>homee());
            }, child: Text('Log Out'))
      ],
        ),
      ),
    );
  }
}


class homee extends StatefulWidget {
  const homee({super.key});

  @override
  State<homee> createState() => _homeeState();
}

class _homeeState extends State<homee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Text('Welcome', style: TextStyle(fontSize: 27),),
            SizedBox(height: 100,),
            ElevatedButton(onPressed: (){Get.to(()=>login());}, child: Text('Login',style: TextStyle(fontSize: 17),)),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){Get.to(()=>signup());}, child: Text('Signup',style: TextStyle(fontSize: 17),)),

          ],
        ),
      ),
    );
  }
}

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {

  final TextEditingController name =  TextEditingController();
  final TextEditingController phone =  TextEditingController();
  final TextEditingController pass =  TextEditingController();
  final TextEditingController pass1 =  TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              Container(
                width: ww*0.8,
                height: hh*0.07,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: 2,
                        color: Colors.blue
                    )
                ),
                padding: EdgeInsets.all(7),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: 'Enter Name',
                    border: InputBorder.none,
                  ),

                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: ww*0.8,
                height: hh*0.07,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: 2,
                        color: Colors.blue
                    )
                ),
                padding: EdgeInsets.all(7),
                child: TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    hintText: 'Enter  Number',
                    border: InputBorder.none,
                  ),

                ),
              ),
              SizedBox(height: 20,),

              Container(
                width: ww*0.8,
                height: hh*0.07,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: 2,
                        color: Colors.blue
                    )
                ),
                padding: EdgeInsets.all(7),
                child: TextField(
                  obscuringCharacter: '*',
                  obscureText: true,
                  controller: pass,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: InputBorder.none,
                  ),

                ),
              ),
              SizedBox(height: 20,),

              Container(
                width: ww*0.8,
                height: hh*0.07,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: 2,
                        color: Colors.blue
                    )
                ),
                padding: EdgeInsets.all(7),
                child: TextField(
                  obscuringCharacter: '*',
                  obscureText: true,
                  controller: pass1,
                  decoration: InputDecoration(
                    hintText: 'Enter Password Again',
                    border: InputBorder.none,
                  ),

                ),
              ),
              SizedBox(height: 50,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                ),
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    minimumSize: MaterialStateProperty.all<Size>(Size(ww*0.55, hh*0.05)),
                  ),
                  onPressed: (){

                    if(pass.text.toString()!=pass1.text.toString())
                      {
                        Get.snackbar('Error', 'Passwords Do Not Match');
                      }
                    else
                      {

            signupp();
            Get.to(()=>homepage(name: name.text.toString()));
                      }



                  },
                  child: Text('Sign Up',style: TextStyle(color: Colors.white, fontSize: 20),),
                )
              ),



            ],
          ),
        ),
      ),
    );
  }

  Future<void> signupp() async {
      final String namee = name.text.toString();
      final String phonee = phone.text.toString();
      final String password = pass.text.toString();


      await FirebaseFirestore.instance.collection('Users').doc('${namee}_$phonee').set({
        'name' : namee,
        'phone' : phonee,
        'password' : password,
      });

  }
}




class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  final TextEditingController nn =  TextEditingController();
  final TextEditingController pass =  TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: ww*0.8,
              height: hh*0.07,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  width: 2,
                  color: Colors.blue
                )
              ),
              padding: EdgeInsets.all(7),
              child: TextField(
                controller: nn,
                autofillHints: [],
                decoration: InputDecoration(
                  hintText: 'Enter Name/ Number',
                  border: InputBorder.none,

                ),

              ),
            ),
            SizedBox(height: 20,),

            Container(
              width: ww*0.8,
              height: hh*0.07,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      width: 2,
                      color: Colors.blue
                  )
              ),
              padding: EdgeInsets.all(7),
              child: TextField(
                obscuringCharacter: '*',
                obscureText: true,
                controller: pass,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  border: InputBorder.none,
                ),

              ),
            ),
            SizedBox(height: 100,),

            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                ),
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    minimumSize: MaterialStateProperty.all<Size>(Size(ww*0.55, hh*0.05)),

                  ),
                  onPressed: (){
                    loginn();
                    // Get.to(()=>homepage(name: nn.text.toString()));

                  },
                  child: Text('Login',style: TextStyle(color: Colors.white, fontSize: 20),),
                )
            ),



          ],
        ),
      ),
    );
  }

  Future<void> loginn() async{

    final String input = nn.text.toString();
    final String password = pass.text.toString();

    if(double.tryParse(input)!=null)
      {    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Users').where('phone',isEqualTo: input).get();
      if(querySnapshot.docs.isNotEmpty)
      {
        var user = querySnapshot.docs.first.data();
        if(user!=null && user is Map<String, dynamic>)
        {
          if(user['password']==password)
          {
            Get.to(()=>homepage(name: user['name']));
          }
          else{
            Get.snackbar('Error', 'Incorrect Details');
          }

        }
        else{
          Get.snackbar('Error', 'Incorrect Details');
        }

      }
      else{
        Get.snackbar('Error', 'User Not Found');
      }


      }
    else
      {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Users').where('name',isEqualTo: input).get();
        if(querySnapshot.docs.isNotEmpty)
        {
          var user = querySnapshot.docs.first.data();
          if(user!=null && user is Map<String, dynamic>)
          {
            if(user['password']==password)
            {
              Get.to(()=>homepage(name: user['name']));
            }
            else{
              Get.snackbar('Error', 'Incorrect Details');
            }

          }
          else{
            Get.snackbar('Error', 'Incorrect Details');
          }

        }
        else{
          Get.snackbar('Error', 'User Not Found');
        }

      }

  }
}
