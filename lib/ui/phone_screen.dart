import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:maxgen_app/provider/auth_provider.dart';
import 'package:maxgen_app/ui/congratulations_screen.dart';
import 'package:maxgen_app/ui/otp_screen.dart';
import 'package:maxgen_app/ui/profile_select_category_screen.dart';
import 'package:maxgen_app/utils/app_color.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class PhoneScreen extends StatefulWidget {
  final String verificationId;
  const PhoneScreen({super.key, required this.verificationId});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
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
              // IntlPhoneField(
              //   controller: phoneController,
              //   flagsButtonPadding: EdgeInsets.all(10),
              //   decoration: InputDecoration(
              //     fillColor: const Color.fromARGB(255, 235, 230, 230),
              //     filled: true,
              //     counter: Offstage(),
              //     hintText: 'Mobile Number',
              //     border: OutlineInputBorder(
              //         borderSide: BorderSide.none,
              //         borderRadius: BorderRadius.circular(5)),
              //   ),
              //   initialCountryCode: 'IN',
              //   showDropdownIcon: true,
              //   dropdownIconPosition: IconPosition.trailing,
              //   onChanged: (phone) {
              //     print(phone.completeNumber);
              //   },
              // ),
              TextFormField(
                cursorColor: Colors.purple,
                controller: phoneController,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  setState(() {
                    phoneController.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter phone number",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (value) {
                              setState(() {
                                selectedCountry = value;
                              });
                            });
                      },
                      child: Text(
                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: phoneController.text.length > 9
                      ? Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                      : null,
                ),
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
                  onPressed: () => sendPhoneNumber(),
                  //{

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => OtpScreen(verificationId: "verificationId",),
                    //   ),
                    // );
                 // },
                  color: AppColors.primaryColor,
                  child: Icon(
                    Icons.call,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void sendPhoneNumber() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}
