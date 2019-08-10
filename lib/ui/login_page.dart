import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  final String choice;
  LoginPage(this.choice);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool warning =  false;
  bool obscureText = false;
  final usernameController = TextEditingController();
  final passController = TextEditingController();
  FocusNode usernameFocusNode;
  FocusNode passFocusNode;


  @override
  void initState() {
    super.initState();
    usernameFocusNode = FocusNode();
    passFocusNode = FocusNode();
  }

  @override
  void dispose() {
    usernameFocusNode.dispose();
    passFocusNode.dispose();
    usernameController.dispose();
    passController.dispose();
    super.dispose();
  }

  void _togglePassShow() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {

    String choice = widget.choice;

    final logo = Image.asset(
        choice == "Twitter" ? 'assets/twitter.png'
            : 'assets/instagram.png',
        width: 150.0,
        height: 150.0);

    final username = TextField(
      controller: usernameController,
      focusNode: usernameFocusNode,
      autofocus: false,
      cursorColor: Theme.of(context).cursorColor,
      style: Theme.of(context).primaryTextTheme.subhead.copyWith(fontSize: 18.0),
      decoration: InputDecoration(
        hintText: 'Username',
        hintStyle: Theme.of(context).primaryTextTheme.subtitle.copyWith(fontSize: 18.0),
        contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: warning ? choice == "Twitter"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor
                  : Theme.of(context).dividerColor,
              width: 1.0),
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: warning ? choice == "Twitter"
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).accentColor
                  : Theme.of(context).dividerColor,
              width: 1.0),
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    final password = TextField(
      controller: passController,
      focusNode: passFocusNode,
      autofocus: false,
      obscureText: obscureText,
      cursorColor: Theme.of(context).cursorColor,
      style: Theme.of(context).primaryTextTheme.subhead.copyWith(fontSize: 18.0),
      decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: Theme.of(context).primaryTextTheme.subtitle.copyWith(fontSize: 18.0),
          contentPadding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: warning ? choice == "Twitter"
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor
                    : Theme.of(context).dividerColor,
                width: 1.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: warning ? choice == "Twitter"
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).accentColor
                    : Theme.of(context).dividerColor,
                  width: 1.0),
            borderRadius: BorderRadius.circular(32.0),
          ),
        suffixIcon: IconButton(
          padding: new EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 0.0),
          onPressed: _togglePassShow,
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Theme.of(context).dividerColor,
            size: 24.0,
          ),
        ),
      ),
    );

    final loginButton = Container(
        height: 100.0,
        width: 100.0,
        child: FloatingActionButton(
          backgroundColor: choice == "Twitter"
              ? Theme.of(context).primaryColor
              : Theme.of(context).accentColor,
          child: Text(
              'Login',
              style: Theme.of(context).primaryTextTheme.title.copyWith(fontSize: 20.0)
          ),
          elevation: 0.0,
          onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LoginPage(choice))),
          heroTag: null,
        )
    );

    final forgotLabel = FlatButton(
      child: Text('Forgot Password?',
        style: TextStyle(color: Theme.of(context).dividerColor).copyWith(fontSize: 15.0),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).detach();
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
          color: Theme.of(context).cardColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              logo,
              SizedBox(height: 50.0),
              username,
              SizedBox(height: 10.0),
              password,
              SizedBox(height: 30.0),
              loginButton,
              forgotLabel,
            ],
          ),
        ),
      ),
    );
  }
}
