import 'package:bitebybyte/screens/home_page/home_page.dart';
import 'package:bitebybyte/screens/ingredient_list/custom_data.dart';
import 'package:bitebybyte/screens/ingredient_list/ingredient_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BiteByByte',
      debugShowCheckedModeBanner: false,
      // home: IngredientList(ingredientList: ingredientList,),
      home: HomePage(),
    );
  }
}


