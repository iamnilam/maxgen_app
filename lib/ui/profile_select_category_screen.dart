import 'package:flutter/material.dart';
import 'package:maxgen_app/model/category_model.dart';
import 'package:maxgen_app/utils/app_color.dart';
import 'package:maxgen_app/widget/profile_category_widget.dart';

class ProfileSelectCategoryScreen extends StatefulWidget {
  const ProfileSelectCategoryScreen({super.key});

  @override
  State<ProfileSelectCategoryScreen> createState() =>
      _ProfileSelectCategoryScreenState();
}

class _ProfileSelectCategoryScreenState
    extends State<ProfileSelectCategoryScreen> {
  TextEditingController editingController = TextEditingController();

  var items = <CategoryModel>[];

  @override
  void initState() {
    items = category;
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = category
          .where(
              (item) => item.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  List<CategoryModel> category = [
    CategoryModel(id: "1", icon: Icons.sports_esports_outlined, name: "Sports"),
    CategoryModel(
        id: "2", icon: Icons.language, name: "Language and Communication"),
    CategoryModel(
        id: "3",
        icon: Icons.important_devices,
        name: "Philanthropy and Social Impact"),
    CategoryModel(
        id: "4",
        icon: Icons.pattern,
        name: "Intellectual Property and Patents"),
    CategoryModel(id: "5", icon: Icons.tour, name: "Hospitality & Tourism"),
    CategoryModel(
        id: "6", icon: Icons.design_services_sharp, name: "Fashion & Tourism"),
    CategoryModel(
        id: "7",
        icon: Icons.network_ping,
        name: "Networking & Relationship Building"),
    CategoryModel(
        id: "8",
        icon: Icons.indeterminate_check_box,
        name: "Diversity and Incliusion"),
    CategoryModel(id: "9", icon: Icons.real_estate_agent, name: "Real Estate"),
    CategoryModel(
        id: "10", icon: Icons.aspect_ratio_outlined, name: "astrologer"),
    CategoryModel(
        id: "11",
        icon: Icons.food_bank,
        name: "Culinary Arts and Food Industry"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Select Your Category",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                  hintText: "Search By Category",
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Divider(),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ProfileCategoryWidget(
                    categoryModel: items[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
