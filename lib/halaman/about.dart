import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_web/halaman/about_detail.dart';

class About extends StatefulWidget {
  AboutState createState() => AboutState();
}

class AboutState extends State<About> {
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text("About"),
  //     ),
  //     body: Container(
  //       padding: EdgeInsets.all(5.0),
  //       child: widgetInfo()
  //     ),
  //   );
  // }

  late Future<List> responseInfo;
//info terbaru dari API
  Future<List<dynamic>> getInfo() async {
    var url = Uri.http('192.168.101.175:3000', 'about');
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
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      // Padding(
                      //   padding:
                      //       EdgeInsets.all(8.0), // Tambahkan padding di sini
                      //   child: Image.network(
                      //     snapshot.data[index]['gambar'],
                      //   ),
                      // ),
                      Padding(
                        padding:
                            EdgeInsets.all(8.0), // Tambahkan padding di sini
                        child: Text(
                          snapshot.data[index]['judul'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                onTap: () async => {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutDetail(
                          judul: snapshot.data[index]['judul'],
                          gambar: snapshot.data[index]['gambar'],
                          konten: snapshot.data[index]['konten'],

                          )
                    ),
                   ),
//disini nanti memanggil detail informasi
                },
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

Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: widgetInfo(),
      ),
    );
  }
}
