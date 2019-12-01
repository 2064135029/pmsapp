import 'package:dynamic_list_view/DynamicListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmsapp/view/widgets/ParkPageItem.dart';

class ParkPage extends StatelessWidget {
  String title;

  ParkPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('pppppp');
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
          bottom: TabBar(
//            indicatorColor: Colors.grey[500],
            tabs: <Widget>[
              Tab(
                text: "待接单",
              ),
              Tab(
                text: "已接单",
              ),
              Tab(
                text: '完成',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Center(child: TabView(tag: 1)),
          Center(child: TabView(tag: 2)),
          Center(child: TabView(tag: 3)),
        ]),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  int tag;

  TabView({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: DynamicListView.build(
          itemBuilder: _itemBuilder,
          dataRequester: _dataRequester,
          initRequester: _initRequester),
    );
  }

  Future<List> _initRequester() async {
    return Future.value(List.generate(15, (i) => i));
  }

  Future<List> _dataRequester() async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(10, (i) => 15 + i);
    });
  }
  Function _itemBuilder = (List dataList, BuildContext context, int index) {
    String title = dataList[index].toString();
//    context.widget.key;
//    print(context.widget.);
    int tag = index % 3;
    return ParkPageItem(
      t: title,
      tabIndex: tag,
    );
  };
}
