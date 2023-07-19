import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/extension/custom_theme_extension.dart';
import 'package:myapp/common/widgets/custom_icon_button.dart';

import '../../../common/utils/coloors.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
  });

  _showModalBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 36,
                  decoration: BoxDecoration(
                      color: context.theme.greyColor!.withOpacity(.4),
                      borderRadius: BorderRadius.circular(5)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    CustomIconButton(onTap: (){
                      Navigator.of(context).pop();
                    }, icon: Icons.close_outlined),

                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'App Language',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: context.theme.greyColor!.withOpacity(.3),
                  thickness: .5,
                  height: 2,
                ),
                RadioListTile(
                    value: true,
                    groupValue: false,
                    onChanged: (value){},
                    activeColor: Coloors.greenDark,
                  title: const Text("English"),
                  subtitle: Text(
                    "(phone's language)",
                    style: TextStyle(
                      color: context.theme.greyColor
                    ),
                  ),
                ),

                RadioListTile(
                  value: true,
                  groupValue: true,
                  onChanged: (value){},
                  activeColor: Coloors.greenDark,
                  title: const Text("中文"),
                  subtitle: Text(
                    "(手机语言)",
                    style: TextStyle(
                        color: context.theme.greyColor
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.theme.langBtnBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => _showModalBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.theme.langBtnHighlightColor,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language,
                color: Coloors.greenDark,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "中文",
                style: TextStyle(color: Coloors.greenDark),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Coloors.greenDark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
