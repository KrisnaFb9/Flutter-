import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_web/halaman/dokumen.dart';
import 'package:flutter_web/halaman/galeri.dart';
import 'package:flutter_web/halaman/mahasiswa.dart';
import 'package:flutter_web/halaman/about.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert' as convert;
//halaman
import 'halaman/profil.dart';
import 'halaman/info.dart';




final List<String> imgList = [
  'https://img.freepik.com/free-photo/high-angle-piggy-bank-with-academic-cap-coins_23-2148756588.jpg?w=900&t=st=1698378966~exp=1698379566~hmac=19dce2fe3ceefb33c2625b2c4fd321ffd0b6afb20b7261ff712e8a46d1205751',
  'https://img.freepik.com/free-photo/top-view-laptop-with-diploma-globe_23-2148756575.jpg?w=900&t=st=1698379080~exp=1698379680~hmac=67047c7930bfe776080c847c46f27dd4d9a2d202d907858a82e22b2bba141947',
  'https://img.freepik.com/free-photo/multiethnic-group-young-cheerful-students-walking_171337-11709.jpg?w=900&t=st=1698379147~exp=1698379747~hmac=2b58af3442094206c6031f3c459b0dd1243ab147c1271ebc255a73307a7cda68',
  'https://img.freepik.com/free-photo/three-happy-international-graduate-friends-greeting-university-campus-graduation-robes-with-diploma_496169-1360.jpg?w=900&t=st=1698379264~exp=1698379864~hmac=0e167c74c791db982105e8be7ad5c570e973822d7567bebd29b0b4675ea76612',
  'https://img.freepik.com/free-photo/happy-student-with-graduation-hat-diploma-grey_231208-12979.jpg?w=900&t=st=1698379318~exp=1698379918~hmac=cf6bf24405dbf3f53c5346c3f9d5bbd8a632a35d5979994f17703ba1ddc8fb38',
  'https://img.freepik.com/free-photo/low-angle-cheerful-team-students-passed-test-by-preparing-all-together_496169-2336.jpg?w=900&t=st=1698379419~exp=1698380019~hmac=d39ddb45a03e8b8675880fadd7d31f8f3d419e942253725d42844629dc33b884'
];

//menu
Widget widgetMenu(BuildContext context) {
  return new Container(
    child: GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      childAspectRatio: 3 / 2,
      children: [
        GestureDetector(
          onTap: () {
            print("Klik menu profil");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profil(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("/icon/icon-profil.png"),
                  height: 50,
                ),
                Text("Profil")
              ],
            ),
          ),
        ), //tutup GestureDetector Profil

        GestureDetector(
          onTap: () {
            print("Klik menu dokumen");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dokumen(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("/icon/icon-dokumen.png"),
                  height: 50,
                ),
                Text("Dokumen")
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            print("Klik menu info");
             Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Informasi(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("/icon/icon-Informasi.png"),
                  height: 50,
                ),
                Text("Informasi")
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            print("Klik menu gambar");
             Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Galeri(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("/icon/icon-gambar.png"),
                  height: 50,
                ),
                Text("Gambar")
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            print("Klik menu About");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => About(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("/icon/prodi.png"),
                  height: 50,
                ),
                Text("About")
              ],
            ),
          ),
        ),

                GestureDetector(
          onTap: () {
            print("Klik menu Mahasiswa");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mahasiswa(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("/icon/icon-mahasiswa.png"),
                  height: 50,
                ),
                Text("Mahasiswa")
              ],
            ),
          ),
        ),
      ], //tutup GridView.Children
    ), //tutup Container.child
  ); //tutup Container
}

final List<String> info = <String>['Info 1', 'Info 2', 'Info 3'];

var infoTerbaru = Container(
  color: Colors.white,
  child: ListView.separated(
    shrinkWrap: true,
    padding: const EdgeInsets.all(8),
    itemCount: info.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 100,
        color: Colors.purple,
        child: Center(child: Text('List ${info[index]}')),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  ),
);

Future<List<dynamic>> getInfo() async {
  var url = Uri.https('udb.ac.id', 'json/info-akademik');
  var hasil = await http.get(url);
  return convert.jsonDecode(hasil.body);
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF00007F)),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Duta Bangsa Surakarta University'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late Future<List> responseInfo;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    responseInfo = getInfo();
    super.initState();
  }

  Widget widgetInfo() {
    return FutureBuilder(
        future: responseInfo,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.deepPurple,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data[index]['judul'],
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(snapshot.data[index]['tanggal'],
                            style: TextStyle(color: Colors.white)),
                        trailing: IconButton(
                          onPressed: () async => {
                            await launchUrl(
                              Uri.parse(snapshot.data[index]['url']),
                            )
                          },
                          icon: Icon(
                            Icons.link,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Krisna Febrianti"),
              accountEmail: Text("krisnafebss@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/564x/76/e7/d6/76e7d66a0651432b98533948b99ef9e6.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Beranda"),
              onTap: () {
                // Tambahkan logika navigasi Anda di sini
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
              onTap: () {
                print("Klik menu profil");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profil(),
                    ));
              },
            ),

            ListTile(
              leading: Icon(Icons.description),
              title: Text("Dokumen"),
              onTap: () {
                print("Klik menu dokumen");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dokumen()
                    ));
              },
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text("Informasi"),
              onTap: () {
                print("Klik menu informasi");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Informasi(),
                    ));
              },
            ),

            
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Galeri"),
              onTap: () {
                print("Klik menu galeri");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Galeri(),
                    ));
              },
            ),

             ListTile(
              leading: Icon(Icons.school),
              title: Text("About Us"),
              onTap: () {
                print("Klik menu about");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ));
              },
            ),

            ListTile(
              leading: Icon(Icons.group),
              title: Text("Mahasiswa"),
              onTap: () {
                print("Klik menu mahasiswa");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Mahasiswa(),
                    ));
              },
            ),
            // Tambahkan item-menu lainnya sesuai kebutuhan
          ],
        ),
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                ),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                              child: Image.network(item,
                                  fit: BoxFit.cover, width: 1000)),
                        ))
                    .toList(),
              ),
// menu,
              widgetMenu(context),

              // infoTerbaru,
              widgetInfo(),

              //   '$_counter',
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}