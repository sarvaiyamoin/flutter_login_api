class UserData {
  UserData({
    this.user,
    this.token,
  });

  UserData.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.isSuperAdmin,
    this.isOrganizerAdmin,
    this.isCounterUser,
    this.organizerId,
    this.isUser,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    isSuperAdmin = json['is_super_admin'];
    isOrganizerAdmin = json['is_organizer_admin'];
    isCounterUser = json['is_counter_user'];
    organizerId = json['organizer_id'];
    isUser = json['is_user'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? phone;
  int? isSuperAdmin;
  int? isOrganizerAdmin;
  int? isCounterUser;
  dynamic organizerId;
  int? isUser;
  int? isActive;
  dynamic createdAt;
  dynamic updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['phone'] = phone;
    map['is_super_admin'] = isSuperAdmin;
    map['is_organizer_admin'] = isOrganizerAdmin;
    map['is_counter_user'] = isCounterUser;
    map['organizer_id'] = organizerId;
    map['is_user'] = isUser;
    map['is_active'] = isActive;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
