import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxgen_app/model/category_model.dart';
import 'package:maxgen_app/utils/app_color.dart';

class SelectCategoryWidget extends StatelessWidget {
  SelectCategoryWidget({
    super.key,
    required this.categoryModel,
  });
  CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: AppColors.greyColor.withOpacity(0.1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.person_fill,
            color: AppColors.primaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Text(categoryModel.name!),
        ],
      ),
    );
  }
}
