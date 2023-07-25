import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/extension/custom_theme_extension.dart';
import 'package:myapp/common/widgets/custom_icon_button.dart';
import 'package:myapp/feature/auth/widgets/custom_text_field.dart';

class VerificationPage extends StatefulWidget {
  // const VerificationPage({super.key, required this.phoneNumber});
  VerificationPage({
    Key? key,
    this.phoneNumber = "default"
  }):super(key:key);

  dynamic phoneNumber;
  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late TextEditingController codeController;
  @override
  void initState() {
    // TODO: implement initState
    codeController = TextEditingController(text: "");
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose

    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          'Verify you number',
          style: TextStyle(
            color: context.theme.authAppbarTextColor
          ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(onTap: (){},
              icon: Icons.more_vert)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: context.theme.greyColor,
                    height: 1.5
                  ),
                  children: [
                     TextSpan(
                      text: "You've tried to register ${widget.phoneNumber}. wait before requesting an SMS or CALL your code. "
                    ),
                    TextSpan(
                      text: "Wrong Number?",
                      style: TextStyle(
                        color: context.theme.blueColor
                      )
                    )
                  ]
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                hintText: '- - -  - - -',
                fontSize: 30,
                autoFocus: true,
                controller: codeController,
                maxLength: 6,
                keyboardType: TextInputType.number,
                onChanged: (value) async{
                  // 这里监控输入监控吗 如果够位数了，就出发后端你操作
                  if(value.length >5){
                    debugPrint("输入的校验码:$value");
                  }

                  if(value.length == 6){
                    await Navigator.pushNamed(
                        context,
                        "userinfo",arguments:"yes"
                    );
                  }

                },
              ),
            ),
            const SizedBox(height: 20,),
            Text("Enter 6-digit code",style: TextStyle(
              color: context.theme.greyColor
            ),),
            const SizedBox(height: 20,),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                const SizedBox(width: 20,),
                Text('Resend SMS',style: TextStyle(
                  color: context.theme.greyColor
                ),),
                Divider()
              ],
            ),
            const SizedBox(height: 10,),
            Divider(
              color: context.theme.blueColor!.withOpacity(.2),
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: context.theme.greyColor,
                ),
                const SizedBox(width: 20,),
                Text('Call Me',style: TextStyle(
                    color: context.theme.greyColor
                ),),
                Divider()
              ],
            ),


          ],
        ),

      ),
    );
  }
}
