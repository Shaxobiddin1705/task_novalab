import 'dart:convert';
/// status : {"verified":null,"sentCount":0}
/// _id : "62705c4414e51b84dcca6607"
/// user : "626c5c3341f4aa428ac1f6af"
/// text : "The cat can eat the mouse."
/// type : "cat"
/// deleted : false
/// createdAt : "2022-05-02T22:33:40.620Z"
/// updatedAt : "2022-05-02T22:33:40.620Z"
/// __v : 0

RandomCatFact randomCatFactFromJson(String str) => RandomCatFact.fromJson(json.decode(str));
String randomCatFactToJson(RandomCatFact data) => json.encode(data.toJson());
class RandomCatFact {
  RandomCatFact({
      this.status, 
      this.id, 
      this.user, 
      this.text, 
      this.type, 
      this.deleted, 
      this.createdAt, 
      this.updatedAt, 
      this.v,});

  RandomCatFact.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    id = json['_id'];
    user = json['user'];
    text = json['text'];
    type = json['type'];
    deleted = json['deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  Status? status;
  String? id;
  String? user;
  String? text;
  String? type;
  bool? deleted;
  String? createdAt;
  String? updatedAt;
  int? v;
RandomCatFact copyWith({  Status? status,
  String? id,
  String? user,
  String? text,
  String? type,
  bool? deleted,
  String? createdAt,
  String? updatedAt,
  int? v,
}) => RandomCatFact(  status: status ?? this.status,
  id: id ?? this.id,
  user: user ?? this.user,
  text: text ?? this.text,
  type: type ?? this.type,
  deleted: deleted ?? this.deleted,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  v: v ?? this.v,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status?.toJson();
    }
    map['_id'] = id;
    map['user'] = user;
    map['text'] = text;
    map['type'] = type;
    map['deleted'] = deleted;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

}

/// verified : null
/// sentCount : 0

Status statusFromJson(String str) => Status.fromJson(json.decode(str));
String statusToJson(Status data) => json.encode(data.toJson());
class Status {
  Status({
      this.verified, 
      this.sentCount,});

  Status.fromJson(dynamic json) {
    verified = json['verified'];
    sentCount = json['sentCount'];
  }
  dynamic verified;
  int? sentCount;
Status copyWith({  dynamic verified,
  int? sentCount,
}) => Status(  verified: verified ?? this.verified,
  sentCount: sentCount ?? this.sentCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['verified'] = verified;
    map['sentCount'] = sentCount;
    return map;
  }

}