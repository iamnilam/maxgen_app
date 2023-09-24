import 'package:flutter/material.dart';
import 'package:maxgen_app/model/category_model.dart';
import 'package:maxgen_app/ui/base_screen.dart';

class ProfileCategoryWidget extends StatelessWidget {
  ProfileCategoryWidget({super.key, required this.categoryModel});
  CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BaseScreen(),
          ),
        );
      },
      leading: Icon(categoryModel.icon),
      title: Text(categoryModel.name!),
    );
  }
}
