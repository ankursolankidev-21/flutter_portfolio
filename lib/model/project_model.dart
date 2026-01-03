import 'package:flutter/cupertino.dart';

class ProjectModel {
  final String projectTitle;
  final String client;
  final String projectType;
  final String domain;
  final String projectSummary;
  final List<String> keyChallenge;
  final List<String> responsibilities;
  final List<String> keyFeatures;
  final List<String> impact;
  final List<String> imagePaths;

  const ProjectModel({
    required this.projectTitle,
    required this.client,
    required this.projectType,
    required this.domain,
    required this.projectSummary,
    required this.keyChallenge,
    required this.responsibilities,
    required this.keyFeatures,
    required this.impact,
    required this.imagePaths,
  });
}