import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmsapp/blocs/bloc_provider.dart';
import 'package:pmsapp/blocs/main_bloc.dart';
import 'package:pmsapp/common/config/Config.dart';
import 'package:pmsapp/models/ComModel.dart';
import 'package:pmsapp/net/entity/user_info_entity.dart';
import 'package:pmsapp/net/models/UserModel.dart';
import 'package:pmsapp/utils/RouteUtil.dart';
import 'package:pmsapp/view/widgets/ComArrowIntem.dart';

class MyCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    bloc.getUserInfo();

    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
      body: StreamBuilder(
        stream: bloc.userInfoStream,
        builder: (BuildContext context,
            AsyncSnapshot<UserInfoEntity> snapshot){
          UserInfoEntity u = snapshot.data;
          if (u == null){
            return Center(child: Text('暂未获取'));
          }
          ComModel estate = new ComModel(title: '小区', extra: u.disName ); // 小区

          ComModel dep = new ComModel(title: '部门', extra: 'XXX'); // 部门

          ComModel version = new ComModel(title: '版本号', extra: AppConfig.version); // 版本号

          ComModel psw = new ComModel(title: '修改密码', extra: ''); // 小区

          return ListView(
            children: <Widget>[
              new Container(
                  height: 160.0,
                  alignment: Alignment.center,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Card(
                        color: Theme.of(context).primaryColor,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6.0))),
                        child: new Image.asset(
                          'http://',
                          width: 72.0,
                          fit: BoxFit.fill,
                          height: 72.0,
                        ),
                      ),
                      new Text(
                        u.realName,
                        style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                      )
                    ],
                  ),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      border: new Border.all(width: 0.33, color: Colors.black12))),
              new ComArrowItem(estate),
              new ComArrowItem(dep),
              new ComArrowItem(psw),
              new ComArrowItem(version),
              Padding(
                padding: EdgeInsets.all(20.0),
                child:  MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
//                    textColor: Colors.white,
                  color: Colors.red,
                  textTheme: ButtonTextTheme.primary,
                  onPressed: (){
                    RouteUtil.goLogin(context);
                  },
                  child: Text('退出登录', style: TextStyle(fontSize: 17)),
                ),
              ),

            ],
          );
        },
      )

    );
  }
}
