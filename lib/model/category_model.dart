import 'package:flutter/material.dart';

class CategoryModel {
  String? id;
  IconData? icon;
  String? name;

  CategoryModel({
    required this.id,
    this.icon,
    required this.name,
  });
}
