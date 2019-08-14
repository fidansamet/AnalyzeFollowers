import 'package:analyze_followers/blocs/insta_login/insta_bloc.dart';
import 'package:analyze_followers/blocs/twitter_login/twitter_bloc.dart';
import 'package:analyze_followers/secrets.dart';
import 'package:analyze_followers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

class ProfileSummary extends StatefulWidget {
  @override
  _ProfileSummaryState createState() => new _ProfileSummaryState();
}

class _ProfileSummaryState extends State<ProfileSummary> {
  final GlobalKey<ScaffoldState> profileSummarySnack =
      new GlobalKey<ScaffoldState>();
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
    final photo =
        Image.asset('assets/twitter.png', width: 100.0, height: 100.0);

    final followInfo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Text("Following",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead
                      .copyWith(fontSize: 15.0)),
              Text("0")
            ],
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          height: 30.0,
          width: 1.0,
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.symmetric(),
        ),
        SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Text("Followers",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead
                      .copyWith(fontSize: 15.0)),
              Text("0")
            ],
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          height: 30.0,
          width: 1.0,
          color: Theme.of(context).primaryColor,
          margin: EdgeInsets.symmetric(),
        ),
        SizedBox(
          width: 5.0,
        ),
        GestureDetector(
          onTap: () {},
          child: Column(
            children: <Widget>[
              Text("Not Followers",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead
                      .copyWith(fontSize: 15.0)),
              Text("0")
            ],
          ),
        ),
      ],
    );

    final profileSummary = Scaffold(
        key: profileSummarySnack,
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).cardColor,
          title: Text(
            "username",
            style: Theme.of(context)
                .primaryTextTheme
                .subhead
                .copyWith(fontSize: 20.0),
          ),
        ),
        body: Center(
          child: RefreshIndicator(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 30.0,
                    ),
                    photo,
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("name",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subhead
                            .copyWith(fontSize: 20.0),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("username",
                        style: Theme.of(context)
                            .primaryTextTheme
                            .subhead
                            .copyWith(fontSize: 20.0),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 20.0,
                    ),
                    followInfo
                    // will be initialized if profile is another users
                  ]),
                ),
              ],
            ),
            color: Theme.of(context).primaryColor,
            backgroundColor: Theme.of(context).cardColor,
            onRefresh: () {},
          ),
        ));

    final opaqueScreen = Stack(
      children: [
        Opacity(opacity: 0.3, child: profileSummary),
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

    return profileSummary;
  }
}
