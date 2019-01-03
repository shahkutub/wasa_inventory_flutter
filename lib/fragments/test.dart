import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class YellowBird extends StatefulWidget {
  const YellowBird({ Key key }) : super(key: key);

  @override
  _YellowBirdState createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
  @override
  Widget build(BuildContext context) {
    return Container(

    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 40.0,
              width: 200.0,
              child: Text(
                'Syn',
                textAlign: TextAlign.center,

              ),
            ),


            new Container(
              height: 40.0,
              width: 200.0,
              child: Text(
                'Syn',
                textAlign: TextAlign.center,

              ),
            ),



            new Container(
              height: 40.0,
              width: 200.0,
              child: Text(
                'Syn',
                textAlign: TextAlign.center,

              ),
            ),


            new Container(
              height: 40.0,
              width: 200.0,
              child: Text(
                'Syn',
                textAlign: TextAlign.center,

              ),
            ),


            new Container(
              height: 40.0,
              width: 200.0,
              child: Text(
                'Syn',
                textAlign: TextAlign.center,

              ),
            ),


            new Container(
              height: 40.0,
              width: 200.0,
              child: Text(
                'Syn',
                textAlign: TextAlign.center,

              ),
            ),
          ],
        ),


      ],
    ),
    );
  }
}
