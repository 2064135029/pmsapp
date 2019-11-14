class LoginEntity {
	int status;
	String msg;

	LoginEntity({this.msg, this.status});

	LoginEntity.fromJson(Map<String, dynamic> json) {
		status = json['status'];
		msg = json['msg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		data['status'] = this.status;
		return data;
	}

}
