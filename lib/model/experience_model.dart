import 'package:flutter/cupertino.dart';

class ExperienceModel {
  final String role;
  final IconData iconName;
  final String company;
  final String duration;
  final List<String> responsibilities;

  const ExperienceModel({
    required this.role,
    required this.iconName,
    required this.company,
    required this.duration,
    required this.responsibilities,
  });
}