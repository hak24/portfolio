import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Project {
  final String title;
  final String description;
  final List<String> contributions;
  final List<String> technologies;

  const Project({
    required this.title,
    required this.description,
    required this.contributions,
    required this.technologies,
  });
}

class WorkExperience {
  final String companyName;
  final String jobTitle;
  final DateTime startDate;
  final DateTime? endDate;
  final List<Project> projects;
  final String? companyLogo;
  final Color? themeColor;

  const WorkExperience({
    required this.companyName,
    required this.jobTitle,
    required this.startDate,
    this.endDate,
    required this.projects,
    this.companyLogo,
    this.themeColor,
  });

  String get duration {
    final dateFormat = DateFormat('MMM yyyy');
    final start = dateFormat.format(startDate);
    final end = endDate != null ? dateFormat.format(endDate!) : 'Present';
    return '$start - $end';
  }
} 