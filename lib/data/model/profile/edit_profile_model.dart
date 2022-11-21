import 'dart:convert';
/// meta : {"code":202,"status":"success","message":"user berhasil disunting"}
/// data : {"id":5,"created_at":"2022-11-18T06:31:43.000000Z","updated_at":"2022-11-21T16:17:01.000000Z","user_id":5,"address":"Kota Banjar","image":"http://pitrash.masuk.web.id/images/user/202211212317015.jpg"}

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));
String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());
class EditProfileModel {
  EditProfileModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  EditProfileModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
EditProfileModel copyWith({  Meta? meta,
  Data? data,
}) => EditProfileModel(  meta: meta ?? _meta,
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

/// id : 5
/// created_at : "2022-11-18T06:31:43.000000Z"
/// updated_at : "2022-11-21T16:17:01.000000Z"
/// user_id : 5
/// address : "Kota Banjar"
/// image : "http://pitrash.masuk.web.id/images/user/202211212317015.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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
Data copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  int? userId,
  String? address,
  String? image,
}) => Data(  id: id ?? _id,
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

/// code : 202
/// status : "success"
/// message : "user berhasil disunting"

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