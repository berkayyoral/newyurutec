import 'package:get/get.dart';
import 'package:yurutecrobot/Constants/Constants.dart';
import 'package:yurutecrobot/Pages/BottomNavBar/BottomNavBar.dart';
import 'package:yurutecrobot/Widgets/emailFormField.dart';
import 'package:yurutecrobot/Widgets/nameFormField.dart';
import 'package:yurutecrobot/Widgets/passwordFormField.dart';
import 'package:yurutecrobot/Widgets/surnameFormField.dart';

import '../Export.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.7,
                  ),
                  Container(
                    width: Get.width * 0.3,
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/signuptop.png'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
              Container(
                width: Get.width * 0.5,
                height: Get.height * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/logo.png'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Text(
                'Hesabınızı Oluşturunuz',
                style: TextStyle(color: kBlue, fontSize: 26),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              nameFormField(),
              SizedBox(
                height: Get.height * 0.01,
              ),
              surnameFormField(),
              SizedBox(
                height: Get.height * 0.01,
              ),
              emailFormField(),
              SizedBox(
                height: Get.height * 0.01,
              ),
              passwordFormField(),
              Container(
                width: Get.width * 0.7,
                height: Get.height * 0.1,
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                    color: kBlue,
                    child: Text("KAYIT OL", style: TextStyle(color: kWhite)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      /*if (auth.fetchCredentials(
                          usernameController.text, passwordController.text)) {*/
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                      /*} else {
                        setState(() {
                          _isVisible = true;
                        });
                      }*/
                    }),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Hesabınız var mı? Giriş yap',
                    style: TextStyle(color: kBlue),
                  )),
              Container(
                width: Get.width * 1,
                height: Get.height * 0.1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/signupbottom.png'),
                        fit: BoxFit.fill)),
              ),
            ],
          ),
        ));
  }
}
