import 'package:dynamic_list_view/DynamicListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmsapp/net/DataResult.dart';
import 'package:pmsapp/net/entity/parking_data_entity.dart';
import 'package:pmsapp/net/models/ParkingModel.dart';
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
    DataResult result = await ParkingModel.getParkingData(
        {"page": 1, "pageSize": 20, "status": 0});

    ParkingDataEntity parkingDataEntity = result.data;
    return parkingDataEntity.data;
  }

  Future<List> _dataRequester() async {
    DataResult result = await ParkingModel.getParkingData(
        {"page": 1, "pageSize": 20, "status": 0});

    ParkingDataEntity parkingDataEntity = result.data;
    return parkingDataEntity.data;
  }

  Function _itemBuilder = (List dataList, BuildContext context, int index) {
    ParkingDataData item = dataList[index];
    int tag = index % 3;
    return ParkPageItem(
      item: item,
      tabIndex: tag,
    );
  };
}
