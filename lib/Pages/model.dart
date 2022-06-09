import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String name;
  final String lastName;
  final String sex;

   User({
    required this.name,
    required this.lastName,
    required this.sex,
});
}