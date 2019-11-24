import 'package:pmsapp/net/HttpRequest.dart';

class AppDataEntity {
	List<AppDataData> data;

	AppDataEntity({this.data});

	AppDataEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<AppDataData>();(json['data'] as List).forEach((v) { data.add(new AppDataData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class AppDataData {
	String code;
	String name;
	String ic;

	AppDataData({this.code, this.name, this.ic});

	AppDataData.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		name = json['name'];
		ic = HttpRequest.getBaseUrl() +  json['ic'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['name'] = this.name;
		data['ic'] = this.ic;
		return data;
	}
}
