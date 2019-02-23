import 'package:flutter/material.dart';
import 'package:analyze_followers/UI/choice_button.dart';
import 'login_page.dart';

class ChoicePage extends StatefulWidget {

  @override
  State createState () => new ChoicePageState();
}

class ChoicePageState extends State<ChoicePage> {

  @override
  Widget build(BuildContext context) {

    return new Stack (
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new ChoiceButton("Twitter", () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LoginPage("Twitter")))),
            new ChoiceButton("Instagram", () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LoginPage("Instagram")))),
          ],
        )
      ],
    );
  }
}
