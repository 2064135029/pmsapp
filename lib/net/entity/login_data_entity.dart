class LoginDataEntity {
	String msg;
	LoginDataData data;
	int status;

	LoginDataEntity({this.msg, this.data, this.status});

	LoginDataEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		data = json['data'] != null ? new LoginDataData.fromJson(json['data']) : null;
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		if (this.data != null) {
      data['data'] = this.data.toJson();
    }
		data['status'] = this.status;
		return data;
	}
}

class LoginDataData {
	String token;

	LoginDataData({this.token});

	LoginDataData.fromJson(Map<String, dynamic> json) {
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['token'] = this.token;
		return data;
	}
}
