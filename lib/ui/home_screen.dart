import 'package:flutter/material.dart';
import 'package:maxgen_app/model/finanace_home_model.dart';
import 'package:maxgen_app/utils/app_color.dart';
import 'package:maxgen_app/widget/finance_home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FinanceHomeModel> homeList = [
    FinanceHomeModel(
      id: "1",
      imgUrl: "",
      rating: "2.5",
      totalRating: 2,
      saved: false,
      category: "Finance",
      name: "Sumit ",
      description: "I'm An Qa",
      about: "4 Years of Total Experience",
      languageKnown: [
        'English',
        'Hindi',
        'Gujarati',
      ],
      location: [
        'Candolim',
        'goa',
      ],
      knownCategoryTypes: [
        'Investment Banking',
        'Corporate Banking',
        'Personal Loan',
        'Financial Markets',
        'Personal Finance',
        'Other Finance'
      ],
    ),
    FinanceHomeModel(
      id: "2",
      imgUrl: "",
      rating: "0",
      totalRating: 0,
      saved: true,
      category: "Finance",
      name: "Adity Das ",
      description: "Finanace Advisor",
      about: "4 Years of Total Experience",
      languageKnown: [
        'English',
        'Hindi',
        'Marathi',
        'Tamil',
      ],
      location: [
        'Pune',
        'Maharastra',
      ],
      knownCategoryTypes: [
        'Car Loan',
        'Gold Loan',
        'Home Loan',
        'Bussiness Loan',
        'Other Loan',
        'Personal Loan'
      ],
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.primaryColor),
            child: Center(
              child: Text(
                "M",
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ),
        ),
        title: Text(
          "Finance",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.blackColor),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: "Search By Name, title, company",
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors
                            .primaryColor, // Replace with your desired border color
                        width: 5,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Text(
                            "Locations",
                            style: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.blackColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Text(
                            "Topics",
                            style: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: AppColors.blackColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return FinanaceHomeWidget(
                          financeHomeModel: homeList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: homeList.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
