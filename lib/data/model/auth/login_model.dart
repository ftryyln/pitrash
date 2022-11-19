import 'dart:convert';
/// meta : {"code":200,"status":"success","message":"berhasil login"}
/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDVlMGNjMWM5YmJmMzMzZDVmOGY0MGNiN2RmMTZjYjIwNzAyNGM4NGZkZWJmZGI3MjdlOTBhZjM2MWU4NTI3YTY3NDExYTBkNWQ0NDhmOTQiLCJpYXQiOjE2Njg4NzA1MzMuNjE2MjE4MDkwMDU3MzczMDQ2ODc1LCJuYmYiOjE2Njg4NzA1MzMuNjE2MjIwOTUxMDgwMzIyMjY1NjI1LCJleHAiOjE3MDA0MDY1MzMuNjA3NDgwMDQ5MTMzMzAwNzgxMjUsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.KHjcWbjZNmf5RsvRQiEN8dm6BrBD-O5lGdIov8TDOaCA0dfP8Y_EWgM_-jMc_ZcxhSr36hI9-Fxybv85Ed48Ho5TH_VtC-4vcJEdg3aVEeXqw5eRvdoFy10ufxpKFcN9ktE07n6qa8Buki-LnUORXI18fiM7D0wTEzaDNEggrgS7-mNsR3TRu8TtuqHGQFPG7fAVdz6s1r0kgkGNIvGQalr3TmWiSNoebzDb0Y3FOHkmUPXOZsKHtQt0mX_bmTLdVoUGFzeijv6X-x6NMXmEW9dIehg-IxYl7PZeJw2uqFBqvimcy440A_TweapXDqe28r55feylPQWeYiHcX0i52OJleOo3L3c3sRN4d3697Zq0UZiGcOgeQyWBuUkTw2idyy2g3q1Jh0b630ezyMTOIA6KQ27iAxnRkAHb2FJHpphodNaZ4YiqIK0jveJKIeBtu9SixdGl7nvuNeBhXTbzr1_2aDAUGc7maPyY9VG8kTQk8YaNzfKGpmPD3hVD1IDpdqI9m2-oYoIWpW0d5c12Wg9auxBIlXnMC_xkLBmb1O-Ji6LTBIZWYJxbLVOO9pPlmUZD7Tujnd5SqSoMPQ0aCeA_O0-2bQ_CuDbsttVwJCpTGUBDBjYqxzbKkINHg9DwE6kNPyVcftR7MIUL8KpLMRXzTryjhHi7xDPTVBmkiCc","user":{"id":1,"created_at":"2022-11-18T06:31:43.000000Z","updated_at":"2022-11-19T06:06:48.000000Z","user_id":1,"address":"Jl.Yang lurus no.69 Bekasi, Planet namek","image":"202211191306481.png"}}

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());
class LoginModel {
  LoginModel({
      Meta? meta, 
      Data? data,}){
    _meta = meta;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Meta? _meta;
  Data? _data;
LoginModel copyWith({  Meta? meta,
  Data? data,
}) => LoginModel(  meta: meta ?? _meta,
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

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDVlMGNjMWM5YmJmMzMzZDVmOGY0MGNiN2RmMTZjYjIwNzAyNGM4NGZkZWJmZGI3MjdlOTBhZjM2MWU4NTI3YTY3NDExYTBkNWQ0NDhmOTQiLCJpYXQiOjE2Njg4NzA1MzMuNjE2MjE4MDkwMDU3MzczMDQ2ODc1LCJuYmYiOjE2Njg4NzA1MzMuNjE2MjIwOTUxMDgwMzIyMjY1NjI1LCJleHAiOjE3MDA0MDY1MzMuNjA3NDgwMDQ5MTMzMzAwNzgxMjUsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.KHjcWbjZNmf5RsvRQiEN8dm6BrBD-O5lGdIov8TDOaCA0dfP8Y_EWgM_-jMc_ZcxhSr36hI9-Fxybv85Ed48Ho5TH_VtC-4vcJEdg3aVEeXqw5eRvdoFy10ufxpKFcN9ktE07n6qa8Buki-LnUORXI18fiM7D0wTEzaDNEggrgS7-mNsR3TRu8TtuqHGQFPG7fAVdz6s1r0kgkGNIvGQalr3TmWiSNoebzDb0Y3FOHkmUPXOZsKHtQt0mX_bmTLdVoUGFzeijv6X-x6NMXmEW9dIehg-IxYl7PZeJw2uqFBqvimcy440A_TweapXDqe28r55feylPQWeYiHcX0i52OJleOo3L3c3sRN4d3697Zq0UZiGcOgeQyWBuUkTw2idyy2g3q1Jh0b630ezyMTOIA6KQ27iAxnRkAHb2FJHpphodNaZ4YiqIK0jveJKIeBtu9SixdGl7nvuNeBhXTbzr1_2aDAUGc7maPyY9VG8kTQk8YaNzfKGpmPD3hVD1IDpdqI9m2-oYoIWpW0d5c12Wg9auxBIlXnMC_xkLBmb1O-Ji6LTBIZWYJxbLVOO9pPlmUZD7Tujnd5SqSoMPQ0aCeA_O0-2bQ_CuDbsttVwJCpTGUBDBjYqxzbKkINHg9DwE6kNPyVcftR7MIUL8KpLMRXzTryjhHi7xDPTVBmkiCc"
/// user : {"id":1,"created_at":"2022-11-18T06:31:43.000000Z","updated_at":"2022-11-19T06:06:48.000000Z","user_id":1,"address":"Jl.Yang lurus no.69 Bekasi, Planet namek","image":"202211191306481.png"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? token, 
      User? user,}){
    _token = token;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _token;
  User? _user;
Data copyWith({  String? token,
  User? user,
}) => Data(  token: token ?? _token,
  user: user ?? _user,
);
  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 1
/// created_at : "2022-11-18T06:31:43.000000Z"
/// updated_at : "2022-11-19T06:06:48.000000Z"
/// user_id : 1
/// address : "Jl.Yang lurus no.69 Bekasi, Planet namek"
/// image : "202211191306481.png"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
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

  User.fromJson(dynamic json) {
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
User copyWith({  int? id,
  String? createdAt,
  String? updatedAt,
  int? userId,
  String? address,
  String? image,
}) => User(  id: id ?? _id,
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
/// message : "berhasil login"

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