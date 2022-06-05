import 'package:yurutecrobot/Export.dart';

class DevicesWidget extends StatefulWidget {
  @override
  _DevicesWidgetState createState() => _DevicesWidgetState();
}

class _DevicesWidgetState extends State<DevicesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Card(
        child: Column(
          children: [
            Text("Deneme"),
          ],
        ),
      ),
    );
  }
}
