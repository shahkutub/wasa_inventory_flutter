import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wasa_inventory/main.dart';
import 'package:connectivity/connectivity.dart';
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'New contact'),
    );
  }
}

class Post {
  final int code;
  final String status;
  final String message;

  User user = new User();


  Post({this.code, this.status, this.message,this.user});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      user:User.fromJson(json['user']),
    );
  }
}


class User {
  final String user_id;
  final String role_id;
  final String role_name;
  final String access_level;

  final String full_name;
  final String email;
  final String mobile;
  final String warehouse_id;
  final String warehouse_name;

  final String division_id;
  final String division_name;
  final String designation_id;

  final String designation_name;
  final String store_available;
  final String avatar;
  final String signature;


  User({this.user_id, this.role_id, this.role_name, this.access_level, this.full_name, this.email, this.mobile, this.warehouse_id,
    this.warehouse_name, this.division_id, this.division_name, this.designation_id, this.designation_name, this.store_available,
    this.avatar, this.signature });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_id: json['user_id'],
      role_id: json['role_id'],
      role_name: json['role_name'],
      access_level: json['access_level'],

      full_name: json['full_name'],
      email: json['email'],
      mobile: json['mobile'],
      warehouse_name: json['warehouse_name'],
      division_id: json['division_id'],
      division_name: json['division_name'],

      designation_id: json['designation_id'],
      designation_name: json['designation_name'],
      store_available: json['store_available'],
      avatar: json['avatar'],
      signature: json['signature'],

    );
  }
}




 bool connectivity(){
   var connectivityResult =  (new Connectivity().checkConnectivity());
   if (connectivityResult == ConnectivityResult.mobile) {
     return true;
   } else if (connectivityResult == ConnectivityResult.wifi) {
     return true;
   }else{
     return false;
   }
 }

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController emailController = new TextEditingController();
  TextEditingController passWordController = new TextEditingController();

  GlobalKey<FormState> _key = new GlobalKey();
  bool _autoValidate = false;
  String _email;
  String password;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      body: new Form(

        key: _key,
        autovalidate: _autoValidate,

        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset('images/wasa.png', scale: 1.0, width: 200.0, height: 200.0),
            new ListTile(
              leading: const Icon(Icons.person),
              title: new TextFormField(

                //validator: validateEmail,
                onSaved: (String val) {
                  _email = val;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: new TextStyle(
                    fontSize: 20.0,
                    height: 2.0,
                    color: Colors.black
                ),
                decoration: new InputDecoration(
                  hintText: "Email",
                ),

              ),
            ),

            new ListTile(
              leading: const Icon(Icons.enhanced_encryption),
              title: new TextFormField(

                validator: validatePassWord,
                onSaved: (String val) {
                  password = val;
                },
                controller: passWordController,
                obscureText: true,
                style: new TextStyle(
                    fontSize: 20.0,
                    height: 2.0,
                    color: Colors.black
                ),
                decoration: new InputDecoration(
                  hintText: "Password",
                ),
              ),
            ),


            new Container(
              margin: const EdgeInsets.only(top: 40.0),
              width: 200.0,
              height: 50.0,
              child :  new RaisedButton(
                textColor: Colors.white,
                child: const Text(' Sign In   '),
                color: Theme.of(context).accentColor,
                elevation: 8.0,
                splashColor: Colors.blueGrey,
                onPressed: _sendToServer,
                // onPressed: () => toast_show(),

//            onPressed: () {
//              return showDialog(
//                context: context,
//                builder: (context) {
//                  return AlertDialog(
//                    // Retrieve the text the user has typed in using our
//                    // TextEditingController
//                    content: Text(emailController.text),
//                  );
//                },
//              );
//            },

              ),
            ),

          ],
        ),
      ),


    );
  }


  static Future<Map> postData(Map data) async {
    http.Response res = await http.post("", body: {'Email': 'doodle', 'color': 'blue'}); // post api call
    Map data = json.decode(res.body);
    return data;
  }

  Future<Post> fetchPost(String email,String pass) async {
    //final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
    http.Response response = await http.post("http://123.49.33.106/dhaka_wasa/admin/login", body: {'username': email, 'password': pass}); // post api call
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
     final Post data = Post.fromJson(json.decode(response.body));

            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the user has typed in using our
                    // TextEditingController
                    content: Text(data.user.warehouse_name),
                  );
                },
              );
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }



  void toast_show() {
    showToast("content");
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }


  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }


  String validatePassWord(String value) {

    if (value.length == 0) {
      return "Password is Required";
    } else if (value.length < 6) {
      return "Password must be 6 digit";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if(value.length != 10){
      return "Mobile number must 10 digits";
    }else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }


  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Email $_email");
      print("Password $password");

      if(!connectivity()){
              return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the user has typed in using our
                    // TextEditingController
                    content: Text("No internet connection!"),
                  );
                },
              );
      }else{
        fetchPost(_email,password);
      }



    } else {
      // validation error
      setState(() {
        _autoValidate= true;
      });
    }
  }




}