import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmsapp/common/SpUtils.dart';
import 'package:pmsapp/main.dart';
import 'package:pmsapp/net/entity/login_data_entity.dart';
import 'package:pmsapp/net/entity/login_entity.dart';
import 'package:pmsapp/net/models/LoginModel.dart';
import 'package:pmsapp/utils/RouteUtil.dart';
import 'package:pmsapp/view/dialog/Toast.dart';
import 'package:pmsapp/view/dialog/net_loading_dialog.dart';
import 'package:pmsapp/view/pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  // TODO: implement widget
  LoginPage get widget => super.widget;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: new Text('登录'),
//          leading: Text(''),
          iconTheme: new IconThemeData(color: Colors.red),
          //文字title居中
          centerTitle: true,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.build,
                  color: Colors.white,
                ),
                onPressed: () {
                  RouteUtil.goSetIP(context);
                })
          ],
        ),
        body: Center(
          child: Container(
            color: Colors.white,
            child: LoginBody(),
          ),
        ));
  }
}

class LoginBody extends StatelessWidget {
//  var usernameController = new TextEditingController();

//  LoginBody(this.)
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = new TextEditingController();
    TextEditingController _controllerPwd = new TextEditingController();

    _loadingCallBack(fun) {
      String username = _controllerName.text;
      String password = _controllerPwd.text;
      LoginModel.loginReq(password, username).then((value) {
        fun();
        print(value.data);
        if (value.isSuc && value.data.status == 0) {
          print(value.data.data);
          LoginDataEntity loginEntity = value.data;
          SpUtils.save(APPKEYS.Token, loginEntity.data.token);
          RouteUtil.goMain(context);
        } else {
          print(value.data);
          Toast.toast(context, msg: value.data.msg);
        }
      });
    }

    void _userLogin() {
      String username = _controllerName.text;
      String password = _controllerPwd.text;
      if (username.isEmpty) {
//        Util.showSnackBar(context, username.isEmpty ? "请输入用户名～" : "用户名至少6位～");
        Toast.toast(context, msg: "请输入用户名～");
        return;
      }
      if (password.isEmpty) {
//        Util.showSnackBar(context, username.isEmpty ? "请输入密码～" : "密码至少6位～");
        Toast.toast(context, msg: "请输入密码～");
        return;
      }
      showDialog(
          context: context,
          builder: (context) {
            return new NetLoadingDialog(
              dismissDialog: _loadingCallBack,
            );
          });
    }

    return new Column(
      children: <Widget>[
        new Expanded(
            child: new Container(
          margin: EdgeInsets.only(left: 10, top: 15, right: 10),
          child: new Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                //用户名输入框
                child: TextField(
                  //控制器
                  controller: _controllerName,
                  maxLength: 11,
                  maxLines: 1,
                  //是否自动更正
                  autocorrect: true,
                  //是否自动对焦
//                      autofocus: true,
                  decoration: new InputDecoration(
                    //                hintText: "请输入用户名",
                    labelText: "请输入账号(手机号码)",
                    helperText: "账号",
                    icon: new Icon(Icons.account_box),
                  ),
                  onChanged: (text) {
                    //内容改变的回调
                    print('change $text');
                  },
                  onSubmitted: (text) {
                    //内容提交(按回车)的回调
                    print('submit $text');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                //用户名输入框
                child: TextField(
                  //控制器
                  controller: _controllerPwd,
                  //是否自动更正
                  autocorrect: true,
                  obscureText: true,
                  //是否自动对焦
//                      autofocus: true,
                  decoration: new InputDecoration(
                    //                hintText: "请输入用户名",
                    labelText: "请输入密码",
                    helperText: "密码",
                    icon: new Icon(Icons.lock),
                  ),
                  onChanged: (text) {
                    //内容改变的回调
                    print('change $text');
                  },
                  onSubmitted: (text) {
                    //内容提交(按回车)的回调
                    print('submit $text');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
//                    textColor: Colors.white,
                color: Colors.blue,
                textTheme: ButtonTextTheme.primary,
                onPressed: _userLogin,
                child: Text('登录', style: TextStyle(fontSize: 17)),
              )
            ],
          ),
        )),
      ],
    );
  }
}
