import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/app%20new/cubitappnews/cubit%20app.dart';
import 'package:untitled2/app%20new/cubitappnews/state%20app.dart';

class appnews extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) =>appnewscubit()..getbis(),
      child: BlocConsumer<appnewscubit,stateapp>(
        listener: (context, state) {},
        builder: (context,state)
    {
      var cubit =appnewscubit.get(context);

     return Scaffold(
        appBar: AppBar(
          title: Text(
            'App news '    ,
          ),
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.dark_mode)
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.brightness_1)
            )
          ],
        ),
        body: cubit.screens[cubit.currindex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currindex,
          onTap:(index)
          {

cubit.changebott(index);
          },
          items:cubit.bott,
        ),

      );
    },

          ),
        );

  }
}