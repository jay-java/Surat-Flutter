import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/home_screen.dart';
class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController  = TextEditingController();
  TextEditingController _passController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _emailController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _passController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {
                _signIn();
              }, child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String _email = _emailController.text;
    String _password = _passController.text;

    User? user = (await _auth.signInWithEmailAndPassword(email: _email, password: _password)) as User?;
    if(user!=null){
      print('user login');
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    }
    else{
      print('error');
    }
  }
}
