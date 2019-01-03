
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasa_inventory/fragments/piechart.dart';
import 'package:wasa_inventory/main.dart';
import 'package:http/http.dart' as http;

class DhshBoardFragment extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return new DhshBoardFragmentState();
  }
}

String name='';
String warehouse='';
String warehouseid='';
String purches='';
double stock;
String gatepass='';

bool _progressBarActive = true;
class DhshBoardFragmentState extends State<DhshBoardFragment> {


  Color _defultColor = Colors.blue;
  Color _allColor = Colors.black26;

  @override
  void initState() {
    super.initState();
    getCredential();

  }

  SharedPreferences sharedPreferences;
  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      bool checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          warehouse= sharedPreferences.getString("warehouse");
          name = sharedPreferences.getString("username");
          warehouseid = sharedPreferences.getString("warehouseid");
          print("warehouseid"+warehouseid);

          fetchPost(warehouseid);


        } else {

          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black12,

      body: Column(

        children: <Widget>[
          new Row(
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

                          fetchPost(warehouseid);
                          //_progressBarActive = false;

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
                          fetchPostAll();
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

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new InkWell(
                    onTap: () {
                      setState(() {
//                        if (_allColor == Colors.black26) {
//                          _defultColor = Colors.black26;
//                          _allColor = Colors.blue;
//                        }
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
                      margin: EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 0.0),
                      width: 140.0,
                      height: 140.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.orange, width: 2.0),
                        borderRadius: new BorderRadius.circular(85.0),
                      ),
                      child: new Column(
                        //child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            purches,
                            style: new TextStyle(fontSize: 15.0, color: Colors.black,),
                          ),
                          new Text(
                            'Total Purchase Order',
                            style: new TextStyle(fontSize: 13.0, color: Colors.black,),
                          ),

                        ],
                        // ),
                      ),
                    ),

                  ),
                ],
              ),

            ],
          ),

          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new InkWell(
                    onTap: () {
                      setState(() {
//                        if (_defultColor == Colors.black26) {
//                          _defultColor = Colors.blue;
//                          _allColor = Colors.black26;
//                        }
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
                      margin: EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 0.0),
                      width: 140.0,
                      height: 140.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.deepPurple, width: 2.0),
                        borderRadius: new BorderRadius.circular(85.0),

                      ),
                        child: new Column(
                          //child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              '$stock',
                              style: new TextStyle(fontSize: 15.0, color: Colors.black,),
                            ),
                            new Text(
                              'Total Stocked Value',
                              style: new TextStyle(fontSize: 13.0, color: Colors.black,),
                            ),

                          ],
                          // ),
                        )
                    ),
                  ),
                ],
              ),

              new Container(
                padding: const EdgeInsets.only(right: 15.0),

              ),

              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new InkWell(
                    onTap: () {
                      setState(() {
//                        if (_allColor == Colors.black26) {
//                          _defultColor = Colors.black26;
//                          _allColor = Colors.blue;
//                        }
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
                      margin: EdgeInsets.only(left: 0.0,top: 0.0,right: 0.0,bottom: 0.0),
                      width: 140.0,
                      height: 140.0,
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.orange, width: 2.0),
                        borderRadius: new BorderRadius.circular(85.0),
                      ),
                      child: new Column(
                        //child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              gatepass,
                              style: new TextStyle(fontSize: 15.0, color: Colors.black,),
                            ),
                                 new Text(
                                'Total Gate Pass',
                                style: new TextStyle(fontSize: 13.0, color: Colors.black,),
                                ),

                          ],
                       // ),
                      ),
                    ),

                  ),
                ],
              ),


            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(

                child:  new DonutPieChart(),
              ),


            ],

          )
        ],
      ),




    );
  }


  void _onLoading() {


    showDialog(
      context: context,
      barrierDismissible: false,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [

//            new Container(
//              height: 40.0,
//              width: 50.0,
//              padding: EdgeInsets.only(left: 5.0,top: 20.0,right: 0.0,bottom: 20.0),
//            ),
            new CircularProgressIndicator(
              backgroundColor: Colors.black12,
            ),
//            new Text("Loading"
//            ),
          ],

        )
//      child: new Dialog(
//        child: new Row(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: [
//
//            new Container(
//              height: 40.0,
//              width: 50.0,
//              padding: EdgeInsets.only(left: 5.0,top: 20.0,right: 0.0,bottom: 20.0),
//            ),
//            new CircularProgressIndicator(
//              backgroundColor: Colors.black12,
//            ),
//            new Text("Loading"
//            ),
//          ],
//        ),
//      ),
    );

    new Future.delayed(new Duration(seconds: 3), () {
      Navigator.pop(context); //pop dialog
      //_login();
    });
  }



   Future<DashBoardResponse> fetchPost(String warehouse_id) async {

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('no connected');
      }
    } on SocketException catch (_) {
      print('not connected');
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has typed in using our
            // TextEditingController
            content: Text("No Internet Connection!"),
          );
        },
      );
    }

    _onLoading();

//    setState(() {
//      _progressBarActive == false;
//    });

    http.Response response = await http.post("http://123.49.33.106/dhaka_wasa/admin/dashboard", body: {'warehouse_id': warehouse_id}); // post api call
    if (response.statusCode == 200) {

      // If the call to the server was successful, parse the JSON
      final DashBoardResponse data = DashBoardResponse.fromJson(json.decode(response.body));



      setState(() {
        //_progressBarActive == false;
        purches = data.data.total_purchase_order;
        stock = data.data.total_stock_value;
        gatepass = data.data.total_gate_pass;
      });

//      return showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            // Retrieve the text the user has typed in using our
//            // TextEditingController
//            content: Text(purches),
//          );
//        },
//      );

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<DashBoardResponse> fetchPostAll() async {

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('no connected');
      }
    } on SocketException catch (_) {
      print('not connected');
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has typed in using our
            // TextEditingController
            content: Text("No Internet Connection!"),
          );
        },
      );
    }

    _onLoading();

//    setState(() {
//      _progressBarActive == false;
//    });

    http.Response response = await http.post("http://123.49.33.106/dhaka_wasa/admin/dashboard", body: {}); // post api call
    if (response.statusCode == 200) {

      // If the call to the server was successful, parse the JSON
      final DashBoardResponse data = DashBoardResponse.fromJson(json.decode(response.body));



      setState(() {
        //_progressBarActive == false;
        purches = data.data.total_purchase_order;
        stock = data.data.total_stock_value;
        gatepass = data.data.total_gate_pass;
      });

//      return showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            // Retrieve the text the user has typed in using our
//            // TextEditingController
//            content: Text(purches),
//          );
//        },
//      );

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}


class DashBoardResponse {
  final int code;
  final String status;
  final String message;
  DashBoardData data = new DashBoardData();

  DashBoardResponse({this.code, this.status, this.message,this.data});

  factory DashBoardResponse.fromJson(Map<String, dynamic> json) {
    return DashBoardResponse(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data:DashBoardData.fromJson(json['data']),
    );
  }
}


class DashBoardData {

  String total_purchase_order;
  String total_gate_pass;
  double total_stock_value;

  DashBoardData({this.total_purchase_order, this.total_gate_pass, this.total_stock_value});

  factory DashBoardData.fromJson(Map<String, dynamic> json) {
    return DashBoardData(
        total_purchase_order: json['total_purchase_order'],
        total_gate_pass: json['total_gate_pass'],
        total_stock_value: json['total_stock_value']

    );
  }

}


