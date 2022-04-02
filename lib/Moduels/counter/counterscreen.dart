import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/Moduels/counter/Cubit/cubit.dart';
import 'package:untitled2/Moduels/counter/Cubit/state.dart';

class counterscreen extends StatelessWidget
{ 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> countercubit(),
      child: BlocConsumer<countercubit,counterstate>
        (
        listener: (context,state)
        {
          
        },
        builder: (context , state)
        {
         return Scaffold(
              appBar: AppBar(
                title: Text(
                    'counter'
                ),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton (
                      onPressed: ()
                      {
                     countercubit.get(context).min();
                      },
                      child: Text(
                          'MINUS'
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text (
                        '${countercubit.get(context).counter}',
                        style:TextStyle(
                          fontSize:30.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: ()
                      {
                        countercubit.get(context).plus();
                      },
                      child: Text(
                          'PLUS'
                      ),
                    ),


                  ],
                ),
              )
          );
        },

      ),
    );
  }
}




 
  

