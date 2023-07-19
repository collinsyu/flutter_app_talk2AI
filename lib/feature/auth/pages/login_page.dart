import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:myapp/common/extension/custom_theme_extension.dart';
import 'package:myapp/common/helper/show_help_dialog.dart';
import 'package:myapp/common/widgets/custom_elevated_button.dart';

import '../../../common/utils/coloors.dart';
import '../../../common/widgets/custom_icon_button.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;



  sendCodeToPhone() async {
    final phone = phoneNumberController.text;
    final name = countryNameController.text;

    if(phone.isEmpty){
      return showAlertDialog(context: context,
          message: "请输入手机号");
    }
    if(phone.length < 9){
      return showAlertDialog(context: context,
          message: "输入的手机号太短了");
    }
    await Navigator.pushNamed(
        context,
        "verify",arguments:phone
    );
    
  }
  showCountryCodePicker(){
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      // locale:Locale('zh'),
      favorite: ['CN'],

        // countryFilter:['CN','US'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).colorScheme.background,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(
          color: context.theme.greyColor
        ),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(
            color: context.theme.greyColor
          ),
          prefixIcon: const Icon(
            Icons.language,
            color: Coloors.greenDark,
          ),
          hintText: "Search country code or name",
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(.2)
            )
          ),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Coloors.greenDark
                )
            )
        )


      ),
      onSelect: (country){
      debugPrint(country.nameLocalized);

        countryNameController.text = country.nameLocalized!;
        countryCodeController.text = country.phoneCode;
    },);
  }

  @override
  void initState() {
    // TODO: implement initState
    countryNameController = TextEditingController(text: "中国");
    countryCodeController = TextEditingController(text: "86");
    phoneNumberController = TextEditingController();
    super.initState();
  }


  @override
  void dispose() {
    // TODO: implement dispose

    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title:  Text("Enter your phone number",
        style: TextStyle(
          color: context.theme.authAppbarTextColor
        ),),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: (){},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),
            child: RichText(text: TextSpan(
              text: "WhatsApp will need to verify your phone number. ",
              style: TextStyle(
                color: context.theme.greyColor,
                height: 1.5
              ),
              children: [
                TextSpan(
                  text: "What's my number? ",
                  style: TextStyle(
                    color: context.theme.blueColor
                  )
                ),

              ]
            )),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50
            ),
            child: CustomTextField(
              onTap: showCountryCodePicker,
              readOnly: true,
              controller: countryNameController,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Coloors.greenDark,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 50
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: showCountryCodePicker,
                    controller: countryCodeController,
                    prefixText: "+",
                    readOnly: true,
                  ),
                ),

                const SizedBox(width: 10,),
                Expanded(child: CustomTextField(
                  onTap: (){},
                  controller: phoneNumberController,
                  hintText: 'phone number',
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                ),)

              ],
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            'Carrier charges may apply',
            style: TextStyle(
              color: context.theme.greyColor,
            ),
          ),



        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
        text: "NEXT",
        buttonWidth: 90,
      ),

    );
  }
}
