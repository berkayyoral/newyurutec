

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:yurutecrobot/Controller/getController.dart';
import 'package:yurutecrobot/Pages/AntrenmanPage.dart';
import 'package:yurutecrobot/Pages/SettingPage.dart';

import '../../Export.dart';


class DeviceScreen extends StatelessWidget {
  DeviceScreen(
      {Key? key, required this.device})
      : super(key: key);


  getController abc = Get.put(getController());
  final BluetoothDevice device;
  List<int> _writeFrame() {
    //  final a = double.parse(_val.text).toInt();
    //final kc = int.parse(_val.text);
    return [
      81,
      84,
      82,
      //kc,

      12,
    ];
  }

  List<int> frameOrnek(){
    return [
      81,
      84,
      82,
      0,
      abc.countsdiz_maks,
      abc.countsdiz_min,
      abc.countsdestek1,
      abc.countsdestek2,
      abc.countskalca_maks,
      abc.countskalca_min,
      /*diz_maks.count.toInt(),
    diz_min.count.toInt(),
    destek1.count.toInt(),
    destek2.count.toInt(),*/
    ];
  }



  void writeChar() async {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((character) {
        if (character.uuid.toString() == '00006e41-0000-1000-8000-00805f9b34fb') {
          //buraya bi bekleme koymalıyız sayfa açılır açılmaz yollanıyor (ya da bekletmeyiz sayfaya girdiği gibi yollar),
          character.write(frameOrnek());
        }
      });
    });
  }

  //read


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("QTR TECH"),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: device.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) {
              VoidCallback? onPressed;
              String text;
              switch (snapshot.data) {
                case BluetoothDeviceState.connected:
                  onPressed = () => device.disconnect();
                  text = 'DISCONNECT';
                  break;
                case BluetoothDeviceState.disconnected:
                  onPressed = () => device.connect();
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
            //örnek data yollama textfield ile
            /*TextField(
              controller: _val,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (kl) {
                kl = _val.text;
                print('${_writeFrame().toList()}');
              },
            ),*/
            StreamBuilder<BluetoothDeviceState>(
              stream: device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) => ListTile(
                leading: (snapshot.data == BluetoothDeviceState.connected)
                    ? const Icon(Icons.bluetooth_connected)
                    : const Icon(Icons.bluetooth_disabled),
                title: Text(
                    'Device is ${snapshot.data.toString().split('.')[1]}.'),
                subtitle: Text('${device.id}'),
                trailing: StreamBuilder<bool>(
                  stream: device.isDiscoveringServices,
                  initialData: false,
                  builder: (c, snapshot) => IndexedStack(
                    index: snapshot.data! ? 1 : 0,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => device.discoverServices(),
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
                onPressed: (){
                 writeChar();},
                icon: Icon(Icons.upload)),
           // Text('${writeChar()}'),
          ],
        ),
      ),
    );
  }
}
