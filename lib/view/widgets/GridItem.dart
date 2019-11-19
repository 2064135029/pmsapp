import 'package:flutter/cupertino.dart';

class GridItem extends StatelessWidget {

  String name;

  GridItem({Key key, this.name}) : super(key: key);

  _tapItem(){
    print("dddd");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(onTap: _tapItem,
      child: new Column(children: <Widget>[Image.network(
        "https://cpnet.oss-cn-hangzhou.aliyuncs.com/article/20180828/%E9%AB%98%E4%BD%B3%E8%B7%AF%E6%A1%A5/g2.jpg",
        fit: BoxFit.cover,
      ),Text(name)],));
  }
}
/*
Image.network(
        "https://cpnet.oss-cn-hangzhou.aliyuncs.com/article/20180828/%E9%AB%98%E4%BD%B3%E8%B7%AF%E6%A1%A5/g2.jpg",
        fit: BoxFit.cover,
      ),
 */