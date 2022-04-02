import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/Shared/cubit/appstate.dart';
import 'package:untitled2/app%20new/bis.dart';
import 'package:untitled2/app%20new/cubitappnews/dio.dart';
import 'package:untitled2/app%20new/cubitappnews/state%20app.dart';

import '../sci.dart';
import '../sport.dart';


class appnewscubit extends Cubit<stateapp>
{
  appnewscubit() : super(appbott());

  static appnewscubit get(context)=>BlocProvider.of(context);

  int currindex=0;

  List<BottomNavigationBarItem> bott=
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.add_business_sharp
        ),
      label: 'bussnies',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports
      ),
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science
      ),
      label: 'science',
    ),

  ];

  List<Widget> screens=
  [
   bis(),
   sports(),
    sci(),
  ];

List<dynamic>biss=[];
List<dynamic>sport=[];
List<dynamic>sciee=[];
  void getbis() {
    emit(loading());
    diohelp.getData
      (

      url:'v2/top-headlines',
      query:
      {
        'country':'eg' ,
        'category' :'business',
        'apiKey' :'65f7f556ec76449fa7ddc7c0069f040ca',
      },
    ).then((value) {
      biss = value.data['articles'];
      print(biss[0]['title']);
      emit(newgets());
    }).catchError((error)
    {
      print(error.toString());
      emit(newgete(error.toString()));
    });


  }

  void getsport() {
    emit(sportloading());
    diohelp.getData
      (

      url:'v2/top-headlines',
      query:
      {
        'country':'eg' ,
        'category' :'sport',
        'apiKey' :'65f7f556ec76449fa7ddc7c0069f040ca',
      },
    ).then((value) {
      biss = value.data['articles'];
      print(sport[0]['title']);
      emit(sportss());
    }).catchError((error)
    {
      print(error.toString());
      emit(sporterror(error.toString()));
    });


  }

  void getsci() {
    emit(sciloading());
    diohelp.getData
      (

      url:'v2/top-headlines',
      query:
      {
        'country':'eg' ,
        'category' :'sci',
        'apiKey' :'65f7f556ec76449fa7ddc7c0069f040ca',
      },
    ).then((value) {
      biss = value.data['articles'];
      print(sciee[0]['title']);
      emit(scis());
    }).catchError((error)
    {
      print(error.toString());
      emit(scie(error.toString()));
    });


  }



  void changebott (int index )
  {
    currindex=index;
    emit(appbott());
  }
}
