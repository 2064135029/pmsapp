import 'package:flutter/cupertino.dart';
import 'package:pmsapp/net/entity/app_data_entity.dart';
import 'package:pmsapp/net/entity/app_entity.dart';

class GridItem extends StatelessWidget {

  String name;



  AppDataData appEntity;
  GridItem({Key key, this.appEntity}) : super(key: key);

  _tapItem(){
    print("dddd");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(onTap: _tapItem,
      child: new Column(children: <Widget>[Image.network(appEntity.ic,
        fit: BoxFit.cover,
        width: 80,
        height: 80,
      ),Text(appEntity.name)],));
  }
}
/*
Image.network(
        "https://cpnet.oss-cn-hangzhou.aliyuncs.com/article/20180828/%E9%AB%98%E4%BD%B3%E8%B7%AF%E6%A1%A5/g2.jpg",
        fit: BoxFit.cover,
      ),
 */