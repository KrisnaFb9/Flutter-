import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
// import 'package:flutter_web/halaman/galeri_detail.dart';
class Galeri extends StatefulWidget {
  GaleriState createState() => GaleriState();
}

class GaleriState extends State<Galeri> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeri"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: widgetInfo()
      ),
    );
  }

//membuat variabel untuk response info
  late Future<List> responseInfo;
//info terbaru dari API
  Future<List<dynamic>> getInfo() async {
    var url = Uri.http('192.168.101.175:3000', 'galeri');
    var hasil = await http.get(
      url,
      headers: {"token": "123456"},
    );
    var json = convert.jsonDecode(hasil.body);
    return json['data'];
  }

//memanggil future/fungsi getInfo
//saat inisialisasi awal
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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Menentukan jumlah kolom dalam grid
          ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Card(
                  margin: EdgeInsets.only(bottom: 2.0),
                  child: Column(
                    children: [
                      Image.network(
                        snapshot.data[index]['gambar'],
                      ),
                      Text(snapshot.data[index]['judul']),
                    ],
                  ),
                ),
//                 onTap: () async => {

//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => GaleriDetail(
//                           judul: snapshot.data[index]['judul'],
//                           gambar: snapshot.data[index]['gambar']),
//                     ),
//                   ),
// //disini nanti memanggil detail informasi
//                 },
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  
}



