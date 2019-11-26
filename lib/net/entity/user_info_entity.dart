class UserInfoEntity {
	String iduser;
	String address;
	int role;
	String cardId;
	int sex;
	String telPhone;
	String headimgurl;
	String userName;
	String job;
	String disName;
	String realName;
	String email;

	UserInfoEntity({this.iduser, this.address, this.role, this.cardId, this.sex, this.telPhone, this.headimgurl, this.userName, this.job, this.disName, this.email});

	UserInfoEntity.fromJson(Map<String, dynamic> json) {
		iduser = json['iduser'];
		address = json['address'];
		role = json['role'];
		cardId = json['cardId'];
		sex = json['sex'];
		telPhone = json['TelPhone'];
		headimgurl = json['headimgurl'];
		userName = json['userName'];
		job = json['job'];
		disName = json['disName'];
		email = json['email'];
		realName= json['realName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['iduser'] = this.iduser;
		data['address'] = this.address;
		data['role'] = this.role;
		data['cardId'] = this.cardId;
		data['sex'] = this.sex;
		data['TelPhone'] = this.telPhone;
		data['headimgurl'] = this.headimgurl;
		data['userName'] = this.userName;
		data['job'] = this.job;
		data['disName'] = this.disName;
		data['email'] = this.email;
		data['realName'] = this.realName;
		return data;
	}
}
