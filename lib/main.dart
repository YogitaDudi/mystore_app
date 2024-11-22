import 'package:flutter/material.dart';
import 'package:mystore/auth/dashborad/provider/dashborad_provider.dart';
import 'package:mystore/auth/product/provider/product_provider.dart';
import 'package:mystore/auth/product/service/Product_service.dart';
import 'package:mystore/auth/provider/auth_provider.dart';
import 'package:mystore/auth/provider/splash_provider.dart';
import 'package:mystore/auth/service/auth_service.dart';
import 'package:mystore/auth/view/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (build)=>AuthProvider(AuthService())),
        ChangeNotifierProvider(create: (context){
          return DashboardProvider();}),
        ChangeNotifierProvider(create: (context){
          return ProductProvider(ProductService());
        }
        ),
        ChangeNotifierProvider(create: (context){
          return SplashProvider();
        }
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:LoginScreen(),
      ),
    );
  }
}
