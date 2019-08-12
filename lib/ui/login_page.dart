import 'package:analyze_followers/blocs/twitter_login/twitter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

class LoginPage extends StatefulWidget {
  final String choice;

  LoginPage(this.choice);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final loginBloc = TwitterLoginBloc();
  bool loginScreenOn = true;
  bool obscureText = false;
  var twitterLogin = new TwitterLogin(
    consumerKey: 'B6RvdkjnX3mrS6uQ4TkHud3vp',
    consumerSecret: '3o1Hs7s984gVHpk06Vd7CVWwqLs6jrJXo7iEbkkun172PZAKl4',
  );

  @override
  Widget build(BuildContext context) {
    String choice = widget.choice;

    final logo = Image.asset(
        choice == "Twitter" ? 'assets/twitter.png' : 'assets/instagram.png',
        width: 200.0,
        height: 200.0);

    final loginScreen = Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).cardColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).detach();
        },
        child: Center(
          child: Container(
            color: Theme.of(context).cardColor,
            child: logo
          ),
        ),
      ),
    );

    final opaqueScreen = Stack(
      children: [
        Opacity(opacity: 0.3, child: loginScreen),
        new Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
            choice == "Twitter"
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
          )),
        ),
      ],
    );

    final twitterBlocBuilder = BlocBuilder(
        bloc: loginBloc,
        builder: (BuildContext context, TwitterLoginState state) {

          if (state is TwitterLoginInitial) {
            loginBloc.dispatch(TwitterLoginEvent(twitterLogin));
            return loginScreen;

          } else if (state is TwitterLoginLoading) {
            return opaqueScreen;

          } else if (state is TwitterLoginFailure){
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('Could not connect to Twitter!'),
                  duration: Duration(seconds: 5),
                  action: SnackBarAction(
                    textColor: Theme.of(context).primaryColor,
                    label: 'Retry',
                    onPressed: () {
                      loginBloc.dispatch(TwitterReturnInitialState());
                    },
                  ),
                ));
            return loginScreen;

          } else {      // successful
            return loginScreen;
          }
        }
    );

    return twitterBlocBuilder;

  }
}
