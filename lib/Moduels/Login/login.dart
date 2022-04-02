import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Shared/Compon/Compon.dart';
class loginscreen extends StatelessWidget
{
  var emailcon=TextEditingController();
  var password=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(60.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'login',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: emailcon,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value)
                  {
                    print(value);
                  },
                  onChanged: (String value)
                  {
                    print(value);

                  },
                  validator: (value)
                  {
                    if(value!.isEmpty)
                      {
                        return 'email adress must not empty' ;
                      }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Adrees' ,
                    prefixIcon:Icon( Icons.email
                    ),
                    border: OutlineInputBorder(),
                  ),

                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (String value)
                  {
                    print(value);
                  },
                  onChanged: (String value)
                  {
                    print(value);

                  },
                  decoration: InputDecoration(
                    labelText: 'Password' ,
                    prefixIcon:Icon( Icons.lock
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                    ),

                ),
                SizedBox(
                  height: 10.0,
                ),
                defaultButton(
                    text: ' login',
                  background:Colors.yellow ,
                  function: ()
                      {

                      },
                  widht:double.infinity ,
                ),
                Row(
  children: [
    Text(
      'Dont Have An Acc'
    ),
    TextButton(
        onPressed: ()
        {

        },
        child: Text(
      'Regster Now',
    )
    ),
  ],
),
              ],

),
          ),

      ),

      );


  }
}
