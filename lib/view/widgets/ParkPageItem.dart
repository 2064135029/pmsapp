import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmsapp/net/entity/parking_data_entity.dart';
import 'package:pmsapp/net/models/ParkingModel.dart';
import 'package:rxdart/rxdart.dart';

class ParkPageItem extends StatelessWidget {
  ParkingDataData item;
  int tabIndex = 0;

  ParkPageItem({Key key, this.item, this.tabIndex}) : super(key: key);

  _acceptClick(int id) async {
    print('接单');
    await ParkingModel.appAcceptParking(id);
  }

  _rejectClick() {}

  _finshClick() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build  return Container(padding: EdgeInsets.all(15.0), child: new Text(t));

    if (item.status == 0) {
      return Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('车牌号：' + item.carNum),
                    Text('申请人：' + item.applyName),
                    Text('手机号码：' + item.applyTel),
                    Text('申请时间: ' + item.insertTime)
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () => _acceptClick(item.idparking),
                child: Text('接单', style: TextStyle(fontSize: 17)),
              )
            ],
          ));
    } else if (item.status == 1) {
      return Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('车牌号：桂RG9961'),
                    Text('申请人：吴建何'),
                    Text('手机号码：18898832359'),
                    Text('申请时间: 2019-12-10 09:10:11')
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.red[500],
                textColor: Colors.white,
                onPressed: () => _rejectClick(),
                child: Text('放弃', style: TextStyle(fontSize: 17)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              RaisedButton(
                padding: EdgeInsets.all(2.0),
                color: Colors.grey[500],
                textColor: Colors.white,
                onPressed: () => _finshClick(),
                child: Text('完成', style: TextStyle(fontSize: 17)),
              ),
            ],
          ));
    } else {
      return Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('车牌号：桂RG9961'),
                    Text('申请人：吴建何'),
                    Text('手机号码：18898832359'),
                    Text('申请时间: 2019-12-10 09:10:11'),
                    Text('完成时间: 2019-12-10 09:10:11')
                  ],
                ),
              )
            ],
          ));
    }
  }
}
