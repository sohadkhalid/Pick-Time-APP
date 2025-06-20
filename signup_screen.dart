import 'package:flutter/material.dart';
import 'package:picktime/screens/verification_screen.dart';
import 'package:picktime/widgets/back_arrow_widget.dart';
import 'package:picktime/widgets/custom-dropdown.dart';
import 'package:picktime/widgets/custom_button.dart';
import 'package:picktime/widgets/custom_spacer.dart';
import 'package:picktime/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();

  final List<String> genderItems = ["Male", "Female"];
  final List<String> serviceItems = [
    "GovernmentServices",
    "WaterServices",
    "ElectricityServices",
    "Telecommunications",
    "BanksServices",
    "CharitableServices",
  ];

  String? gender;
  String? service;

  @override
  void initState() {
    super.initState();
    gender = genderItems.first;
    service = serviceItems.first;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final fieldWidth = width * 0.8;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  CustomTextField(
                      hint: "Full name",
                      controller: nameCtrl,
                      width: fieldWidth),
                  CustomTextField(
                      hint: "Jordanian phone number",
                      controller: phoneCtrl,
                      width: fieldWidth,
                      keyboardType: TextInputType.phone),
                  CustomTextField(
                      hint: "Email",
                      controller: emailCtrl,
                      width: fieldWidth,
                      keyboardType: TextInputType.emailAddress),
                  CustomTextField(
                      hint: "Age",
                      controller: ageCtrl,
                      width: fieldWidth,
                      keyboardType: TextInputType.number),
                  CustomDropdown(
                    value: gender,
                    items: genderItems,
                    width: fieldWidth,
                    onChanged: (val) => setState(() => gender = val),
                  ),
                  CustomDropdown(
                    value: service,
                    items: serviceItems,
                    width: fieldWidth,
                    onChanged: (val) => setState(() => service = val),
                  ),
                  const CustomSpacer(),
                  CustomButton(
                    text: "Sign Up",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const VerificationScreen()),
                      );
                    },
                    width: fieldWidth,
                  ),
                  const CustomSpacer(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "By signing up, you agree to our Terms of Service and Privacy Policy.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  CustomSpacer(),
                ],
              ),
            ),
          ),
          const BackArrowWidget(),
        ],
      ),
    );
  }
}
