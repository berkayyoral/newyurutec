import 'package:yurutecrobot/Controller/getController.dart';
import 'package:get/get.dart';
import '../Constants/Constants.dart';
import '../Export.dart';

class AntrenmanPage extends StatefulWidget {
  @override
  _AntrenmanPageState createState() => _AntrenmanPageState();
}

class _AntrenmanPageState extends State<AntrenmanPage> {
  String battery_per = "10";
  getController hiz = getController();
  getController controllerhiz = Get.put(getController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            CircleAvatar(
              radius: 52,
              backgroundColor: kBlue,
              child: CircleAvatar(
                  backgroundColor: kWhite,
                  radius: 50,
                  child: Image.asset('assets/images/kid.png')),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              'Ali Yılmaz',
              style: TextStyle(color: kBlue, fontSize: 22),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Divider(
              endIndent: 30,
              indent: 30,
              color: kBlue,
              height: 5,
              thickness: 2,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: kBlue,
                      size: 58,
                    ),
                    Text(
                      'SÜRE',
                      style: TextStyle(color: kBlue, fontSize: 18),
                    ),
                    Text(
                      '01:56',
                      style: TextStyle(color: kBlue, fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.directions_run, color: kBlue, size: 58),
                    Text(
                      'ADIM',
                      style: TextStyle(color: kBlue, fontSize: 18),
                    ),
                    Text(
                      '50',
                      style: TextStyle(color: kBlue, fontSize: 25),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.do_disturb_on_outlined,
                          color: kRed,
                          size: 52,
                        )),
                    Text(
                      'Azalt',
                      style: TextStyle(color: kRed),
                    )
                  ],
                ),
                Icon(
                  Icons.speed,
                  color: kBlue,
                  size: 44,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.control_point_outlined,
                      color: kGreen,
                    ))
              ],
            ),
            Divider(
              endIndent: 30,
              indent: 30,
              color: kBlue,
              height: 5,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        size: 40,
                        color: Colors.teal,
                      ),
                    ),
                    const Text(
                      'Ayarlama\n Sayfası\nKısayolu',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.save, size: 40, color: Colors.teal),
                    ),
                    const Text(
                      'Antrenmanı\n Kaydet',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.restart_alt,
                          size: 40, color: Colors.teal),
                    ),
                    const Text(
                      'Sıfırlama\n Komutu',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.block_flipped,
                            size: 40, color: Colors.teal)),
                    Text(
                      'Durdur-Başlat',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          if (controllerhiz.countshiz > 0) {
                            setState(() {
                              controllerhiz.decrementhiz();
                              print(controllerhiz.countshiz);
                            });
                          }
                        },
                        icon: Icon(Icons.do_disturb_on_outlined,
                            size: 40, color: Colors.teal)),
                    Text(
                      'Hız Azaltma',
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            controllerhiz.incrementhiz();
                            print(controllerhiz.countshiz);
                          });
                        },
                        icon: Icon(Icons.control_point_outlined,
                            size: 40, color: Colors.teal)),
                    Text(
                      'Hız Artırma',
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
