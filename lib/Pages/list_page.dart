import 'package:flutter/material.dart';

class User {
  User({this.name, this.userName});
  final String name;
  final String userName;
}

class ListPage extends StatelessWidget {

  final logo = Image.asset('assets/avatar.png', width: 200.0, height: 200.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xffb74093),
        child: new Stack(
          children: <Widget>[
            new Container(
              color: Colors.white,
              constraints: new BoxConstraints.expand(height: 300.0),
              child: new Center(
                child: new Container(
                  child: Image.asset('assets/avatar.png', width: 100.0, height: 100.0),
                ),
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 190.0),
              height: 110.0,
              decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: <Color>[
                  new Color(0x00736AB7),
                  new Color(0xffb74093)
                ],
                  stops: [0.0, 0.9],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                )
              ),
            ),
            new Container(
              padding: new EdgeInsets.fromLTRB(0.0, 300.0, 0.0, 0.0),
              child: _buildContent(),
            )
          ],
        ),
      ),
     
    );
  }

  Widget _buildContent() {
    return ListView.builder(
        itemCount: allUsers.length,
        itemBuilder: (BuildContext content, int index) {
          User user = allUsers[index];
          return UserListTitle(user);
        });
  }
}

class UserListTitle extends ListTile {
  UserListTitle (User user)
      : super(
    title: Text(user.name),
    subtitle: Text(user.userName),
    leading: CircleAvatar(child: Image.asset('assets/avatar.png'), backgroundColor: Colors.transparent,),
  );
}

List<User> allUsers = [
  User(name: 'Isa Tusa', userName: 'isa.tusa'),
  User(name: 'Racquel Ricciardi', userName: 'racquelricciardi'),
  User(name: 'Teresita Mccubbin', userName: 'teresitamccubbin'),
  User(name: 'Rhoda Hassinger', userName: 'rhodahassinger'),
  User(name: 'Carson Cupps', userName: 'carsoncupps'),
  User(name: 'Devora Nantz', userName: 'devoranantz')
];