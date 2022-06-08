import 'package:get/get.dart';

import '../../Constants/Constants.dart';
import '../../Export.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: Get.width * 0.2,
              ),
              Container(
                height: Get.height * 0.2,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/onboardtop.png'),
                        fit: BoxFit.fill)),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.1,
          ),
          Container(
            height: Get.height * 0.22,
            width: Get.width * 0.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: Get.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: MaterialButton(
                  minWidth: Get.width * 0.35,
                  height: Get.height * 0.075,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => SignupPage()));
                  },
                  color: kBlue,
                  textColor: kWhite,
                  child: Text(
                    'Kayıt Ol',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: MaterialButton(
                  minWidth: Get.width * 0.35,
                  height: Get.height * 0.075,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(color: kBlue)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  color: kWhite,
                  textColor: kBlue,
                  child: Text(
                    'Giriş Yap',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.105,
          ),
          Container(
            height: Get.height * 0.2,
            width: Get.width * 1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/onboardbottom.png'),
                    fit: BoxFit.fill)),
          )
        ],
      ),
    );
  }
}
