import 'package:flutter/material.dart';
import 'streets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Intersection split;
  Intersection split2;
  Intersection split3;
  Car car;
  _MyHomePageState() {
    split = Intersection("Harpy", "Clover");
    split2 = Intersection.road(split.one, "Main");
    split3 = Intersection.existing(split.two, split2.two);
    car = Car(split.one);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(car.plus1.toString()),
            Text(car.road.name),
            Container(
              width: 50,
              height: 50,
              child: Text(car.intersection.one.name),
              color: Colors.green,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  child: Text(car.intersection.two.name),
                  color: Colors.green,
                ),
                Container(width: 50, height: 50, color: Colors.black),
                Container(width: 50, height: 50, color: Colors.black)
              ],
            ),
            Container(width: 50, height: 50, color: Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text("Left"),
                  onPressed: () {
                    setState(() {
                      car.turnLeft();
                    });
                  },
                ),
                TextButton(
                  child: Text("Forward"),
                  onPressed: () {
                    setState(() {
                      car.pass();
                    });
                  },
                ),
                TextButton(
                  child: Text("Right"),
                  onPressed: () {
                    setState(() {
                      car.turnRight();
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
