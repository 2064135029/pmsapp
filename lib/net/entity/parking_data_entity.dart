class ParkingDataEntity {
  List<ParkingDataData> data;

  ParkingDataEntity({this.data});

  ParkingDataEntity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<ParkingDataData>();
      (json['data'] as List).forEach((v) {
        data.add(new ParkingDataData.fromJson(v));
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

class ParkingDataData {
  int vehicletype;
  int idparking;
  String cuserId;
  String applyName;
  String applyTel;
  String finshRemark;
  String finshTime;
  String acceptTime;
  String carNum;
  String employeeId;
  String attachImg;
  String serviceName;
  String insertTime;
  String applyId;
  String applyRemark;
  String serviceTelPhone;
  String updateTime;
  String muserId;
  String iddistrict;
  String houseNum;
  int status;

  ParkingDataData(
      {this.vehicletype,
      this.applyTel,
      this.applyName,
      this.idparking,
      this.cuserId,
      this.finshRemark,
      this.finshTime,
      this.acceptTime,
      this.carNum,
      this.employeeId,
      this.attachImg,
      this.serviceName,
      this.insertTime,
      this.applyId,
      this.applyRemark,
      this.serviceTelPhone,
      this.updateTime,
      this.muserId,
      this.iddistrict,
      this.houseNum,
      this.status});

  ParkingDataData.fromJson(Map<String, dynamic> json) {
    vehicletype = json['vehicletype'];
    applyTel = json['applyTel'];
    applyName = json['applyName'];
    idparking = json['idparking'];
    cuserId = json['cuser_id'];
    finshRemark = json['finshRemark'];
    finshTime = json['finshTime'];
    acceptTime = json['acceptTime'];
    carNum = json['carNum'];
    employeeId = json['employeeId'];
    attachImg = json['attachImg'];
    serviceName = json['serviceName'];
    insertTime = json['InsertTime'];
    applyId = json['applyId'];
    applyRemark = json['applyRemark'];
    serviceTelPhone = json['serviceTelPhone'];
    updateTime = json['UpdateTime'];
    muserId = json['muser_id'];
    iddistrict = json['iddistrict'];
    houseNum = json['houseNum'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicletype'] = this.vehicletype;
    data['idparking'] = this.idparking;
    data['cuser_id'] = this.cuserId;
    data['finshRemark'] = this.finshRemark;
    data['finshTime'] = this.finshTime;
    data['acceptTime'] = this.acceptTime;
    data['carNum'] = this.carNum;
    data['employeeId'] = this.employeeId;
    data['attachImg'] = this.attachImg;
    data['serviceName'] = this.serviceName;
    data['InsertTime'] = this.insertTime;
    data['applyId'] = this.applyId;
    data['applyRemark'] = this.applyRemark;
    data['serviceTelPhone'] = this.serviceTelPhone;
    data['UpdateTime'] = this.updateTime;
    data['muser_id'] = this.muserId;
    data['iddistrict'] = this.iddistrict;
    data['houseNum'] = this.houseNum;
    data['status'] = this.status;
    return data;
  }
}
