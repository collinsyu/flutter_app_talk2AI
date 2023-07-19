import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/extension/custom_theme_extension.dart';

import 'package:myapp/common/utils/coloors.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../widgets/language_button.dart';
import '../widgets/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Coloors.backgroundDark,
      body: Column(
        children: [
          Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 90),
                    child: Image.asset(
                      "assets/images/welcome.png",
                      color: context.theme.circleImageColor,
                    )),
              )),
          const SizedBox(height: 60,),
          Expanded(
              child: Column(
            children: [
              const Text(
                "欢迎使用德道AI",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const PrivacyAndTerms(),
              CustomElevatedButton(
                text: "同意并继续",
                onPressed: () async {
                  await Navigator.pushNamed(
                        context,
                        "login",
                      );
              },
              ),
              const SizedBox(height: 40,),
              LanguageButton()
            ],
          )),
        ],
      ),
    );
  }
}
