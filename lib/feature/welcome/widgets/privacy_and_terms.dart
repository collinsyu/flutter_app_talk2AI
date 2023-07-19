
import 'package:flutter/cupertino.dart';
import 'package:myapp/common/extension/custom_theme_extension.dart';

import '../../../common/utils/coloors.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20
      ),
      child: RichText(
          textAlign: TextAlign.center,
          text:  TextSpan(
              text: "请阅读我司 ",
              style: TextStyle(color: context.theme.greyColor, height: 1.5),
              children: [
                TextSpan(
                    text: "《隐私政策》 ",
                    style: TextStyle(color: context.theme.blueColor)),
                TextSpan(text: '点击同意并继续'),
                TextSpan(
                    text: "《服务条款》",
                    style: TextStyle(color:context.theme.blueColor)),
              ])),
    );
  }
}
