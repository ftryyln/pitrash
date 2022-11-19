import 'dart:convert';
/// meta : {"code":200,"status":"success","message":""}
/// data : {"id":1,"name":"admin","email":"admin@admin.com","email_verified_at":null,"role":1,"phone":"123213123","created_at":null,"updated_at":"2022-11-19T17:35:50.000000Z","user_detail":{"id":1,"created_at":"2022-11-18T06:31:43.000000Z","updated_at":"2022-11-19T17:35:50.000000Z","user_id":1,"address":"Jl.Yang lurus no.69 Bekasi, Planet namek","image":"http://pitrash.masuk.web.id/assets/images/user/202211191306481.png"}}

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));
String profileModelToJson(ProfileModel data) => json.encode(data.toJson());
class ProfileModel {
  ProfileModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  ProfileModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
ProfileModel copyWith({  Meta? meta,
  Data? data,
}) => ProfileModel(  meta: meta ?? _meta,
  data: data ?? _data,
);
  Meta? get meta => _meta;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "admin"
/// email : "admin@admin.com"
/// email_verified_at : null
/// role : 1
/// phone : "123213123"
/// created_at : null
/// updated_at : "2022-11-19T17:35:50.000000Z"
/// user_detail : {"id":1,"created_at":"2022-11-18T06:31:43.000000Z","updated_at":"2022-11-19T17:35:50.000000Z","user_id":1,"address":"Jl.Yang lurus no.69 Bekasi, Planet namek","image":"http://pitrash.masuk.web.id/assets/images/user/202211191306481.png"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      int? role, 
      String? phone, 
      dynamic createdAt, 
      String? updatedAt, 
      UserDetail? userDetail,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _role = role;
    _phone = phone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userDetail = userDetail;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _role = json['role'];
    _phone = json['phone'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userDetail = json['user_detail'] != null ? UserDetail.fromJson(json['user_detail']) : null;
  }
  int? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  int? _role;
  String? _phone;
  dynamic _createdAt;
  String? _updatedAt;
  UserDetail? _userDetail;
Data copyWith({  int? id,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  int? role,
  String? phone,
  dynamic createdAt,
  String? updatedAt,
  UserDetail? userDetail,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  role: role ?? _role,
  phone: phone ?? _phone,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userDetail: userDetail ?? _userDetail,
);
  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  int? get role => _role;
  String? get phone => _phone;
  dynamic get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  UserDetail? get userDetail => _userDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['role'] = _role;
    map['phone'] = _phone;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_userDetail != null) {
      map['user_detail'] = _userDetail?.toJson();
    }
    return map;
  }

}

/// id : 1
/// created_at : "2022-11-18T06:31:43.000000Z"
/// updated_at : "2022-11-19T17:35:50.000000Z"
/// user_id : 1
/// address : "Jl.Yang lurus no.69 Bekasi, Planet namek"
/// image : "http://pitrash.masuk.web.id/assets/images/user/202211191306481.png"

UserDetail userDetailFromJson(String str) => UserDetail.fromJson(json.decode(str));
String userDetailToJson(UserDetail data) => json.encode(data.toJson());
class UserDetail {
  UserDetail({
      int? id, 
      String? createdAt, 
      String? updatedAt, 
      int? userId, 
      String? address, 
      String? image,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _address = address;
    _image = image;
}

  UserDetail.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _address = json['address'];
    _image = json['image'];
  }
  int? _id;
  String? _createdAt;
  String? _updatedAt;
  int? _userId;
  String? _address;
  String? _image;
UserDetail copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  int? userId,
  String? address,
  String? image,
}) => UserDetail(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
  address: address ?? _address,
  image: image ?? _image,
);
  int? get id => _id;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get userId => _userId;
  String? get address => _address;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    map['address'] = _address;
    map['image'] = _image;
    return map;
  }

}

/// code : 200
/// status : "success"
/// message : ""

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));
String metaToJson(Meta data) => json.encode(data.toJson());
class Meta {
  Meta({
      int? code, 
      String? status, 
      String? message,}){
    _code = code;
    _status = status;
    _message = message;
}

  Meta.fromJson(dynamic json) {
    _code = json['code'];
    _status = json['status'];
    _message = json['message'];
  }
  int? _code;
  String? _status;
  String? _message;
Meta copyWith({  int? code,
  String? status,
  String? message,
}) => Meta(  code: code ?? _code,
  status: status ?? _status,
  message: message ?? _message,
);
  int? get code => _code;
  String? get status => _status;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['status'] = _status;
    map['message'] = _message;
    return map;
  }

}