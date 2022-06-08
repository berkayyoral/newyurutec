import 'package:get/get.dart';

import '../Constants/Constants.dart';
import '../export.dart';

class passwordFormField extends StatelessWidget {
   passwordFormField({
    Key? key,this.helpertext
  }) : super(key: key);

  String? helpertext;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width*0.7,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          helperText: helpertext,
          helperStyle: TextStyle(color: kBlue),
          hintText: 'Şifrenizi Giriniz',hintStyle: TextStyle(color: kBlue),
          prefixIcon: Icon(
            Icons.key_sharp,
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