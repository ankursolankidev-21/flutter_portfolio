import 'package:flutter/cupertino.dart';

class EducationModel {
  final String subject;
  final IconData iconName;
  final String instituteName;
  final String duration;

  const EducationModel({
    required this.subject,
    required this.iconName,
    required this.instituteName,
    required this.duration,
  });
}