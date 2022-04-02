import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Shared/Compon/Compon.dart';
import 'cubitappnews/cubit app.dart';
import 'cubitappnews/state app.dart';

class sports extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<appnewscubit,stateapp>(
      listener:(context,state){},
      builder: (context,state)
      {
        List sports=appnewscubit.get(context).sport;
        return articleBuilder(sports,context,itemCount:10);
      },
    );

  }
}