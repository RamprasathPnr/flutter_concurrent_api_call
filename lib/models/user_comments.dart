import 'dart:convert';

List<UserCommentsResponse> userCommentsResponseFromJson(String str) => List<UserCommentsResponse>.from(json.decode(str).map((x) => UserCommentsResponse.fromJson(x)));

String userCommentsResponseToJson(List<UserCommentsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCommentsResponse {
  int postId;
  int id;
  String name;
  String email;
  String body;

  UserCommentsResponse({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory UserCommentsResponse.fromJson(Map<String, dynamic> json) => UserCommentsResponse(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
