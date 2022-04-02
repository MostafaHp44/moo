import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:(Colors.red),
title: Text('MBN',),
leading: Icon(
  Icons.menu,
),
        actions: [
          IconButton(
              onPressed:()
              {

              },
              icon: Icon(
                Icons.notification_important,
              ),
          ),
          IconButton(
            onPressed:()
            {

            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],



      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container (
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,


            children:
                [
         
                  Image(
                      image: NetworkImage(
                        'https://sportshub.cbsistatic.com/i/r/2019/11/07/04a0f1ab-3a63-408f-aefa-2eebc50ddc65/thumbnail/770x433/b28dcbd21e1c80b8a282bdba6b9340a3/13fb012e-7aff-e911-80cd-fa7ca2e6058b-original.jpg'
                      ),
                  ),

          Container(


          ),
          Container(

            child: Text('Welcom To MBN SOFT',
              style: TextStyle(
                backgroundColor:Colors.black,
                color: Colors.white,
                fontSize: 25,

              ),
            ),
          ),
          Container(

                    child: Text('MBN SOFT IS NewCompany',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('MBN SOFT is Made By Nubian',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('We Hope TO Happy All People',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 20,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('Welcom To MBN SOFT',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('MBN SOFT IS NewCompany',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('MBN SOFT is Made By Nubian',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('We Hope TO Happy All People',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 20,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('Welcom To MBN SOFT',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('MBN SOFT IS NewCompany',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('MBN SOFT is Made By Nubian',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('We Hope TO Happy All People',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 20,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('Welcom To MBN SOFT',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                  Container(

                    child: Text('MBN SOFT IS NewCompany',
                      style: TextStyle(
                        backgroundColor:Colors.black,
                        color: Colors.white,
                        fontSize: 25,

                      ),
                    ),
                  ),
                ]

          ),


        )

      ),



      );

    // TODO: implement build
    throw UnimplementedError();
  }
}
