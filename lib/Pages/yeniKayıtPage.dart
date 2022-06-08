
import 'package:yurutecrobot/Constants/Constants.dart';
import 'package:yurutecrobot/Pages/BottomNavBar/BottomNavBar.dart';

import '../export.dart';

class yeniKayitPage extends StatelessWidget {
   yeniKayitPage({Key? key}) : super(key: key);
  String battery_per = "10";
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
      body: Column(),
    );
  }
}
