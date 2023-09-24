import 'package:flutter/material.dart';
import 'package:maxgen_app/ui/base_screen.dart';
import 'package:maxgen_app/ui/home_screen.dart';
import 'package:maxgen_app/ui/profile_name_screen.dart';
import 'package:maxgen_app/utils/app_color.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              "Congratulation!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome to Menta",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileNameScreen()));
              
                },
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Complate my Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BaseScreen()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: AppColors.greyColor,
                child: Text(
                  "Explore the App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
