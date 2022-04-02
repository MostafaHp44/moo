import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled2/Layout/archivedtask.dart';
import 'package:untitled2/Layout/donetask.dart';
import 'package:untitled2/Layout/newtask.dart';
import 'package:untitled2/Shared/Compon/Compon.dart';
import 'package:untitled2/Shared/cubit/cubit.dart';

import '../Shared/cubit/appstate.dart';

class Homelay extends StatelessWidget
{

  var scafkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
        create: (BuildContext context) => appcubit(),
        child: BlocConsumer<appcubit, appstate>
          (
          listener: (BuildContext context, appstate state) {},
          builder: (BuildContext context, appstate state)
          {

          return Scaffold(
              key: scafkey,
              appBar: AppBar(
                title: Text(
                 appcubit.get(context).tex[appcubit.get(context).currentindex],
                ),
              ),
              body: appcubit.get(context).screen[appcubit.get(context).currentindex],
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (isBottomSheetShown) {
                    insertdatabase(
                      time: timeController.text,
                      title: titleController.text,
                    ).then((value) {
                      Navigator.pop(context);
                      isBottomSheetShown = false;
                      // setState(() {
                      //  fabIcon=Icons.edit;
                      //});
                    });
                  }
                  else {
                    scafkey.currentState!.showBottomSheet((context) =>
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(

                            key: formkey,
                            child: Column(

                              mainAxisSize: MainAxisSize.min,
                              children:
                              [
                                defaultFormField
                                  (
                                  controller: titleController,
                                  type: TextInputType.text,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'title must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Title',
                                  prefix: Icons.title,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                defaultFormField
                                  (
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'title must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Time',
                                  prefix: Icons.timelapse_outlined,
                                ),
                              ],
                            ),
                          ),
                        ),


                    );
                    isBottomSheetShown = true;
                    //setState(() {
                    //fabIcon=Icons.add;
                    //});
                  }
                },
                child: Icon(
                  fabIcon,
                ),

              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: appcubit.get(context).currentindex,
                onTap: (index)
                {
                  appcubit.get(context).changeindex(index);
                  //setState(()
                  //{
                  //currentindex=index;
                  //});
                },

                items:
                [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu,
                    ),
                    label: 'Tasks',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline
                    ),
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined
                    ),
                    label: 'Archived',
                  ),
                ],

              ),
            );
          },
        ),
    );
    // TODO: implement build
  }
}

late Database database;
void creatdatabase() async {
  database = await openDatabase(
    'todo.db',
    version: 1,
    onCreate: (database,version)
    {
      print('database created');
      database.execute('CREAT TABLE tasks( id INTEGER PRIMARY KEY ,title TEXT, date TEXT ,status TEXT)').then((value) {
        print('table created');
      }).catchError((error){
        print('Error When Creating Table${error.tostring()}');
      });
    },
    onOpen: (database)
    {
      getdata();
      print('database opened');
    },
  );
}
Future insertdatabase({
  required String title,
  required String time,
}) async
{
  return await database.transaction((txn)
  async {
    txn.rawInsert('INSERT INTO tasks(title ,date, time, status)VALUES("$title ","0232","$time","single")').then((value)
    {
      print('$value inserted successfully');
    }).catchError((error)
    {
      print('Error when inserting${error.toString()}');
    });

  });

}
void getdata()async
{
  List<Map> tasks =await database.rawQuery('SELECET *FROM tasks');
  print('data opend');
}



