import 'dart:convert';
/// meta : {"code":200,"status":"success","message":"List Edukasi"}
/// data : [{"id":1,"created_at":"2022-11-19T10:20:13.000000Z","updated_at":null,"user_id":1,"title":"Reduce, reuse, and recycle","content":"Cut down on what you throw away. Follow the three \"R's\" to conserve natural resources and landfill space.","image":"http://pitrash.masuk.web.id/images/Register/1668853211.jpg"},{"id":2,"created_at":"2022-11-19T10:23:39.000000Z","updated_at":null,"user_id":1,"title":"Volunteer","content":"Volunteer for cleanups in your community. You can get involved in protecting your watershed, too.","image":"http://pitrash.masuk.web.id/images/Register/1668853419.png"}]

EducationModel educationModelFromJson(String str) => EducationModel.fromJson(json.decode(str));
String educationModelToJson(EducationModel data) => json.encode(data.toJson());
class EducationModel {
  EducationModel({
      Meta? meta, 
      List<Data>? data,}){
    _meta = meta;
    _data = data;
}

  EducationModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Meta? _meta;
  List<Data>? _data;
EducationModel copyWith({  Meta? meta,
  List<Data>? data,
}) => EducationModel(  meta: meta ?? _meta,
  data: data ?? _data,
);
  Meta? get meta => _meta;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// created_at : "2022-11-19T10:20:13.000000Z"
/// updated_at : null
/// user_id : 1
/// title : "Reduce, reuse, and recycle"
/// content : "Cut down on what you throw away. Follow the three \"R's\" to conserve natural resources and landfill space."
/// image : "http://pitrash.masuk.web.id/images/Register/1668853211.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      int? id, 
      String? createdAt, 
      dynamic updatedAt, 
      int? userId, 
      String? title, 
      String? content, 
      String? image,}){
    _id = id;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _userId = userId;
    _title = title;
    _content = content;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _userId = json['user_id'];
    _title = json['title'];
    _content = json['content'];
    _image = json['image'];
  }
  int? _id;
  String? _createdAt;
  dynamic _updatedAt;
  int? _userId;
  String? _title;
  String? _content;
  String? _image;
Data copyWith({  int? id,
  String? createdAt,
  dynamic updatedAt,
  int? userId,
  String? title,
  String? content,
  String? image,
}) => Data(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  userId: userId ?? _userId,
  title: title ?? _title,
  content: content ?? _content,
  image: image ?? _image,
);
  int? get id => _id;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  int? get userId => _userId;
  String? get title => _title;
  String? get content => _content;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_id'] = _userId;
    map['title'] = _title;
    map['content'] = _content;
    map['image'] = _image;
    return map;
  }

}

/// code : 200
/// status : "success"
/// message : "List Edukasi"

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