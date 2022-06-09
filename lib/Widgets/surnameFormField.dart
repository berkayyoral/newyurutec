import 'package:get/get.dart';
import 'package:yurutecrobot/Constants/Constants.dart';

import '../export.dart';

class surnameFormField extends StatelessWidget {
  const surnameFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width*0.7,
      child: TextFormField(
        style: TextStyle(color: kBlue),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: 'Soyisim',hintStyle: TextStyle(color: kBlue),
          prefixIcon: Icon(
            Icons.person_outline,
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