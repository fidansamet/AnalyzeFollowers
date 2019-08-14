import 'package:analyze_followers/ui/twitter_profile_summary.dart';
import 'package:analyze_followers/utils.dart';
import 'package:flutter/material.dart';
import 'package:analyze_followers/ui/choice_page.dart';

void main() {
  runApp(AnalyzeFollowers());
}

class AnalyzeFollowers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Main();
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    final opaqueRegPage = Stack(
      children: [
        Opacity(opacity: 0.3, child: ChoicePage()),
        new Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor,
          )),
        ),
      ],
    );

    return MaterialApp(
      home: FutureBuilder(
          future: session(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data) {
                print("session*");
                return ProfileSummary();
              } else {
                return ChoicePage();
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).cardColor,
                )),
              );
            }
          }),
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.pink,
        cardColor: Colors.white,
        buttonColor: Colors.black,
        dividerColor: Colors.black54,
        cursorColor: Colors.black12,
        primaryTextTheme: TextTheme(
          title: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
          subtitle: TextStyle(
              color: Colors.black54,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal),
          subhead: TextStyle(
              color: Colors.black87,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  Future<bool> session() async {
    Utils utils = new Utils();
    String userInfos = await utils.readUserInfos();

    if (userInfos != "") {
      return true;
    } else {
      return false;
    }
  }
}
