import '../Export.dart';

class AntrenmanPage extends StatefulWidget {
  @override
  _AntrenmanPageState createState() => _AntrenmanPageState();
}

class _AntrenmanPageState extends State<AntrenmanPage> {

  String battery_per="10";

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
                  children: [
                    Row(

                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.teal,
                                    radius: 50,
                                    child: Text(
                                      'Resim',
                                      style: TextStyle(fontSize: 25, color: Colors.white),
                                    ), //Text
                                  ),
                                ),
                                SizedBox(width: 100,),
                                Text('Kullanıcı Adı'),
                              ],
                            ),
                            Text(' Talimatlar\n-\n-\n-'),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        SizedBox(
                          height: 30,
                        ),

                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                              child: const Center(
                                  child: Text(
                                    '0:00:00',
                                    style: TextStyle(color: Colors.red),
                                  )),
                            ),
                            const SizedBox(
                              child: Text('Zaman'),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                              child: const Center(
                                  child: Text(
                                    '00000',
                                    style: TextStyle(color: Colors.red),
                                  )),
                            ),
                            const SizedBox(
                              child: Text('Adım Sayısı'),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.settings,size: 40, color: Colors.teal,),),
                            const Text('Ayarlama\n Sayfası\nKısayolu', textAlign: TextAlign.center,),
                          ],
                        ),
                        Column(
                          children: [IconButton(onPressed: (){}, icon: const Icon(Icons.save,size: 40,color: Colors.teal),),
                            const Text('Antrenmanı\n Kaydet', textAlign: TextAlign.center,),],
                        ),
                        Column(
                          children: [IconButton(onPressed: (){}, icon: const Icon(Icons.restart_alt,size: 40,color: Colors.teal),),
                            const Text('Sıfırlama\n Komutu', textAlign: TextAlign.center,),],
                        ),
                      ],),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.block_flipped,size: 40,color: Colors.teal)),
                            Text('Durdur-Başlat', textAlign: TextAlign.center,)
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.do_disturb_on_outlined,size: 40,color: Colors.teal)),
                            Text('Hız Azaltma', textAlign: TextAlign.center,)
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.control_point_outlined,size: 40,color: Colors.teal)),
                            Text('Hız Artırma', textAlign: TextAlign.center,)
                          ],
                        )
                      ],
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
