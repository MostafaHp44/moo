// ignore_for_file: file_names

// ignore: file_names
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Shared/cubit/cubit.dart';

import '../../app new/webv.dart';

Widget defaultButton({
  required double widht,
  required Color background,
  required Function function,
  required String text,
}) => Container(
  width: widht,
  color:background,
  height: 40.0,
  child: MaterialButton(
    onPressed: function(),
    child:Text(
      text.toUpperCase(),
      style:TextStyle(
        color:Colors.white,
      ),
    ),



  ),

);


Widget  defaultFormField({
required TextEditingController controller,
required TextInputType type,
Function? onsubmit,
Function? onChange,
Function? onTap,
bool isPassword = false ,
required Function validate,
required String label,
required IconData prefix,
Function? suffixPressed,
})=>TextFormField(
controller: controller,
keyboardType: type,
obscureText: isPassword,
decoration:  InputDecoration(
    labelText:'${label}',
    prefixIcon: Icon(
     prefix,
    ),
    border: OutlineInputBorder(),
  ),
);
Widget buildTasksItems(Map model,context) => Dismissible(
  key: Key(model['id'].toString())  ,
  child:Padding(padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
            '${model['time']}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model['title']}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${model['date']}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: (){
              appcubit.get(context).updateData(status: 'done', id:model['id'] );
            },
            icon:Icon(Icons.check_box,color: Colors.green,) ),
        IconButton(
            onPressed: (){
              appcubit.get(context).updateData(status: 'archive', id:model['id'] );
            },
            icon:Icon(Icons.archive,color: Colors.black45,) ),
      ],
    ),
  ),
  onDismissed:(direction) {
    appcubit.get(context).deleteData(id: model['id']);
  },
);
void navigateTo(context,Widget){
  Navigator.push(context,
      MaterialPageRoute(builder: (context)=> Widget
      ));
}

Widget buildArticleItems(article,context)=>InkWell (
  onTap: (){
    navigateTo(context, WebViewScreen(url: article['url'],));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: article['urlToImage'] !=null
                    ?DecorationImage(
                    image:NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover)
                    : DecorationImage(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png'),
                )
            )
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(
                      color: Colors.grey
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget dividerWidget()=>Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey,
);

Widget tasksEmptyBuilder({required List<Map>tasks
})=>ConditionalBuilder(
    condition:tasks.length>0,
    builder: (context)=>ListView.separated(
        itemBuilder: (context,index)=>buildTasksItems(tasks[index],context),
        separatorBuilder: (context,index)=>dividerWidget(),
        itemCount:tasks.length),
    fallback: (context)=>Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.menu,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            'No Tasks Yet Please add Some Tasks',
            style:TextStyle(
                fontSize:16,
                fontWeight: FontWeight.bold) ,)
        ],
      ),
    )
);

Widget articleBuilder(businessList, context,{required int itemCount,isSearch=false})=> ConditionalBuilder(
  condition: businessList.length>0,
  builder: (context)=> ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index)=>buildArticleItems(businessList[index],context),
      separatorBuilder:(context ,index)=>dividerWidget() ,
      itemCount:itemCount),
  fallback: (context)=>isSearch?Container():Center(child: CircularProgressIndicator()),
);
