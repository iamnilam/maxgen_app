import 'package:flutter/material.dart';
import 'package:maxgen_app/model/category_model.dart';
import 'package:maxgen_app/utils/app_color.dart';
import 'package:maxgen_app/widget/select_category_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController editingController = TextEditingController();
  List<CategoryModel> categoryModels = [];
  var items = <CategoryModel>[];
  int selectedCategoryIndex = -1;

  @override
  void initState() {
    categoryModels = categoryType;
    items = categoryType;
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = categoryModels
          .where(
            (item) => item.name!.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  List<CategoryModel> categoryType = [
    CategoryModel(id: "1", name: "Car Loan"),
    CategoryModel(id: "2", name: "Gold Loan"),
    CategoryModel(id: "3", name: "Home Loan"),
    CategoryModel(id: "4", name: "Business Loan"),
    CategoryModel(id: "5", name: "Other Loan"),
    CategoryModel(id: "6", name: "International Loan"),
  ];

  List<String> categotry = [
    'Finance',
    'Success Planning',
    'Leadership',
    'Goal Planning',
    'Mentor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          selectedCategoryIndex != -1
              ? items[selectedCategoryIndex].name!
              : "Select Your Category",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
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
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      color: selectedCategoryIndex == index
                          ? Colors.yellow
                          : Colors.grey.withOpacity(0.1),
                      child: Text(categotry[index]),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10,
                  );
                },
                itemCount: categotry.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    items.length,
                    (index) {
                      return SelectCategoryWidget(
                        categoryModel: items[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
