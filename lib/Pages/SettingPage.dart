import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:yurutecrobot/Controller/getController.dart';

import '../Export.dart';

class AyarlamaSayfasi extends StatefulWidget {
  AyarlamaSayfasi({
    Key? key,
  }) : super(key: key);

  @override
  State<AyarlamaSayfasi> createState() => _AyarlamaSayfasiState();
}

class _AyarlamaSayfasiState extends State<AyarlamaSayfasi> {

  getController controllerkalca_maks = Get.put(getController());
  getController controllerkalca_min = Get.put(getController());
  getController controllerdiz_max = Get.put(getController());
  getController controllerdiz_min = Get.put(getController());
  getController controllerdestek1 = Get.put(getController());
  getController controllerdestek2 = Get.put(getController());

  getController kalca_maks = getController();
  getController diz_maks = getController();
  getController diz_min = getController();
  getController kalca_min = getController();
  getController destek1 = getController();
  getController destek2 = getController();

  String battery_per = "10";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
          ),
          title: Text("QTR TECH"),
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
          backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Açı Ayarlama",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.teal),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Kalça Maksimum"),
                      Obx(
                        () => Steppers(
                          controller: kalca_maks,
                          text:
                              controllerkalca_maks.countskalca_maks.toString(),
                          onCustomPlusPressed: () {
                            controllerkalca_maks.incrementkalca_maks();
                          },
                          onCustomMinusPressed: () {
                            controllerkalca_maks.decrementkalca_maks();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Diz Maksimum"),
                      Obx(
                        () => Steppers(
                          controller: diz_maks,
                          text: controllerdiz_max.countsdiz_maks.toString(),
                          onCustomPlusPressed: () {
                            controllerdiz_max.incremendiz_maks();
                          },
                          onCustomMinusPressed: () {
                            controllerdiz_max.decrementdiz_maks();
                          },
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/walk.png",
                    width: MediaQuery.of(context).size.width * 0.42,
                    color: Colors.teal,
                  ),
                  Column(
                    children: [
                      Text("Kalça Minimum"),
                      Obx(
                        () => Steppers(
                          controller: kalca_min,
                          text: controllerkalca_min.countskalca_min.toString(),
                          onCustomPlusPressed: () {
                            controllerkalca_min.incrementkalca_min();
                          },
                          onCustomMinusPressed: () {
                            controllerkalca_min.decrementkalca_min();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Diz Minimum"),
                      Obx(
                        () => Steppers(
                          controller: diz_min,
                          text: controllerdiz_min.countsdiz_min.toString(),
                          onCustomPlusPressed: () {
                            controllerdiz_min.incrementdiz_min();
                          },
                          onCustomMinusPressed: () {
                            controllerdiz_min.decrementdiz_min();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Destek Kuvveti"),
                        Obx(
                          () => Steppers(
                            controller: destek1,
                            scale: 1,
                            text: controllerdestek1.countsdestek1.toString(),
                            onCustomPlusPressed: () {
                              controllerdestek1.incrementdestek1();
                            },
                            onCustomMinusPressed: () {
                              controllerdestek1.decrementdestek1();
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Destek Kuvveti"),
                        Obx(
                          () => Steppers(
                            controller: destek2,
                            scale: 1,
                            text: controllerdestek2.countsdestek2.toString(),
                            onCustomPlusPressed: () {
                              controllerdestek2.incrementdestek2();
                            },
                            onCustomMinusPressed: () {
                              controllerdestek2.decrementdestek2();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getButtons(title: "Kaydet", onpress: () {}),
                  SizedBox(
                    width: 20,
                  ),
                  getButtons(title: "Sağ Bacak", onpress: () {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getButtons(title: "Sol Bacak", onpress: () {}),
                  SizedBox(
                    width: 20,
                  ),
                  getButtons(title: "Ayarları Sıfırla", onpress: () {
                    print('a');
                    setState(() {
                      controllerkalca_maks.kalca_maks.value = 0;
                      controllerkalca_min.kalca_min.value = 0;
                      controllerdestek1.destek1.value = 0;
                      controllerdestek2.destek2.value = 0;
                      controllerdiz_max.diz_max.value = 0;
                      controllerdiz_min.diz_min.value = 0;
                    });
                  }),
                ],
              ),
              getButtons(title: "Aynı Ayarları \n Diğer Bacağa Uygula", onpress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class getButtons extends StatelessWidget {
   getButtons({
    Key? key,
    required this.title,
    required this.onpress,
  }) : super(key: key);

  final String title;
   final VoidCallback onpress;

   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 30,
            child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        style: TextButton.styleFrom(
          primary: Colors.teal,
          onSurface: Colors.yellow,
          side: BorderSide(color: Colors.teal, width: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
        onPressed: onpress,
      ),
    );
  }
}

class Steppers extends StatefulWidget {
  getController controller = Get.put(getController());
  double scale;

  final VoidCallback onCustomPlusPressed;
  final VoidCallback onCustomMinusPressed;
  String text;
  Steppers(
      {this.scale = 1.5,
      required this.controller,
      required this.onCustomPlusPressed,
      required this.onCustomMinusPressed,
      required this.text});

  @override
  State<Steppers> createState() => _SteppersState();
}

class _SteppersState extends State<Steppers> {
  getController controller = Get.put(getController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GestureDetector(
            child: Image.asset("assets/images/triangle.png",
                scale: widget.scale, color: Colors.teal),
            onTap: widget.onCustomPlusPressed),
        ShowUpAnimation(
            delayStart: Duration(seconds: 1),
            animationDuration: Duration(seconds: 1),
            curve: Curves.bounceIn,
            direction: Direction.vertical,
            offset: 0.5,
            child: Text(
              widget.text,
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
            )),
        GestureDetector(
            child: RotatedBox(
                quarterTurns: 2,
                child: Image.asset(
                  "assets/images/triangle.png",
                  scale: widget.scale,
                  color: Colors.teal,
                )),
            onTap: widget.onCustomMinusPressed),
      ],
    );
  }
}
