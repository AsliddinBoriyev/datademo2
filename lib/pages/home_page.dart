import 'package:datademo2/pages/sign_up.dart';
import 'package:flutter/material.dart';

import '../services/db_service.dart';
import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  static const id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  doLogin() async{
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user =  User.from( email: email,password: password);

    HiveDB().storeUser(user);
    var user2 = HiveDB().loadUser();
    print(user2.email);
    print(user2.password);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 29, 53, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/avatar_1.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Sign in to continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
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
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 5,),
                        TextField(

                          controller: emailController,
                          decoration: InputDecoration(
                            prefix: Icon(Icons.person,color: Colors.grey,),
                            hintText: "User Name",
                            hintStyle: TextStyle(color: Colors.grey)
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              prefix: Icon(Icons.key,color: Colors.grey,),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey)
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Center(
                          child: Text("Forgot password ?",style:TextStyle(color: Colors.grey) ,),
                        ),
                        const SizedBox(height: 50,),
                        GestureDetector(
                          onTap: (){
                            // doLogin();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue,
                            ),
                            child: const Center(
                              child:Icon(Icons.arrow_forward_rounded,size: 25,color: Colors.white,),
                            ),
                          ),
                        ),
                        SizedBox(height: 80,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account ?"),
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushNamed(SignUp.id);
                              },
                              child: Text("Sign Up",style: TextStyle(color:Colors.blue.shade900 ),),
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
