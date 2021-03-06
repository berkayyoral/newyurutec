import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

import '../../Constants/Constants.dart';
import '../../Export.dart';
import '../DevicePage/DevicePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String battery_per = "10";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothState>(
        stream: FlutterBlue.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot) {
          final state = snapshot.data;
          if (state == BluetoothState.on) {
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
              body: RefreshIndicator(
                onRefresh: () => FlutterBlue.instance
                    .startScan(timeout: const Duration(seconds: 4)),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: Get.height*0.03,),
                      Text(
                        'Yakındaki Cihazlar',
                        style: TextStyle(color: kBlue, fontSize: 22),
                      ),
                      StreamBuilder<List<BluetoothDevice>>(
                        stream: Stream.periodic(const Duration(seconds: 2))
                            .asyncMap(
                                (_) => FlutterBlue.instance.connectedDevices),
                        initialData: [],
                        builder: (c, snapshot) => Column(
                          children: snapshot.data!
                              .map((d) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 10),
                                child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(color: kBlue, width: 2),
                            ),
                            color: kWhite,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text('Bağlı Cihaz',
                                                  style: TextStyle(fontSize: 18,color: kBlue)),
                                              Text(d.name,style: TextStyle(color: kBlue),),
                                            ],
                                          ),
                                          StreamBuilder<BluetoothDeviceState>(
                                            stream: d.state,
                                            initialData:
                                                BluetoothDeviceState.disconnected,
                                            builder: (c, snapshot) {
                                              if (snapshot.data ==
                                                  BluetoothDeviceState
                                                      .connected) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextButton(

                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0,
                                                              right: 10.0),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 100,
                                                        height: 30,
                                                        child: Text('Aç',
                                                            textAlign:
                                                                TextAlign.center,
                                                            style: TextStyle(
                                                                color:
                                                                    kBlue,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ),
                                                    onPressed: () => Navigator.of(
                                                            context)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) =>
                                                                DeviceScreen(
                                                                    device: d))),
                                                  ),
                                                );
                                              }
                                              return Text(
                                                  snapshot.data.toString());
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                              ))
                              .toList(),
                        ),
                      ),
                      StreamBuilder<List<ScanResult>>(
                        stream: FlutterBlue.instance.scanResults,
                        initialData: [],
                        builder: (c, snapshot) => Column(
                          children: snapshot.data!
                              .map(
                                (r) => ScanResultTile(
                                  result: r,
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    r.device.connect();
                                    return DeviceScreen(device: r.device);
                                  })),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: StreamBuilder<bool>(
                stream: FlutterBlue.instance.isScanning,
                initialData: false,
                builder: (c, snapshot) {
                  if (snapshot.data!) {
                    return FloatingActionButton(
                      child: const Icon(Icons.stop),
                      onPressed: () => FlutterBlue.instance.stopScan(),
                      backgroundColor: Colors.redAccent,
                    );
                  } else {
                    return FloatingActionButton(
                        backgroundColor: kLightBlue,
                        child: Icon(
                          Icons.search,
                          color: kBlue,
                        ),
                        onPressed: () => FlutterBlue.instance
                            .startScan(timeout: const Duration(seconds: 4)));
                  }
                },
              ),
            );
          }
          return Center(
              child: ElevatedButton(
                  onPressed: () {}, child: Text('Bluetooth açınız')));
        });
  }
}

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({Key? key, required this.result, this.onTap})
      : super(key: key);

  final ScanResult result;
  final VoidCallback? onTap;

  Widget _buildTitle(BuildContext context) {
    if (result.device.name.length > 0) {
      return Column(
        children: <Widget>[
          Text(
            result.device.name,
            style: TextStyle(color: kBlue),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    } else {
      return Text(
        result.device.id.toString(),
        style: TextStyle(color: kBlue),
      );
    }
  }

  /*String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  String getNiceManufacturerData(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(
          '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  String getNiceServiceData(Map<String, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add('${id.toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }*/

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 10),
      child: Card(
        color: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: kBlue, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '(Cihaz 1)',
                  style: TextStyle(fontSize: 18, color: kBlue),
                ),
                _buildTitle(context),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed:
                    (result.advertisementData.connectable) ? onTap : null,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 30,
                    child: Text('Bağlan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.teal,
                  onSurface: Colors.yellow,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
