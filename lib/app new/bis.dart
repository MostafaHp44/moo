import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/app%20new/cubitappnews/cubit%20app.dart';
import 'package:untitled2/app%20new/cubitappnews/state%20app.dart';

import '../Shared/Compon/Compon.dart';

class bis extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<appnewscubit,stateapp>(
      listener: (context,state){},
      builder: (context,state){
        List biss=appnewscubit.get(context).biss;
        return articleBuilder(biss,context,itemCount:10);
      },
    );
  }
}