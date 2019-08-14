import 'package:analyze_followers/blocs/insta_login/insta_bloc.dart';
import 'package:analyze_followers/blocs/twitter_login/twitter_bloc.dart';
import 'package:analyze_followers/secrets.dart';
import 'package:analyze_followers/ui/twitter_profile_summary.dart';
import 'package:analyze_followers/utils.dart';
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
  final instaLoginBloc = InstaLoginBloc();
  final twitterLoginBloc = TwitterLoginBloc();
  bool loginScreenOn = true;
  bool obscureText = false;
  var twitterLogin = new TwitterLogin(
    consumerKey: Secrets().twitterConsumerKey,
    consumerSecret: Secrets().twitterConsumerSecret,
  );

  @override
  Widget build(BuildContext context) {
    Utils().choice = widget.choice;

    final logo = Image.asset(
        Utils().choice == "Twitter"
            ? 'assets/twitter.png'
            : 'assets/instagram.png',
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
          child: Container(color: Theme.of(context).cardColor, child: logo),
        ),
      ),
    );

    final opaqueScreen = Stack(
      children: [
        Opacity(opacity: 0.3, child: loginScreen),
        new Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
            Utils().choice == "Twitter"
                ? Theme.of(context).primaryColor
                : Theme.of(context).accentColor,
          )),
        ),
      ],
    );

    final instaBlocBuilder = BlocBuilder(
        bloc: instaLoginBloc,
        builder: (BuildContext context, InstaLoginState state) {
          if (state is InstaLoginInitial) {
            instaLoginBloc.dispatch(InstaLoginEvent());
            return loginScreen;
          } else if (state is InstaLoginLoading) {
            return opaqueScreen;
          } else if (state is InstaLoginFailure) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Could not connect to Instagram!'),
              duration: Duration(seconds: 5),
              action: SnackBarAction(
                textColor: Theme.of(context).accentColor,
                label: 'Retry',
                onPressed: () {
                  instaLoginBloc.dispatch(InstaReturnInitialState());
                },
              ),
            ));
            return loginScreen;
          } else {
            // successful
            return loginScreen;
          }
        });

    final twitterBlocBuilder = BlocListener(
      bloc: twitterLoginBloc,
      child: BlocBuilder(
          bloc: twitterLoginBloc,
          builder: (BuildContext context, TwitterLoginState state) {
            if (state is TwitterLoginInitial) {
              twitterLoginBloc.dispatch(TwitterLoginEvent(twitterLogin));
              return loginScreen;
            } else if (state is TwitterLoginLoading) {
              return opaqueScreen;
            } else if (state is TwitterLoginFailure) {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Could not connect to Twitter!'),
                duration: Duration(seconds: 5),
                action: SnackBarAction(
                  textColor: Theme.of(context).primaryColor,
                  label: 'Retry',
                  onPressed: () {
                    twitterLoginBloc.dispatch(TwitterReturnInitialState());
                  },
                ),
              ));
              return loginScreen;
            } else {
              // successful
              return opaqueScreen;
            }
          }),
      listener: (BuildContext context, TwitterLoginState state) {
        if (state is TwitterLoginSuccessful) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ProfileSummary()),
              ModalRoute.withName('/Profile'));
        }
      },
    );

    return Utils().choice == "Twitter" ? twitterBlocBuilder : instaBlocBuilder;
  }
}
