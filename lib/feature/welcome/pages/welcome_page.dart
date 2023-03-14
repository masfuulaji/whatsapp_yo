import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_text_extension.dart';
import 'package:whatsapp_clone/common/routes/routes.dart';
import 'package:whatsapp_clone/common/widget/custom_elevated_button.dart';
import 'package:whatsapp_clone/feature/welcome/widget/language_button.dart';
import 'package:whatsapp_clone/feature/welcome/widget/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  navigateToLoginPage(context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      Routes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                child: Image.asset(
                  'assets/images/circle.png',
                  color: context.theme.circleImageColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Welcome to WhatsApp Yo',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const PrivacyAndTerms(),
                CustomElevatedButton(
                  onPressed: () => navigateToLoginPage(context),
                  text: 'Agree and Continue',
                ),
                const SizedBox(
                  height: 50,
                ),
                const LanguageButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
