import 'package:analyze_followers/blocs/follow_info/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowInfo extends StatefulWidget {
  final String followInfoType;
  final String username;

  const FollowInfo({Key key, this.followInfoType, this.username})
      : super(key: key);

  @override
  _FollowInfoState createState() => _FollowInfoState();
}

class _FollowInfoState extends State<FollowInfo> {
  final followInfoBloc = FollowInfoBloc();
  GlobalKey<ScaffoldState> followInfoSnack = new GlobalKey<ScaffoldState>();

  void reload() {} // will be implemented

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
    );
  }

  Widget buildFollowInfos(List userList) {
    return RefreshIndicator(
      onRefresh: reload,
      color: Theme.of(context).cardColor,
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                color: Color(0xfff2f2f2),
              ),
          itemCount: userList.length,
          itemBuilder: (BuildContext listContext, int index) {
            return GestureDetector(
              onTap: () async {}, // will be implemented
              child: Container(
                  height: 90,
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        child: CircleAvatar(
                          foregroundColor: Theme.of(context).accentColor,
                          backgroundColor: Theme.of(context).dividerColor,
                          backgroundImage: null,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "",
                            style: Theme.of(context)
                                .accentTextTheme
                                .subhead
                                .copyWith(fontSize: 14),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                          ),
                        ],
                      ),
                    ],
                  )),
            );
          }),
    );
  }

  Widget buildFailedPage(String message) {
    if (message != null) {
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => followInfoSnack.currentState.showSnackBar(SnackBar(
                content: Text(message, textAlign: TextAlign.center),
                duration: Duration(seconds: 4),
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).accentColor,
            title: Text(
              widget.followInfoType,
              style: Theme.of(context)
                  .accentTextTheme
                  .subhead
                  .copyWith(fontSize: 14),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: BlocBuilder(
            bloc: followInfoBloc,
            builder: (BuildContext context, FollowInfoState state) {
              if (state is FollowInfoInitial) {
                return loading();
              } else if (state is FollowInfoLoading) {
                return loading();
              } else if (state is FollowInfoSuccessful) {
                return buildFollowInfos(state.usersList);
              } else if (state is FollowInfoFailure) {
                return buildFailedPage(state.message);
              }
            }));
  }
}
