class AppEntity {
  String code;
  String name;
  String ic;

  AppEntity({this.code, this.name, this.ic});

  AppEntity.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    ic = json['ic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['ic'] = this.ic;
    return data;
  }
}
