import 'package:codepur/utilities/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  @override
  LoginPageSate createState() {
    return LoginPageSate();

  }
}
class LoginPageSate  extends State<LoginPage> {

  String name="";
  bool chnageBtn= false;
  final formKey = GlobalKey<FormState>();

  void moveToHomePage(BuildContext context) async {
    if(formKey.currentState!.validate()) {
      setState(() {
        chnageBtn = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.homeRoute);
      setState(() {
        chnageBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.white,
      child:SafeArea(
        child: Form(
          key:formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/img/loginImage.png'),
                SizedBox(
                  height: (20.0),
                ),
                Text('Welcome $name',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: (20.0),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Username',
                          labelText: 'Username',
                        ),
                        onChanged: (value){
                          setState(() {
                            name=value;
                          });
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return'Username cannot be empty';
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          labelText: 'Password',
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return'Password cannot be empty';
                          }
                          else if(value.length<5){
                            return'Password must be atleast 5 strings';
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: (30.0),

                      ),
                      Material(
                        color:Colors.deepPurple,   // you have to remove decoration for material
                        borderRadius: BorderRadius.circular(chnageBtn? 50 : 8),
                        child: InkWell(
                          onTap: ()=>moveToHomePage(context),
                          
                          child: AnimatedContainer(
                            duration:Duration(seconds: 1),
                            width: chnageBtn ?  50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(
                            //   color:Colors.deepPurple,
                            //   borderRadius: BorderRadius.circular(chnageBtn? 50 : 8),
                            // ),
                            child:chnageBtn?
                            Icon(Icons.done,color: Colors.white,) :
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: TextButton.styleFrom(minimumSize: Size(150, 40),),
                      //   onPressed: (){
                      //     Navigator.pushNamed(context, MyRoute.homeRoute);
                      //   },
                      //   child:Text('Login',
                      //   style: TextStyle(
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      //  )
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
