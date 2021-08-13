import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const valueKey = ValueKey('HomeScreen');

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color color = Colors.white;
  double radius = 10;
  double fontSize = 16;
  double width = 150;
  double height = 150;

  _updateState() {
    setState(() {
      color = Colors.purple;
      radius = 30;
      fontSize = 36;
      width = 300;
      height = 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 900,
                ),
                curve: Curves.bounceOut,
                width: width,
                height: width,
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.purple.shade100,
                ),
                child: AnimatedDefaultTextStyle(
                  duration: Duration(
                    milliseconds: 900,
                  ),
                  curve: Curves.bounceOut,
                  style: TextStyle(
                    color: color,
                    fontSize: fontSize,
                    fontFamily: 'IRANSans',
                  ),
                  child: Text(
                    'سامانه ثجا',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _updateState();
                },
                child: Text('ثبت'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
