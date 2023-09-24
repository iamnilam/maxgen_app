import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class Numbers extends StatefulWidget {
  const Numbers({super.key});

  static String verify= "";

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {

  TextEditingController phoneNumberController = TextEditingController();

  var phone = "";

  @override
  void initState() {
    // TODO: implement initState
    phoneNumberController.text = "+91";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Stack(
          children: [
            Container(
                padding:
                    const EdgeInsets.only(left: 20, right: 20, bottom: 500),
                child: const Center(
                  child: Text(
                    "Enter phone number",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                )),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0), // Set border radius
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: IntlPhoneField(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    flagsButtonPadding: const EdgeInsets.all(10),
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                      border: InputBorder.none,
                      fillColor: Colors.grey[200],
                      filled: true,
                      labelStyle: const TextStyle(color: Colors.black),
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (PhoneNumber value) {
                      phone = value.completeNumber; // Update the phone variable
                    },
                  ),




                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'By continuing | accept ',
                          style: TextStyle(color: Colors.black26),
                        ),
                        TextSpan(
                          text: 'Terms of Use ',
                          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.black26,),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async{
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '${phoneNumberController.text+phone}',
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      Numbers.verify= verificationId;
                      Navigator.pushNamed(
                          context, "otp");
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );

                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: const Center(
                    child: Icon(Icons.phone_rounded,size: 30,),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
