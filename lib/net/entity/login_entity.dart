class LoginEntity {
	String passWord;
	String userName;

	LoginEntity({this.passWord, this.userName});

	LoginEntity.fromJson(Map<String, dynamic> json) {
		passWord = json['passWord'];
		userName = json['userName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['passWord'] = this.passWord;
		data['userName'] = this.userName;
		return data;
	}

}
