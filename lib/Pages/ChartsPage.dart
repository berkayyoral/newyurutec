import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:yurutecrobot/Utilities/save_pdf.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';

import '../Constants/Constants.dart';
import '../Export.dart';
import '../Widgets/tarihFormField.dart';
import 'data.dart';
import 'model.dart';

class ChartsPage extends StatefulWidget {
  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  String battery_per = "10";

  late GlobalKey<SfCartesianChartState> _cartesianChartKey;

  late List<User> users;
  @override
  void initState() {
    _cartesianChartKey = GlobalKey();
    super.initState();
    this.users = List.of(allUsers);
  }

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            MaterialButton(
              minWidth: Get.width * 0.8,
              height: Get.height * 0.075,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: kBlue, width: 2)),
              onPressed: () {},
              color: kWhite,
              textColor: kBlue,
              child: Text(
                'Ali Yılmaz',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Başlangıç',
                  style: TextStyle(color: kBlue),
                ),
                Text(
                  'Bitiş',
                  style: TextStyle(color: kBlue),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tarihFormField(),
                tarihFormField(),
                MaterialButton(
                  minWidth: Get.width * 0.1,
                  height: Get.height * 0.075,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {},
                  color: kBlue,
                  textColor: kWhite,
                  child: Text(
                    'Listele',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Tarih - Adım Sayısı",
                  style: TextStyle(fontSize: 20, color: kBlue),
                ),
                IconButton(
                  color: kLightBlue,
                  iconSize: 25,
                  icon: Icon(
                    Icons.local_printshop_outlined,
                    color: kBlue,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Container(
                height: 150,
                child: SfCartesianChart(
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                          color: kBlue,
                          // Bind data source
                          dataSource: <SalesData>[
                            SalesData('30-10-22', 35),
                            SalesData('02-11-22', 28),
                            SalesData('05-11-22', 34),
                            SalesData('10-11-22', 32),
                            SalesData('18-11-22', 40)
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales)
                    ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Tarih - Süre",
                  style: TextStyle(fontSize: 20, color: kBlue),
                ),
                IconButton(
                  color: kLightBlue,
                  iconSize: 25,
                  icon: Icon(
                    Icons.local_printshop_outlined,
                    color: kBlue,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            Container(
              height: 150,
              child: SfCartesianChart(
                key: _cartesianChartKey,
                // Initialize category axis
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                      color: kBlue,
                      // Bind data source
                      dataSource: <SalesData>[
                        SalesData('30-10-22', 35),
                        SalesData('02-11-22', 28),
                        SalesData('05-11-22', 34),
                        SalesData('10-11-22', 32),
                        SalesData('18-11-22', 40)
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ],
              ),
            ),
            Divider(
              endIndent: 30,
              indent: 30,
              color: kBlue,
              height: 5,
              thickness: 2,
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              'GEÇMİŞ ANTRENMANLAR',
              style: TextStyle(color: kBlue, fontSize: 18),
            ),
            SizedBox(height: Get.height * 0.02),
            buildDataTable(),
          ],
        ),
      ),
      backgroundColor: kWhite,
    );
  }

  Widget buildDataTable() {
    final columns = ['Tarih', 'Süre', 'Adım'];
    return DataTable(
        columns: getColumns(columns),
        rows: getRows(users));

  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column,style: TextStyle(color: kBlue),),
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.name, user.lastName, user.sex];
        return DataRow(cells: getCells(cells));
      }).toList();
  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data',style: TextStyle(color: kBlue),))).toList();
  Widget getButton(String title, Function onpress) {
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
          onPressed: () {
            _renderPDF();
          }),
    );
  }

  Future<void> _renderPDF() async {
    final List<int> imageBytes = await _readImageData();
    final PdfBitmap bitmap = PdfBitmap(imageBytes);
    final PdfDocument document = PdfDocument();
    document.pageSettings.size =
        Size(bitmap.width.toDouble(), bitmap.height.toDouble());
    final PdfPage page = document.pages.add();
    final Size pageSize = page.getClientSize();
    page.graphics.drawImage(
        bitmap, Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
    await FileSaveHelper.saveAndLaunchFile(
        document.save(), 'cartesian_chart.pdf');
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      duration: Duration(milliseconds: 2000),
      content: Text('Chart has been exported as PDF document.'),
    ));
  }

  Future<List<int>> _readImageData() async {
    final ui.Image data =
        await _cartesianChartKey.currentState!.toImage(pixelRatio: 3.0);
    final ByteData? bytes =
        await data.toByteData(format: ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
