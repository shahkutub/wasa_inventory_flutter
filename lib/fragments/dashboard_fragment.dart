
import 'package:flutter/material.dart';
import 'package:wasa_inventory/fragments/first_fragment.dart';
import 'package:wasa_inventory/fragments/home_fragment.dart';
import 'package:wasa_inventory/fragments/second_fragment.dart';
import 'package:wasa_inventory/fragments/third_fragment.dart';
import 'package:wasa_inventory/main.dart';
import 'package:shared_preferences/shared_preferences.dart';





class DhshBoardFragment extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return new DhshBoardFragmentState();
  }
}


class DhshBoardFragmentState extends State<DhshBoardFragment> {

  Color _defultColor = Colors.blue;
  Color _allColor = Colors.black26;

  @override
  void initState() {
    super.initState();
    //getChange();
  }

  //String name,warehouse;



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black26,

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          new Column(
            children: <Widget>[
              new InkWell(
                onTap: () {
                  setState(() {
                    if (_defultColor == Colors.black26) {
                      _defultColor = Colors.blue;
                      _allColor = Colors.black26;
                    }
                  });
//                  showDialog(
//                    context: context,
//                    builder: (context) {
//                      return AlertDialog(
//                        // Retrieve the text the user has typed in using our
//                        // TextEditingController
//                        content: Text("No Internet Connection!"),
//                      );
//                    },
//                  );
                },
                child: new Container(
                  margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
                  width: 150.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                    color: _defultColor,
                    border: new Border.all(color: Colors.white, width: 2.0),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: new Center(child: new Text('Default', style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
                ),
              ),
            ],
          ),

          new Container(
            padding: const EdgeInsets.only(right: 3.0),

          ),

          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new InkWell(
                onTap: () {
                  setState(() {
                    if (_allColor == Colors.black26) {
                      _defultColor = Colors.black26;
                      _allColor = Colors.blue;
                    }
                  });
//                  showDialog(
//                    context: context,
//                    builder: (context) {
//                      return AlertDialog(
//                        // Retrieve the text the user has typed in using our
//                        // TextEditingController
//                        content: Text("No Internet Connection!"),
//                      );
//                    },
//                  );
                },

                child: new Container(
                  margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
                  width: 150.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                    color: _allColor,
                    border: new Border.all(color: Colors.white, width: 2.0),
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: new Center(child: new Text('All warehouse',
                    style: new TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                  ),
                ),



              ),

//             new GestureDetector(
//                 onTap: (){
//                   //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
//                 },
//                 child: new Container(
//                   padding: EdgeInsets.only(left: 25.0,top: 15.0,right: 25.0,bottom: 15.0,),
//                   margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 0.0),
//                   decoration: BoxDecoration(color: Colors.blue),
//                   child: new Row(
//                       children: [
//                         new Text(
//                           "All Warehouse",textAlign: TextAlign.center,
//                         ),
//                       ]
//                   ),
//                 )
//             ),
            ],
          ),

        ],
      ),
    );
  }





}
