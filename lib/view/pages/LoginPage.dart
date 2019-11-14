import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: new Text('Login'),
          iconTheme: new IconThemeData(color: Colors.red),
          //文字title居中
          centerTitle: true,
        ),
        body: Center(
          child:LoginBody(),
        )
    );
  }
}

class LoginBody extends StatelessWidget {

  var usernameController =  new TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerName = new TextEditingController();
    TextEditingController _controllerPwd = new TextEditingController();

//    _controllerName.text = userModel?.username ?? "";

    void _userLogin() {
      String username = _controllerName.text;
      String password = _controllerPwd.text;
      if (username.isEmpty || username.length < 6) {
//        Util.showSnackBar(context, username.isEmpty ? "请输入用户名～" : "用户名至少6位～");
        return;
      }
      if (password.isEmpty || password.length < 6) {
//        Util.showSnackBar(context, username.isEmpty ? "请输入密码～" : "密码至少6位～");
        return;
      }
    }

    return new Column(
      children: <Widget>[
        new Expanded(
            child: new Container(
              margin: EdgeInsets.only(left: 20, top: 15, right: 20),
              child: new Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    //用户名输入框
                    child: TextField(
                      //控制器
                      controller: usernameController,
                      maxLength: 11,
                      maxLines: 1,
                      //是否自动更正
                      autocorrect: true,
                      //是否自动对焦
//                      autofocus: true,
                      decoration: new InputDecoration(
                        //                hintText: "请输入用户名",
                        labelText: "请输入用户名",
                        helperText: "用户名",
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
                      maxLength: 11,
                      maxLines: 1,
                      //是否自动更正
                      autocorrect: true,
                      //是否自动对焦
//                      autofocus: true,
                      decoration: new InputDecoration(
                        //                hintText: "请输入用户名",
                        labelText: "请输入密码",
                        helperText: "密码",
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
                ],
              ),
            )),
      ],
    );
  }
}

