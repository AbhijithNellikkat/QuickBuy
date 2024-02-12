// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
    int ?  id;
    String ?  email;
    String ?  password;
    String ?  name;
    Role ?  role;
    String ?  avatar;
    DateTime ?  creationAt;
    DateTime ?  updatedAt;

    Users({
        this.id,
        this.email,
        this.password,
        this.name,
        this.role,
        this.avatar,
        this.creationAt,
        this.updatedAt,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: roleValues.map[json["role"]],
        avatar: json["avatar"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "role": roleValues.reverse[role],
        "avatar": avatar,
        "creationAt": creationAt!.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

enum Role {
    ADMIN,
    CUSTOMER
}

final roleValues = EnumValues({
    "admin": Role.ADMIN,
    "customer": Role.CUSTOMER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
