class CarouselModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? image;

  CarouselModel(
      {this.id, this.createdAt, this.updatedAt, this.userId, this.image});

  CarouselModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    data['image'] = image;
    return data;
  }
}