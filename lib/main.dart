import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Material(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _widgetBarPadding = 20;

  @override
  Widget build(BuildContext context) {
    // Get the widget dimensions
    final Size size = MediaQuery.of(context).size;

    return Container(
        // BACKGROUND GRADIENT
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blueAccent, Colors.deepPurpleAccent],
        )),
        child: SafeArea(
            // PAGE CONTENT
            child: Column(
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            // TITLE TEXT
            Row(children: <Widget>[
              Spacer(flex: 1),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nextbase.',
                    style: TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Spacer(
                flex: 4,
              ),
            ]),
            Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 20,
              child: Column(
                children: <Widget>[
                  // Car miles widget bar
                  WidgetBar(
                    child: Container(
                        alignment: Alignment.center,
                        width: size.width - _widgetBarPadding,
                        height: 100,
                        padding: EdgeInsets.only(left: 30, right: 20),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Today's miles:\n",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '156!',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )),
                          Icon(
                            Icons.directions_car,
                            color: Colors.white,
                            size: 70,
                          )
                        ])),
                    colorA: Colors.orangeAccent,
                    colorB: Colors.deepOrangeAccent,
                  ),
//                  Spacer(flex: 1),
                  SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      "assets/images/dashcam.jpg",
                      width: size.width - _widgetBarPadding,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // what 3 words
                  WidgetBar(
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width - _widgetBarPadding,
                      height: 130,
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 5, bottom: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Expanded(
                                  child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: "Hiked.Headset.Embers",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white),
                                ),
                              )),
                              Text(
                                "///",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              )
                            ]),
                            Container(
                                height: 50,
                                width: 280,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                ),
                                child: Text(
                                  "SOS",
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.redAccent),
                                ))
                          ]),
                    ),
                    colorA: Colors.red,
                    colorB: Colors.redAccent,
                  ),
                ],
              ),
            ),
            // APP BAR
            getAppBar(),
          ],
        )));
  }
}

Widget getAppBar() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white54,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    ),
    child: Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            Icons.share,
            size: 30,
            color: Colors.white70,
          ),
          Icon(
            Icons.photo_camera,
            size: 50,
            color: Colors.white,
          ),
          Icon(
            Icons.menu,
            size: 30,
            color: Colors.white70,
          )
        ],
      ),
    ),
  );
}

/*
WidgetBar contains a child with a rounded colour container
 */
class WidgetBar extends StatefulWidget {
  final Widget child;
  final Color colorA;
  final Color colorB;

  const WidgetBar(
      {Key key,
      this.child,
      this.colorA = Colors.white,
      this.colorB = Colors.white})
      : super(key: key);

  @override
  _WidgetBarState createState() => _WidgetBarState();
}

class _WidgetBarState extends State<WidgetBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [widget.colorA, widget.colorB],
        ),
        boxShadow: [
          BoxShadow(
            color: widget.colorB.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 15,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
