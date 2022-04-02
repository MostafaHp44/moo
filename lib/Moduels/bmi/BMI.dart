// ignore: file_names
// ignore_for_file: file_names

// ignore: file_names
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Moduels/bmis/bmiscreen.dart';
 class bmi extends StatefulWidget
 {


  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  bool Ismale =true ;
  bool Isfamale=true;

  double height=120.0;
 int weight=40;
 int age=20;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar:AppBar(
         title: Text
           (
             'BMI Calculator'
         ),
       ),
       body: Column(
         children: [
           Expanded(
             child: Row(
               children: [
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           Ismale=true;
                         });
                       },

                       child: Container(

                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                                 Icons.ac_unit,
                                 size: 70.0,
                             ),
                             SizedBox(
                               height: 10.0,
                             ),
                             Text(
                                 'Male',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 15.0,
                               ),
                             ),
                           ],
                         ),
                         decoration: BoxDecoration(borderRadius:BorderRadius.circular(10.0),
                           color: Ismale? Colors.blue:Colors.grey,
                         ),
                       ),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 15.0,
                 ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           Ismale=false;
                         });
                       },
                       child: Container(


                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.ac_unit,
                               size: 70.0,
                             ),
                             SizedBox(
                               height: 10.0,
                             ),
                             Text(
                               'FaMale',
                               style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 15.0,
                               ),
                             ),
                           ],
                         ),
                         decoration: BoxDecoration(borderRadius:BorderRadius.circular(10.0),
                           color:Ismale?Colors.grey:Colors.blue,

                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal:20.0),
               child: Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                         'Height',
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 15.0,
                       ),
                     ),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.baseline,
                       mainAxisAlignment:MainAxisAlignment.center,
                       textBaseline: TextBaseline.alphabetic,
                         children:[
                         Text(
                             '${height.round() }',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 15.0,
                           ),
                         ),
                         Text(
                             'CM',
                           style: TextStyle(
                             fontWeight:FontWeight.bold,
                             fontSize: 10.0,
                           ),
                         ),
                       ],
                     ),
                     Slider(
                       value: height,
                       max: 200,
                       min: 50,
                       onChanged: (value)
                       {
                         setState(() {
                           height=value;
                         });
                       },

                     ),


                   ],
                 ),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0),
                   color: Colors.grey[500],
                 ),
               ),
             ),
           ),
           Expanded(
             child:Row(
               children: [
                 Expanded (
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                               'Age',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20.0,
                               color: Colors.white,
                             ),
                           ),
                           Text(
                             '$age',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20.0,
                               color: Colors.white,
                             ),
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(
                                   onPressed: (){
                                     setState(() {
                                       age--;
                                     });
                                   },
                                 heroTag: age--,
                                 mini: true,
                                 child: Icon(Icons.remove),
                               ),
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     age++;
                                   });
                                 },
                                 heroTag: age++,
                                 mini: true,
                                 child: Icon(Icons.add),
                               ),

                             ],
                           )

                         ],
                       ),
                       decoration: BoxDecoration(
                           borderRadius:BorderRadius.circular(12.0),
                         color: Colors.deepPurple
                       ),
                     ),
                   ),
                 ),
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             'Weight',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20.0,
                               color: Colors.white,
                             ),
                           ),
                           Text(
                             '$weight',
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20.0,
                               color: Colors.white,
                             ),
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     weight--;
                                   });
                                 },
                                 mini: true,
                                 child: Icon(Icons.remove),
                               ),
                               FloatingActionButton(
                                 onPressed: (){
                                   setState(() {
                                     weight++;
                                   });
                                 },
                                 mini: true,
                                 child: Icon(Icons.add),
                               ),

                             ],
                           )

                         ],
                       ),
                       decoration: BoxDecoration(
                           borderRadius:BorderRadius.circular(12.0),
                           color: Colors.deepPurple
                       ),
                     ),
                   ),
                 ),


               ],
             ),
           ),
           Container(
             child: MaterialButton(
                     onPressed: (){
var res=weight/pow(height/100,2); 
print(res.round());
Navigator.push
  (
    context,
    MaterialPageRoute(
        builder: (context)=>bmiscreen(

           age: age,
          Ismale: Ismale,
          result: res.round(),
        ),
    ),

  );
                     },
                     child:Text(
                       'Calculate',
                     ),
             ),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15.0),
               color: Colors.yellow,
             ),
           ),

         ],
       ),
     );
    // TODO: implement build
  }
}
