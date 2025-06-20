import 'package:flutter/material.dart';
import 'package:picktime/widgets/back_arrow_widget.dart';
import 'package:picktime/widgets/custom_button.dart';
import 'package:picktime/widgets/custom_code_box.dart';
import 'package:picktime/widgets/custom_spacer.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final codeCtrls = List.generate(6, (_) => TextEditingController());
    final focusNodes = List.generate(6, (_) => FocusNode());
    final width = MediaQuery.of(context).size.width;
    final fieldWidth = width * 0.8;
    final boxSize = fieldWidth / 8;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Verification",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const CustomSpacer(height: 8),
                  const Text("Enter the code we just sent you"),
                  const Text("The code expires in 10 minutes."),
                  const CustomSpacer(),
                  SizedBox(
                    width: fieldWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(6, (i) {
                        return CustomCodeBox(
                          controller: codeCtrls[i],
                          width: boxSize,
                          focusNode: focusNodes[i],
                          nextNode: i < 5 ? focusNodes[i + 1] : null,
                          prevNode: i > 0 ? focusNodes[i - 1] : null,
                        );
                      }),
                    ),
                  ),
                  const CustomSpacer(height: 30),
                  CustomButton(
                    text: "Verify",
                    width: fieldWidth,
                    onPressed: () {
                      final code = codeCtrls.map((c) => c.text).join();
                      debugPrint("Entered code: $code");
                      //  check code + navigation
                    },
                  ),
                  const CustomSpacer(height: 10),
                  TextButton(
                    onPressed: () {
                      debugPrint("Resend code requested");
                      //  send new code
                    },
                    child: const Text(" Resend Code"),
                  ),
                  const CustomSpacer(),
                ],
              ),
            ),
          ),
          BackArrowWidget(),
        ],
      ),
    );
  }
}
