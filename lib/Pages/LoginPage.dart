import 'package:get/get.dart';
import 'package:yurutecrobot/Utilities/auth.dart';
import 'package:yurutecrobot/Widgets/passwordFormField.dart';

import '../Constants/Constants.dart';
import '../Export.dart';
import '../Widgets/emailFormField.dart';
import 'BottomNavBar/BottomNavBar.dart';

final auth = Authentication();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;

  final TapGestureRecognizer _gestureRecognizer = TapGestureRecognizer()
    ..onTap = () {
      if (kDebugMode) {
        print("Hello world from _gestureRecognizer");
      }
    };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    width: Get.width * 0.3,
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logintop.png'),
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
              SizedBox(height: Get.height*0.03,),
              Text(
                'Hoş Geldiniz',
                style: TextStyle(color: kBlue, fontSize: 26),
              ),
              SizedBox(height: Get.height*0.03,),
              emailFormField(),
              SizedBox(height: Get.height*0.01,),
              passwordFormField(helpertext: 'Şifrenizi mi unuttunuz?',),

              /*Visibility(
                visible: _isVisible,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Lütfen bilgileri kontrol ediniz!",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),*/
              // Textfields for username and password fields
              Container(
                width: Get.width * 0.7,
                height: Get.height * 0.1,
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                    color: kBlue,
                    child: Text("GİRİŞ YAP", style: TextStyle(color: kWhite)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      /*if (auth.fetchCredentials(
                          usernameController.text, passwordController.text)) {*/
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBar(
                                  title: 'Ana sayfa',
                                )),
                        (Route<dynamic> route) => false,
                      );
                      /*} else {
                        setState(() {
                          _isVisible = true;
                        });
                      }*/
                    }),
              ),
              SizedBox(height: Get.height*0.01),
              // Register
              Container(
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Hesabınız yok mu? ",
                      style: TextStyle(
                        color: kBlue,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                            text: " Kayıt Ol",
                            style: TextStyle(
                                color: kBlue, fontWeight: FontWeight.bold),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()),
                                    )
                                  }),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: Get.width*0.7,),
                  Container(
                    width: Get.width * 0.3,
                    height: Get.height * 0.127,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/loginbottom.png'),
                            fit: BoxFit.fill)),
                  ),
                ],
              )
            ],
          )),
    );
  }
}