import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:yurutecrobot/Utilities/save_pdf.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';

import '../Export.dart';

class ChartsPage extends StatefulWidget {
  @override
  _ChartsPageState createState() => _ChartsPageState();
}



class _ChartsPageState extends State<ChartsPage> {

  String battery_per="10";


  late GlobalKey<SfCartesianChartState> _cartesianChartKey;

  @override
  void initState() {
    _cartesianChartKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(centerTitle: true,
            leading: IconButton(icon: Icon(Icons.logout), onPressed: () {  },),
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
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Tarih - Adım Sayısı", style: TextStyle(fontSize: 20, color: Colors.teal),),
                    getButton("Yazdır - PDF Olarak Kaydet", () {})
                  ],
                ),
                Container(
                  height: 150,
                    child: SfCartesianChart(
                      // Initialize category axis
                        primaryXAxis: CategoryAxis(),

                        series: <LineSeries<SalesData, String>>[
                          LineSeries<SalesData, String>(
                              color: Colors.teal,
                            // Bind data source
                              dataSource:  <SalesData>[
                                SalesData('30-10-22', 35),
                                SalesData('02-11-22', 28),
                                SalesData('05-11-22', 34),
                                SalesData('10-11-22', 32),
                                SalesData('18-11-22', 40)
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales
                          )
                        ]
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Tarih - Süre", style: TextStyle(fontSize: 20, color: Colors.teal),),
                    getButton("Yazdır - PDF Olarak Kaydet", () {

                    }
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
                            color: Colors.teal,
                            // Bind data source
                              dataSource:  <SalesData>[
                                SalesData('30-10-22', 35),
                                SalesData('02-11-22', 28),
                                SalesData('05-11-22', 34),
                                SalesData('10-11-22', 32),
                                SalesData('18-11-22', 40)
                              ],
                              xValueMapper: (SalesData sales, _) => sales.year,
                              yValueMapper: (SalesData sales, _) => sales.sales
                          )
                        ]
                    )
                ),
              ],
            )
        )
    );
  }

  Widget getButton(String title, Function onpress){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            alignment: Alignment.center,
            width: 100,
            height: 30,
            child: Text(title,  textAlign: TextAlign.center,
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
        }
      ),
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