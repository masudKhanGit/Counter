import 'package:flutter/material.dart';
import 'package:flutter_application_3/utls/colormanager.dart';

import 'box.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({Key? key}) : super(key: key);

  @override
  _MyCounterState createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int number = 0;
  int puls = 0;
  int minus = 0;
  List<Color> color = ColorManager.colors;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Counter"),
        ),
        backgroundColor: color[number % color.length],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$number",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number++;
                      puls++;
                    });
                  },
                  child: Text("+"),
                  style: ElevatedButton.styleFrom(
                    primary: color[puls % color.length],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (number > 0) {
                      setState(() {
                        number--;
                        minus++;
                      });
                    }
                  },
                  child: Text("-"),
                  style: ElevatedButton.styleFrom(
                    primary: color[minus % color.length],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (var i = 1; i <= number; i++) Box(color: color, i: i),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
