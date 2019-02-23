import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {

  final String _choice;
  final VoidCallback _onTap;
  ChoiceButton(this._choice, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: _choice == "Twitter" ? Colors.blue : Colors.pink,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
            child: Container(
              padding: new EdgeInsets.all(20.0),
              child: new Text(_choice == "Twitter" ? "Twitter" : "Instagram",
              style: new TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),),
            ),
          ),
        ),
      ),
    );
  }
}