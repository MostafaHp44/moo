import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled2/Shared/cubit/appstate.dart';

import '../../Layout/archivedtask.dart';
import '../../Layout/donetask.dart';
import '../../Layout/newtask.dart';

class appcubit extends Cubit<appstate>
{
  appcubit() : super(appint());

  get CashHelper => null;
  static appcubit get(context)=> BlocProvider.of(context);
  int currentindex = 0;
  late Database databasee;

  List<Widget>screen =
  [
    newtask(),
    donetask(),
    archivedtask(),
  ];

  List <String>tex =
  [
    'Taskes',
    'Done',
    'Archived',
  ];

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  void todoChangeState(int index){
    currentindex=index;
    emit(TodoChangeBottomNavBarState());
  }
  void createDataBase()  {
    openDatabase(
      'todo2.db',
      version: 1,
      onCreate: (database, version) {
        print("database has created");
        database
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print("Table has created");
        }).catchError((error) {
          print("error is : ${error.toString()}");
        });
      },
      onOpen: (database) {
        getDataFromDataBase(database);
        print("database has opened");
      },
    ).then((value) {
      databasee=value;
      emit(TodoCreateDataBaseState());
    });
  }
  insertToDataBase(
      {required String title,
        required String date,
        required String time}) async {
    await databasee.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES( "$title", "$date", "$time", "new" )')
          .then((value) {
        print("$value inserted successfully");
        emit(TodoInsertDataBaseState());
        getDataFromDataBase(databasee);
      }).catchError((onError) {
        print('The Error while insert is ${onError.toString()}');
      });
    });
  }

  void getDataFromDataBase (dataBase)
  {
    newTasks=[];
    doneTasks=[];
    archiveTasks=[];
    dataBase.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if(element['status']=='new')
          newTasks.add(element);
        else if(element['status']=='done')
          doneTasks.add(element);
        else archiveTasks.add(element);
        print(element['status']);
      });
      emit(TodoGetDataBaseState());
    });
  }

  void updateData({required String status,required int id})
  {
    databasee.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]
    ).then((value) {
      getDataFromDataBase(databasee);
      emit(TodoUpdateDataBaseState());

    });
  }
  bool isBottomSheetShown = false;
  IconData flotIcon = Icons.edit;

  void changeBottomSheet({
    required bool isShow,
    required IconData icon,})
  {
    isBottomSheetShown=isShow;
    flotIcon=icon;
    emit(TodoChangeBottomSheetState());
  }
  void deleteData({required int id})
  {
    databasee.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDataBase(databasee);
      emit(TodoDeleteDataBaseState());
    });
  }

  bool isDark= false;
  void changeDarkMode({bool? fromShared})
  {
    if(fromShared!=null){

      isDark=fromShared;

      emit(ChangeAppMode());
    }
    else
    {
      isDark=!isDark;
      CashHelper.putBool(key: 'isDark', value: isDark).
      then((value) {
        emit(ChangeAppMode());
      });}

  }

  void changeindex ( int index)
  {
    currentindex =index ;
    emit(appn());
  }
}

  

