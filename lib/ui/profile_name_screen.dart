import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maxgen_app/model/user_model.dart';
import 'package:maxgen_app/provider/auth_provider.dart';
import 'package:maxgen_app/ui/congratulations_screen.dart';
import 'package:maxgen_app/ui/profile_select_category_screen.dart';
import 'package:maxgen_app/utils/app_color.dart';
import 'package:maxgen_app/utils/showsnackbar.dart';
import 'package:provider/provider.dart';

class ProfileNameScreen extends StatefulWidget {
  const ProfileNameScreen({super.key});

  @override
  State<ProfileNameScreen> createState() => _ProfileNameScreenState();
}

class _ProfileNameScreenState extends State<ProfileNameScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCtr = TextEditingController();
  //final nameController = TextEditingController();
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 210, 208, 208)
                              .withOpacity(0.7),
                          hintText: "Name",
                          prefixIcon: Icon(
                            Icons.person,
                            color: const Color.fromARGB(255, 141, 138, 138),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please type your name";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Select Your Profile Type",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                  onPressed: () {
                    if (formKey.currentState!.validate() ?? false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileSelectCategoryScreen(),
                        ),
                      );
                    }
                  },
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Mentee",
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
                  onPressed: () => storeData(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: AppColors.primaryColor,
                  child: Text(
                    "Mentor",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(), uid: '',
    );

  }
}
