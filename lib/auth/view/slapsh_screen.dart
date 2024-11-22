import 'package:flutter/material.dart';
import 'package:mystore/auth/dashborad/view/dashborad_screen.dart';
import 'package:mystore/auth/provider/splash_provider.dart';
import 'package:mystore/auth/view/login_screen.dart';
import 'package:provider/provider.dart';

class SlapshScreen extends StatefulWidget {
  const SlapshScreen({super.key});

  @override
  State<SlapshScreen> createState() => _SlapshScreenState();
}

class _SlapshScreenState extends State<SlapshScreen> {
  @override
  void initState() {
    decideScreen();
    super.initState();
  }

  Future decideScreen() async {
    SplashProvider splashProvider =
        Provider.of<SplashProvider>(context, listen: false);
    bool? isloggedIn = await splashProvider.checkLogged();
    if (isloggedIn) {
      if (mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DashboardScreen();
        }));
      }
    } else {
      if (mounted) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "splash",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
