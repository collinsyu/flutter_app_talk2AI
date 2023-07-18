import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:myapp/common/utils/coloors.dart';

import '../widgets/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Coloors.backgroundDark,
      body: Column(
        children: [
          Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 90),
                    child: Image.asset(
                      "assets/images/welcome.png",
                      color: Coloors.greenDark,
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
              CustomElevatedButton(),
              const SizedBox(height: 40,),
              Material(
                color: const Color(0xFF182229),
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: (){},
                  borderRadius: BorderRadius.circular(20),
                  splashFactory: NoSplash.splashFactory,
                  highlightColor: Coloors.greenDark,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.language,color: Coloors.greenDark,
                        ),
                        SizedBox(width: 10,),
                        Text("中文",
                        style: TextStyle(
                          color: Coloors.greenDark
                        ),),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.keyboard_arrow_down,color: Coloors.greenDark,
                        ),
                      ],
                    ),
                  ),

                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {

  final double? buttonWidth;
  final VoidCallback onPressed;


  const CustomElevatedButton({
    Key? key, this.buttonWidth, required this.onPressed,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Coloors.greenDark,
            foregroundColor: Coloors.backgroundDark,
            splashFactory: NoSplash.splashFactory,
            elevation: 0,
            shadowColor: Colors.transparent
          ),
          child:
            const Text("同意并继续")
      ),
    );
  }
}
