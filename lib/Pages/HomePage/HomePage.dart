import 'package:flutter_blue/flutter_blue.dart';

import '../../Export.dart';
import '../DevicePage/DevicePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String battery_per="10";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothState>(
        stream: FlutterBlue.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot) {
          final state = snapshot.data;
          if (state == BluetoothState.on) {
            return Scaffold(
              appBar: AppBar(centerTitle: true,
                  title: Text("QTR TECH"),actions: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,10,0),
                      child: Stack(alignment: Alignment.center,children: [
                        Image.asset("assets/images/battery-level.png",scale: 1.5,color: Colors.white,),
                        Text(battery_per)
                      ],),
                    )
                  ],
                  backgroundColor: Colors.teal),
              body: RefreshIndicator(
                onRefresh: () =>
                    FlutterBlue.instance.startScan(timeout: const Duration(seconds: 4)),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      StreamBuilder<List<BluetoothDevice>>(
                        stream: Stream.periodic(const Duration(seconds: 2))
                            .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                        initialData: [],
                        builder: (c, snapshot) => Column(
                          children: snapshot.data!
                              .map((d) => Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text('Bağlı Cihaz',style: TextStyle(fontSize: 18)),
                                    Text(d.name),
                                  ],
                                ),
                                StreamBuilder<BluetoothDeviceState>(
                                  stream: d.state,
                                  initialData: BluetoothDeviceState.disconnected,
                                  builder: (c, snapshot) {
                                    if (snapshot.data ==
                                        BluetoothDeviceState.connected) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            primary: Colors.teal,
                                            onSurface: Colors.yellow,
                                            side: BorderSide(color: Colors.teal, width: 2),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(25))),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                            child: Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            height: 30,
                                            child: Text('Aç',  textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500)),
                                          ),
                                          ),
                                          onPressed: () => Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DeviceScreen(device: d))),
                                        ),
                                      );
                                    }
                                    return Text(snapshot.data.toString());
                                  },
                                ),
                              ],
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
                              onTap: () => Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
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
                      backgroundColor: Colors.red,
                    );
                  } else {
                    return FloatingActionButton(
                        child: const Icon(Icons.search),
                        onPressed: () => FlutterBlue.instance
                            .startScan(timeout: const Duration(seconds: 4)));
                  }
                },
              ),
            );
          }
          return Center(child: ElevatedButton(onPressed: (){}, child: Text('Bluetooth açınız')));
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
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    } else {
      return Text(result.device.id.toString());
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
a

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('(Cihaz 1)',style: TextStyle(fontSize: 18),),
                _buildTitle(context),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed: (result.advertisementData.connectable) ? onTap : null, child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  child: Text('Bağlan',  textAlign: TextAlign.center,
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
                ),),
            )
          ],
        ),
      ),
    );
  }
}
