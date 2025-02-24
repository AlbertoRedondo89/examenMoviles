
import 'package:examen_final_redondo/preferences.dart';
import 'package:examen_final_redondo/providers/provider.dart';
import 'package:examen_final_redondo/screens/coche_detail.dart';
import 'package:examen_final_redondo/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Preferences.init();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CochesProvider()),
      ],
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  get coche => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Pràctic',
      initialRoute: "/",
      routes: {
        "/":(context) => Preferences.rememberMe ? HomeScreen() : LoginPage(),
        '/home': (BuildContext context) =>  HomeScreen(),
        '/details': (BuildContext context) => CocheDetailScreen(coche: coche,),
      },
    );
  }
}