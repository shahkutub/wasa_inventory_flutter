import 'package:flutter/material.dart';
import 'package:wasa_inventory/model/requisition_issue_info.dart';


class Requisition_issue extends StatefulWidget {
  @override
  _ListViewState createState() => new _ListViewState();
}

class _ListViewState extends State<Requisition_issue> {
  final List<RequisitionIsueeInfo> items = new List();

  @override
  void initState() {
    super.initState();
    setState(() {
      items.add(new RequisitionIsueeInfo(
        1,
        2,
        'qui est esse',
        'est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla',
      ));
      items.add(new RequisitionIsueeInfo(
        1,
        3,
        'ea molestias',
        'et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut',
      ));
      items.add(new RequisitionIsueeInfo(
        2,
        4,
        'eum et est',
        'ullam et saepe reiciendis voluptatem adipisci\nsit amet autem assumenda provident rerum culpa\nquis hic commodi nesciunt rem tenetur doloremque ipsam iure\nquis sunt voluptatem rerum illo velit',
      ));
      items.add(new RequisitionIsueeInfo(
        2,
        5,
        'nesciunt quas',
        'repudiandae veniam quaerat sunt sed\nalias aut fugiat sit autem sed est\nvoluptatem omnis possimus esse voluptatibus quis\nest aut tenetur dolor neque',
      ));
      items.add(new RequisitionIsueeInfo(
        3,
        6,
        'dolorem eum ',
        'ut aspernatur corporis harum nihil quis provident sequi\nmollitia nobis aliquid molestiae\nperspiciatis et ea nemo ab reprehenderit accusantium quas\nvoluptate dolores velit et doloremque molestiae',
      ));
      items.add(new RequisitionIsueeInfo(
        3,
        7,
        'magnam facilis ',
        'dolore placeat quibusdam ea quo vitae\nmagni quis enim qui quis quo nemo aut saepe\nquidem repellat excepturi ut quia\nsunt ut sequi eos ea sed quas',
      ));
      items.add(new RequisitionIsueeInfo(
        3,
        8,
        'dolorem dolore',
        'dignissimos aperiam dolorem qui eum\nfacilis quibusdam animi sint suscipit qui sint possimus cum\nquaerat magni maiores excepturi\nipsam ut commodi dolor voluptatum modi aut vitae',
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
                  itemCount: items.length,
                  padding: const EdgeInsets.all(15.0),
                  itemBuilder: (context, position) {

                    return Column(

                      children: <Widget>[
                        Divider(height: 5.0),
//                        Row(
//
//                          children: <Widget>[
//
//                            Text('${items[position].title}',
//
//                            ),
//                            Text('${items[position].title}',
//
//                            ),
//
//                            Text('${items[position].title}',
//
//                            ),

                            ListTile(
                              title: Text(
                                '${items[position].title}',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                          subtitle: Text(
                            '${items[position].body}',
                            style: new TextStyle(
                              fontSize: 18.0,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          leading: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius: 35.0,
                                child: Text(
                                  'User ${items[position].userId}',
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  setState(() {
                                    items.removeAt(position);
                                  });
                                },
                              ),
                            ],
                          ),
                          onTap: () => _onTapItem(context, items[position]),
                            ),
                          ],
                        //),

                    );
                  }),

    );
  }

  void _onTapItem(BuildContext context, RequisitionIsueeInfo post) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(post.id.toString() + ' - ' + post.title)));
  }
}