
import 'package:flutter/material.dart';
import 'package:wasa_inventory/fragments/first_fragment.dart';
import 'package:wasa_inventory/fragments/second_fragment.dart';
import 'package:wasa_inventory/fragments/third_fragment.dart';
import 'package:wasa_inventory/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

    Future<User> getUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      User user = prefs.get("user");
      return user;
    }




class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Fragment 1", Icons.rss_feed),
    new DrawerItem("Fragment 2", Icons.local_pizza),
    new DrawerItem("Fragment 3", Icons.info)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  String name,warehouse;

  Future<String> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name");
  }


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }



    return new Scaffold(
      appBar: new AppBar(


        actions: <Widget>[

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                      onTap: (){
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
                      },
                      child: new Container(
                        child: new Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage('https://avatars2.githubusercontent.com/u/17681888?s=400&u=010445b61e6af342689d0dbf6fd81e47563d0c8c&v=4'),
                              ),
                              new Text(
                                "Sadi",
                              ),
                            ]
                        ),
                      )
                  ),
                ],
              ),

              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                      onTap: (){
                       //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
                       },
                  child: new Container(
                  child: new Column(
                  children: [
                    new Text("0"),

                    Icon(
                    Icons.notifications,
                    size:22,
                    color: Colors.deepOrange,
                  ),
                  new Text(
                    "Requisition",
                  ),
                ]
                  ),
                )
              ),
                ],
                  ),

              new Container(
                padding: const EdgeInsets.only(right: 5.0),

              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                      onTap: (){
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
                      },
                      child: new Container(
                        child: new Column(
                            children: [
                              new Text("0"),

                              Icon(
                                Icons.notifications,
                                size:22,
                                color: Colors.deepPurple,
                              ),
                              new Text(
                                "Stock transfer",
                              ),
                            ]
                        ),
                      )
                  ),
                ],
              ),

              new Container(
                padding: const EdgeInsets.only(right: 5.0),

              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new GestureDetector(
                      onTap: (){
                        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstFragment()));
                      },
                      child: new Container(
                        child: new Column(
                            children: [
                              new Text("0"),

                              Icon(
                                Icons.notifications,
                                size:22,
                                color: Colors.amber,
                              ),
                              new Text(
                                "Loan",
                              ),
                            ]
                        ),
                      )
                  ),
                ],
              ),
              new Container(
                padding: const EdgeInsets.only(right: 15.0),

              ),
            ],

          ),

        ],

      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage('https://avatars2.githubusercontent.com/u/17681888?s=400&u=010445b61e6af342689d0dbf6fd81e47563d0c8c&v=4'),

                ),
                accountName: new Text(name.toString()),
                accountEmail: new Text("ghghg")),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }



}
