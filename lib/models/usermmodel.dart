class MUserResponse {
  List<MUser>? users;
  int? total;
  int? skip;
  int? limit;

  MUserResponse({
    this.users,
    this.total,
    this.skip,
    this.limit,
  });

  factory MUserResponse.fromJson(Map<String, dynamic> json) {
    var userList = json['users'] as List;
    List<MUser> users =
        userList.map((userJson) => MUser.fromJson(userJson)).toList();
    return MUserResponse(
      users: users,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class MUser {
  int? id;
  String? firstName;
  String? lastName;

  MUser({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory MUser.fromJson(Map<String, dynamic> json) {
    return MUser(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
