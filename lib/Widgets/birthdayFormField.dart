import 'package:get/get.dart';
import 'package:yurutecrobot/Constants/Constants.dart';

import '../export.dart';

class birthdayFormField extends StatelessWidget {
  const birthdayFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width*0.4,
      child: TextFormField(
        style: TextStyle(color: kBlue),
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          hintText: 'Doğum Tarihi',hintStyle: TextStyle(color: kBlue),
          prefixIcon: Icon(
            Icons.calendar_month_outlined,
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
              Radius.circular(32),
            ),
          ),
        ),
      ),
    );
  }
}