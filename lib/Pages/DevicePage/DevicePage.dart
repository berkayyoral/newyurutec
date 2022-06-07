import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:yurutecrobot/Controller/getController.dart';
import 'package:yurutecrobot/Pages/AntrenmanPage.dart';
import 'package:yurutecrobot/Pages/SettingPage.dart';

import '../../Export.dart';

class DeviceScreen extends StatefulWidget {
  DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  getController abc = Get.put(getController());
  var a = 0;

  List denemeRead = [];
  
  List sample = ['a','b',2,3];

  var crc = 0;

  void crcHesaplama() {}

  List<int> frame1() {
    return [
      81, //eşleşme byte
      84,
      82,
      0, //durum byte
      1, //kalibrasyon byte
      abc.countskalca_maks,
      abc.countsdiz_maks,
      abc.countsdiz_min,
      abc.countsdestek1,
      abc.countsdestek2,
      abc.countskalca_min,
      abc.countshiz,
      //abc.hiz2,
      //abc.hiz3,
    ];
  }

  List<int> frame2() {
    return [
      81,
      84,
      82,
      1,
      abc.countshiz,
      // abc.hiz2,
      // abc.hiz3
    ];
  }

  void write1() async {
    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((character) {
        if (character.uuid.toString() ==
            '00006e41-0000-1000-8000-00805f9b34fb') {
          //buraya bi bekleme koymalıyız sayfa açılır açılmaz yollanıyor (ya da bekletmeyiz sayfaya girdiği gibi yollar),
          character.write(frame1());
        }
      });
    });
  }

  void write2() async {
    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((character) {
        if (character.uuid.toString() ==
            '00006e41-0000-1000-8000-00805f9b34fb') {
          //buraya bi bekleme koymalıyız sayfa açılır açılmaz yollanıyor (ya da bekletmeyiz sayfaya girdiği gibi yollar),
          character.write(frame2());
        }
      });
    });
  }

   void read1() async {
    List<BluetoothService> services = await widget.device.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((character) {
        if (character.uuid.toString() ==
            '00006e41-0000-1000-8000-00805f9b34fb') {
          character.read().then((value) {
            print('value is $value');
            denemeRead = value;
          });
        }
      });
    });
  }

  //read
  @override
  Widget build(BuildContext context) {
    read1();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("QTR TECH"),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: widget.device.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) {
              VoidCallback? onPressed;
              String text;
              switch (snapshot.data) {
                case BluetoothDeviceState.connected:
                  onPressed = () => widget.device.disconnect();
                  text = 'DISCONNECT';
                  break;
                case BluetoothDeviceState.disconnected:
                  onPressed = () => widget.device.connect();
                  text = 'CONNECT';
                  break;
                default:
                  onPressed = null;
                  text = snapshot.data.toString().substring(21).toUpperCase();
                  break;
              }
              return FlatButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button
                        ?.copyWith(color: Colors.white),
                  ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: widget.device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) => ListTile(
                leading: (snapshot.data == BluetoothDeviceState.connected)
                    ? const Icon(Icons.bluetooth_connected)
                    : const Icon(Icons.bluetooth_disabled),
                title: Text(
                    'Device is ${snapshot.data.toString().split('.')[1]}.'),
                subtitle: Text('${widget.device.id}'),
                trailing: StreamBuilder<bool>(
                  stream: widget.device.isDiscoveringServices,
                  initialData: false,
                  builder: (c, snapshot) => IndexedStack(
                    index: snapshot.data! ? 1 : 0,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => widget.device.discoverServices(),
                      ),
                      const IconButton(
                        icon: SizedBox(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.grey),
                          ),
                          width: 18.0,
                          height: 18.0,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
            ),
            /*StreamBuilder<BluetoothService>(builder: (context, snapshot) {
              return Column(
                children: [_serviceAlma(snapshot.data!)],
              );
            }),*/
            IconButton(
                onPressed: () {
                  if (a == 0) {
                    write1();
                    setState(() {
                      a += 1;
                    });
                    print(a);
                  } else {
                    write2();
                    setState(() {
                      a = 0;
                      print(a);
                    });
                  }
                },
                icon: Icon(Icons.upload)),
            IconButton(
                onPressed: () {
                  setState((){
                    read1();
                  });
                },
                icon: Icon(Icons.download)),
            Text(denemeRead == null ? 'olmadı' : denemeRead.toString()
            ),
          ],
        ),
      ),
    );
  }
}
