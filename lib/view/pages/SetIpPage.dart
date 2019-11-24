import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmsapp/common/SpUtils.dart';

class SetIpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerIP = new TextEditingController();
    // 设置ip地址
    setIpClick() {
      SpUtils.save(APPKEYS.ip, _controllerIP.text);
      Navigator.pop(context);
    }

    SpUtils.get(APPKEYS.ip).then((value) {
      if (value != null) {
        _controllerIP.text = value;
      }
    });
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Text("服务器地址"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: new Container(
          margin: EdgeInsets.only(left: 10, top: 20, right: 10),
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: _controllerIP,
                decoration: new InputDecoration(
                  //                hintText: "请输入用户名",
                  labelText: "请输入服务器地址",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
              ),
              MaterialButton(
                height: 50,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
//                    textColor: Colors.white,
                color: Colors.blue,
                textTheme: ButtonTextTheme.primary,
                onPressed: setIpClick,
                child: Text('设置', style: TextStyle(fontSize: 17)),
              )
            ],
          )),
    );
  }
}
