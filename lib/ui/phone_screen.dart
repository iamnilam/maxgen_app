import 'package:flutter/material.dart';
import 'package:maxgen_app/ui/congratulations_screen.dart';
import 'package:maxgen_app/ui/profile_select_category_screen.dart';
import 'package:maxgen_app/utils/app_color.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                "Enter phone number",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              IntlPhoneField(
                flagsButtonPadding: EdgeInsets.all(10),
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 235, 230, 230),
                  filled: true,
                  counter: Offstage(),
                  hintText: 'Mobile Number',
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(5)),
                ),
                initialCountryCode: 'IN',
                showDropdownIcon: true,
                dropdownIconPosition: IconPosition.trailing,
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              SizedBox(
                height: 70,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "By continuing, I accept ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: "Terms of Use ",
                      onEnter: (event) {},
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: "and ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      onEnter: (event) {},
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CongratulationsScreen(),
                      ),
                    );
                  },
                  color: AppColors.primaryColor,
                  child: Text(
                    "Submit",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
