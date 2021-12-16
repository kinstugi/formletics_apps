import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

class PostRegisterRequestModel extends Equatable{
  final String username;
  final String password;
  final String email;

  const PostRegisterRequestModel({
    @required  this.password,
    @required this.username,
    @required this.email
  });

  factory PostRegisterRequestModel.fromJson(Map<String, dynamic> json){
    return PostRegisterRequestModel(
      password: json['password'] as String,
      username: json['username'] as String,
      email: json['email'] as String
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'username': username,
      'email': email,
      'password': password
    };
  }

  @override
  List<Object> get props => throw UnimplementedError();

}