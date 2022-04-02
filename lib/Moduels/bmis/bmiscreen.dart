import 'package:flutter/material.dart';
class bmiscreen extends StatelessWidget
{
final int result;
final bool Ismale;
final int age;
bmiscreen({
  required this.result,
  required this.age,
  required this.Ismale,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Bmi Calc',
        ),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Gender:${Ismale? 'male':'famale' }',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Result:$result',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Age:$age',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),




          ],
        ),
      ),

      );

    // TODO: implement build
    throw UnimplementedError();
  }
}