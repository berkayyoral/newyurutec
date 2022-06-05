import '../Export.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPageState createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {

  String battery_per="10";

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              Text("Cihaz 1")
            ],
          ),
        ),
      ),
    );
  }
}
