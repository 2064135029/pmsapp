
import 'package:flutter/material.dart';
import 'package:pmsapp/view/widgets/GridItem.dart';

class HomePage extends StatelessWidget {
  final String text;

  HomePage({Key key, this.text}) : super(key: key);

  _tap() {
//    LogUtil.v({'d':'dd'});
  print('ddddddd');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: new Container(
        margin: const EdgeInsets.all(8.0),
        child: new GridView(
          //设置网格样式,
          //SliverGridDelegateWithFixedCrossAxisCount 一般用这个
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //设置每行个数
            mainAxisSpacing: 10, //设置空白的横线大小
            crossAxisSpacing: 10, //设置空白的纵线大小
            childAspectRatio: 1, //设置元素宽度和高度比
          ),
          children: <Widget>[
            GridItem(name: 'dd',),
          ],
        ),
      )
    );
  }
}
