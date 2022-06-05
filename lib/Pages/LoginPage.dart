




import 'package:yurutecrobot/Utilities/auth.dart';

import '../Export.dart';
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
      backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Company name, Inc",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )),
      body: SingleChildScrollView(
          reverse: true,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 200,
              ),

              // Login text Widget
              Center(
                child: Container(
                  height: 200,
                  width: 400,
                  alignment: Alignment.center,
                  child: Text(
                    "Giriş Yap",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: 60,
                width: 10,
              ),

              // Wrong Password text
              Visibility(
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
              ),

              // Textfields for username and password fields
              Container(
                height: 140,
                width: 530,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _isVisible = false;
                        });
                      },
                      controller: usernameController, // Controller for Username
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          contentPadding: EdgeInsets.all(20)),
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    ),
                    Divider(
                      thickness: 3,
                    ),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _isVisible = false;
                        });
                      },

                      controller: passwordController, // Controller for Password
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Şifre",
                          contentPadding: EdgeInsets.all(20),
                          // Adding the visibility icon to toggle visibility of the password field
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                      obscureText: _isObscure,
                    ),
                  ],
                ),
              ),

              // Submit Button
              Container(
                width: 570,
                height: 70,
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                    color: Colors.pink,
                    child: Text("Giriş", style: TextStyle(color: Colors.white)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      /*if (auth.fetchCredentials(
                          usernameController.text, passwordController.text)) {*/
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => BottomNavBar(title: 'Ana sayfa',)),
                              (Route<dynamic> route) => false,
                        );
                      /*} else {
                        setState(() {
                          _isVisible = true;
                        });
                      }*/
                    }),
              ),

              // Register
              Container(
                  padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: "Hesabınız yok mu? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                                text: " Kaydol!",
                                style: TextStyle(
                                    color: Colors.blue, fontWeight: FontWeight.bold),
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
                      )))
            ],
          )),
    );
  }
}
