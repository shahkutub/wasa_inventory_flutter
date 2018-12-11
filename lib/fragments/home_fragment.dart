import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  var _myColor;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black26,

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new OutlineButton(onPressed: null,
//            color:Colors.cyanAccent,
//
//             child: new Text("Defult"),
//
//            )
//
//          ],



       children: <Widget>[
         new Column(
           children: <Widget>[

             new InkWell(
               onTap: () {

                 if(_myColor==null){
                   _myColor = Colors.deepPurple;
                 }else{
                   _myColor = null;
                 }

               },
               child: new Container(
                 margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
                 width: 150.0,
                 height: 50.0,
                 decoration: new BoxDecoration(
                   color: _myColor,
                   border: new Border.all(color: Colors.white, width: 2.0),
                   borderRadius: new BorderRadius.circular(10.0),
                 ),
                 child: new Center(child: new Text('Default', style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
               ),
             ),


//             new GestureDetector(
//                 onTap: (){
//                   //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
//                 },
//                 child: new Container(
//                   padding: EdgeInsets.only(left: 40.0,top: 15.0,right: 40.0,bottom: 15.0,),
//                   margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 0.0),
//                   decoration: BoxDecoration(color: Colors.cyanAccent),
//                   child: new Row(
//
//                       children: [
//                         Text("Default", textAlign: TextAlign.center,)
//                       ]
//                   ),
//                 )
//             ),
           ],
         ),

         new Container(
           padding: const EdgeInsets.only(right: 1.0),

         ),

         new Column(

           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[

             new InkWell(
               onTap: () {

                 if(_myColor==null){
                   _myColor = Colors.blue;
                 }else{
                   _myColor = null;
                 }
                  showDialog(
                   context: context,
                   builder: (context) {
                     return AlertDialog(
                       // Retrieve the text the user has typed in using our
                       // TextEditingController
                       content: Text("No Internet Connection!"),
                     );
                   },
                 );


               },
               child: new Container(
                 margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
                 width: 150.0,
                 height: 50.0,
                 decoration: new BoxDecoration(
                   color: _myColor,
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