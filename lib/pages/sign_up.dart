import 'package:flutter/material.dart';

import '../services/db_service.dart';
import 'model/user_model.dart';

class SignUp extends StatefulWidget {
  static const String id = 'sign_up';

  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  doLogin() async{
    String email = emailController.text.toString().trim();
    String number = numberController.text.toString().trim();
    String address = addressController.text.toString().trim();

    var user = User.account( email: email,number: number, address: address);

    HiveDB().storeUser(user);
    var user2 = HiveDB().loadUser();
    print(user2.email);
    print(user2.number);
    print(user2.address);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 29, 53, 1),
      body: Column(
          children: [
            //#header
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const[
                   SizedBox(height: 20,),
                  Text("Create", style: TextStyle(color: Colors.white, fontSize: 20),),
                  SizedBox(height: 10,),
                   Text('Account', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),),
                   SizedBox(height: 20,),
                  //#body

                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(27, 29, 53, 1),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15,),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "User Name",
                            prefix: Icon(Icons.perm_identity,color: Colors.grey,),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        TextField(
                          controller: numberController,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "E-Mail",
                              prefix: Icon(Icons.email_outlined,color: Colors.grey,),

                          ),
                        ),
                        const SizedBox(height: 15,),
                        TextField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Phone Number",
                            prefix: Icon(Icons.phone,color: Colors.grey,),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        TextField(
                          controller: addressController,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: "Password",
                            prefix: Icon(Icons.key_sharp,color: Colors.grey,),

                          ),
                        ),
                        const SizedBox(height: 70,),
                        GestureDetector(
                          onTap: () {
                            doLogin();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue,

                            ),
                            child: const Center(
                              child: Icon(Icons.arrow_forward_rounded,color: Colors.white,)),
                            ),
                          ),
                        SizedBox(height: 80,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account ?",style: TextStyle(color: Colors.grey),),
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed(SignUp.id);
                              },
                              child: Text("Sign In",style: TextStyle(color:Colors.blue.shade900 ),),
                            )
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

    );
  }
}