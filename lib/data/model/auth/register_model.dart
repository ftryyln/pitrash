import 'dart:convert';
/// meta : {"code":201,"status":"success","message":"user berhasil daftar"}
/// data : {"id":14,"name":"qowi","email":"poteto@mail.com","email_verified_at":null,"role":0,"phone":"12345678","created_at":"2022-11-19T15:26:29.000000Z","updated_at":null}

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());
class RegisterModel {
  RegisterModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  RegisterModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
RegisterModel copyWith({  Meta? meta,
  Data? data,
}) => RegisterModel(  meta: meta ?? _meta,
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

/// id : 14
/// name : "qowi"
/// email : "poteto@mail.com"
/// email_verified_at : null
/// role : 0
/// phone : "12345678"
/// created_at : "2022-11-19T15:26:29.000000Z"
/// updated_at : null

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
      String? createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _role = role;
    _phone = phone;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
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
  }
  int? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  int? _role;
  String? _phone;
  String? _createdAt;
  dynamic _updatedAt;
Data copyWith({  int? id,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  int? role,
  String? phone,
  String? createdAt,
  dynamic updatedAt,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  role: role ?? _role,
  phone: phone ?? _phone,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  int? get role => _role;
  String? get phone => _phone;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

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
    return map;
  }

}

/// code : 201
/// status : "success"
/// message : "user berhasil daftar"

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