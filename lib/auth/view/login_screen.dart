import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mystore/auth/comman/api_uitl.dart';
import 'package:mystore/auth/dashborad/view/dashborad_screen.dart';
import 'package:mystore/auth/model/user_model.dart';
import 'package:mystore/auth/provider/auth_provider.dart';
import 'package:mystore/auth/view/signUp_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      try {
        final user = UserAdmin(
          username: usernameController.text,
          password: passwordController.text,
        );

        String? token = await authProvider.login(user);

        if (token != null) {
          Fluttertoast.showToast(
              msg: "Login Successfully", backgroundColor: Colors.green);
        }
      } catch (e) {
        AppUtil.showToast("Login failed");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  "https://th.bing.com/th/id/OIP.3N4U830M19oAYGYdQSQ4wAAAAA?pid=ImgDet&w=184&h=163&c=7&dpr=1.3",
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 48.0),
                    child: Text(
                      "Login..",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 50),
                    ),
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: ' USERNAME...',
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'PASSWARD...',
                      suffixIcon: Icon(Icons.remove_red_eye_rounded),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DashboardScreen();
                        }));
                      },
                      child: Text('login')),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Already exists have an account?",
                            style: TextStyle(color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: Text("SignUp",
                              style: TextStyle(
                                color: Colors.purple,
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
