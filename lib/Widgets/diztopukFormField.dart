import 'package:get/get.dart';
import 'package:yurutecrobot/Constants/Constants.dart';

import '../export.dart';

class diztopukFormField extends StatelessWidget {
  const diztopukFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width*0.7,
      child: TextFormField(
        style: TextStyle(color: kBlue),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Diz-Topuk Arası Uzunluk',hintStyle: TextStyle(color: kBlue),
          prefixIcon: Icon(
            Icons.horizontal_rule_rounded,
            color: kBlue,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBlue, width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBlue,width: 2),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}