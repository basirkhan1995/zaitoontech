
import 'dart:typed_data';

class UserModel{
    int? userId;
    String usrFirstName;
    String usrLastName;
    String usrName;
    String usrPass;
    String usrPhone;
    String usrEmail;

  UserModel({this.userId,required this.usrName,required this.usrPass,required this.usrEmail,required this.usrFirstName,required this.usrLastName,required this.usrPhone});

  factory UserModel.fromJson(Map<String, dynamic>json) => UserModel(
    userId: json['userId'],
    usrFirstName: json['usrFirstName'],
    usrLastName: json['usrLastName'],
    usrName: json['usrName'],
    usrPass: json['usrPass'],
    usrPhone: json['usrPhone'],
    usrEmail: json['usrEmail'],
  );

  Map<String, dynamic>toJson() => {
    'userId': userId,
    'usrFirstName': usrFirstName,
    'usrLastName': usrLastName,
    'usrName': usrName,
    'usrPass': usrPass,
    'usrPhone': usrPhone,
    'usrEmail': usrEmail,
  };
}