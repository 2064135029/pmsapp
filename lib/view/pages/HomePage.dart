import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: GridView(
        //设置网格样式,
        //SliverGridDelegateWithFixedCrossAxisCount 一般用这个
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //设置每行个数
          mainAxisSpacing: 10, //设置空白的横线大小
          crossAxisSpacing: 10, //设置空白的纵线大小
          childAspectRatio: 1, //设置元素宽度和高度比
        ),
        children: <Widget>[
          Image.network(
            "https://cpnet.oss-cn-hangzhou.aliyuncs.com/article/20180828/%E9%AB%98%E4%BD%B3%E8%B7%AF%E6%A1%A5/g2.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://cpnet.oss-cn-hangzhou.aliyuncs.com/article/20180828/%E9%AB%98%E4%BD%B3%E8%B7%AF%E6%A1%A5/g2.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://cpnet.oss-cn-hangzhou.aliyuncs.com/article/20180828/%E9%AB%98%E4%BD%B3%E8%B7%AF%E6%A1%A5/g2.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://cpnet.oss-cn-hangzhou.aliyuncs.com/article/20180828/%E9%AB%98%E4%BD%B3%E8%B7%AF%E6%A1%A5/g2.jpg",
            fit: BoxFit.cover,
          ),Image.network(
            "https://cpnet.oss-cn-hangzhou.aliyuncs.com/article/20180828/%E9%AB%98%E4%BD%B3%E8%B7%AF%E6%A1%A5/g2.jpg",
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
