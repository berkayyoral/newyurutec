
import 'package:get/get.dart';
import 'package:yurutecrobot/Constants/Constants.dart';
import 'package:yurutecrobot/Pages/BottomNavBar/BottomNavBar.dart';
import 'package:yurutecrobot/Widgets/birthdayFormField.dart';
import 'package:yurutecrobot/Widgets/boyFormField.dart';
import 'package:yurutecrobot/Widgets/diztopukFormField.dart';
import 'package:yurutecrobot/Widgets/kiloFormField.dart';
import 'package:yurutecrobot/Widgets/nameFormField.dart';

import '../Widgets/surnameFormField.dart';
import '../export.dart';

class yeniKayitPage extends StatefulWidget {
   yeniKayitPage({Key? key}) : super(key: key);

  @override
  State<yeniKayitPage> createState() => _yeniKayitPageState();
}

class _yeniKayitPageState extends State<yeniKayitPage> {
  String battery_per = "10";

   List<DropdownMenuItem<String>> get dropdownItems{
     List<DropdownMenuItem<String>> menuItems = [
       DropdownMenuItem(child: Text("Kadın",style: TextStyle(color: kBlue),),value: "Kadın"),
       DropdownMenuItem(child: Text("Erkek",style: TextStyle(color: kBlue),),value: "Erkek"),
     ];
     return menuItems;
   }

   String selectedValue = "Erkek";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80,
          title: Text("QTR TECHNOLOGY"),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/battery-level.png",
                    scale: 1.5,
                    color: Colors.white,
                  ),
                  Text(battery_per)
                ],
              ),
            )
          ],
          backgroundColor: kBlue),
      body: SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(height: Get.height*0.05),
          Text('Yeni Hasta Kayıt',style: TextStyle(color: kBlue,fontSize: 26),),
          SizedBox(height: Get.height*0.03),
          nameFormField(),
          SizedBox(height: Get.height*0.02),
          surnameFormField(),
          SizedBox(height: Get.height*0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width*0.4,
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kBlue, width: 2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: kBlue, width: 2),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems),
              ),
              SizedBox(width: Get.width*0.05),
              birthdayFormField(),
            ],
          ),
          SizedBox(height: Get.height*0.02),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             boyFormField(),
             SizedBox(width: Get.width*0.05),
             kiloFormField(),
           ],
         ),
          SizedBox(height: Get.height*0.02),
          diztopukFormField(),
          SizedBox(height: Get.height*0.03),
          MaterialButton(
            minWidth: Get.width * 0.35,
            height: Get.height * 0.075,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onPressed: () {},
            color: kBlue,
            textColor: kWhite,
            child: Text(
              'KAYDET',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
