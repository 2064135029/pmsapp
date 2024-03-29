import 'package:flutter/material.dart';
import 'package:pmsapp/blocs/index.dart';
import 'package:pmsapp/common/SpUtils.dart';
import 'package:pmsapp/net/entity/app_entity.dart';
import 'package:pmsapp/utils/RouteUtil.dart';
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
    final MainBloc bloc = BlocProvider.of<MainBloc>(context);
    bloc.getAppData();
    SpUtils.get("token").then((value) {
      if (value == null) {
        RouteUtil.goLogin(context);
      }
    });
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: new Container(
          margin: const EdgeInsets.all(10.0),
          child: new StreamBuilder(
              stream: bloc.appStream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<AppEntity>> snapshot) {
                List<AppEntity> lists = snapshot.data;
                if (lists == null) {
                  return new Center(
                    child: new Text('暂无应用'),
                  );
                }
                List<Widget> children = lists.map((model) {
                  return new GridItem(
                    appEntity: model,
                  );
                }).toList();
                return new GridView(
                    //设置网格样式,
                    //SliverGridDelegateWithFixedCrossAxisCount 一般用这个
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //设置每行个数
                      mainAxisSpacing: 10, //设置空白的横线大小
                      crossAxisSpacing: 10, //设置空白的纵线大小
                      childAspectRatio: 1, //设置元素宽度和高度比
                    ),
                    children: children);
              })),
    );
  }
}
