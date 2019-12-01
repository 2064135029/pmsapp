import 'package:flutter/cupertino.dart';
import 'package:pmsapp/net/HttpRequest.dart';
import 'package:pmsapp/view/pages/AgencyPage.dart';
import 'package:pmsapp/view/pages/CleanPage.dart';
import 'package:pmsapp/view/pages/DeliveryPage.dart';
import 'package:pmsapp/view/pages/HousePage.dart';
import 'package:pmsapp/view/pages/OwnerPage.dart';
import 'package:pmsapp/view/pages/ParkPage.dart';
import 'package:pmsapp/view/pages/RentPage.dart';
import 'package:pmsapp/view/pages/SafetyPage.dart';
import 'package:pmsapp/view/pages/VehiclePage.dart';

class AppDataEntity {
  List<AppDataData> data;

  AppDataEntity({this.data});

  AppDataEntity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<AppDataData>();
      (json['data'] as List).forEach((v) {
        data.add(new AppDataData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppDataData {
  String code;
  String name;
  String ic;
  Widget page;

  AppDataData({this.code, this.name, this.ic});

  AppDataData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    if (code == 'app0001') {
      page = ParkPage(title: name,);
    } else if (code == 'app0002') {
      page = HousePage(title: name,);
    } else if (code == 'app0003') {
      page = OwnerPage(title: name,);
    } else if (code == 'app0004') {
      page = VehiclePage(title: name,);
    } else if (code == 'app0005') {
      page = RentPage(title: name,);
    } else if (code == 'app0006') {
      page = CleanPage(title: name,);
    } else if (code == 'app0007') {
      page = AgencyPage(title: name,);
    } else if (code == 'app0008') {
      page = DeliveryPage(title: name,);
    } else if (code == 'app0009') {
      page = SafetyPage(title: name,);
    }
    ic = HttpRequest.getBaseUrl() + json['ic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['ic'] = this.ic;
    return data;
  }
}
