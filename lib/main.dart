import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled2/Moduels/bmi/BMI.dart';
import 'package:untitled2/Moduels/mess/appmess.dart';
import 'package:untitled2/Moduels/bmis/bmiscreen.dart';
import 'package:untitled2/Moduels/counter/counterscreen.dart';
import 'package:untitled2/Moduels/Homee/home.dart';
import 'package:untitled2/Moduels/Login/login.dart';
import 'package:untitled2/app%20new/cubitappnews/cash.dart';

import 'Layout/home.dart';
import 'Shared/bloc_observer.dart';
import 'app new/app.dart';
import 'app new/cubitappnews/dio.dart';


void main() async
{
WidgetsFlutterBinding.ensureInitialized();
blocObserver: MyBlocObserver();
  await CashHelper.init();
  diohelp.init();
  runApp(MyApp());
}
// initiate MyApp as  StatelessWidget

// Main class
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    // TODO: implement build
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: Colors.black12,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.red,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle
                (
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.light,

              )
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.red,
          )
      ),
      darkTheme:ThemeData(
          primarySwatch: Colors.deepOrange,
          scaffoldBackgroundColor: HexColor('333739'),
          appBarTheme: AppBarTheme(
              backgroundColor: HexColor('333739 '),
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle
                (
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.light,

              )
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.red,
            unselectedItemColor:Colors.grey,
          ),
        textTheme: TextTheme(

        )
      ),
      themeMode:ThemeMode.light,

      home:appnews(),


    );
    throw UnimplementedError();
  }
}// creating main screen and building list of wordpai