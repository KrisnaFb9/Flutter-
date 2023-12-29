import 'package:flutter/material.dart';
import 'package:flutter_web/halaman/informasi_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;



class Informasi extends StatefulWidget {
  InformasiState createState() => InformasiState();
}

class InformasiState extends State<Informasi> {
  Widget widgetInfo() {
    return FutureBuilder(
      future: responseInfo,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.length == 0
              ? Text("Tidak Ada Informasi")
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Card(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          children: [
                            Image.network(
                              snapshot.data[index]['gambar'],
                            ),
                            Text(snapshot.data[index]['judul']),
                          ],
                        ),
                      ),
                      onTap: () async => {
                        //disini nanti memanggil detail informasi
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InformasiDetail(
                              judul: snapshot.data[index]['judul'],
                              konten: snapshot.data[index]['konten'],
                              gambar: snapshot.data[index]['gambar'],
                            ),
                          ),
                        ),
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

  //membuat variabel untuk response info
  late Future<List> responseInfo;

//info terbaru dari API
  Future<List<dynamic>> getInfo() async {
    var url = Uri.http('localhost:3000', 'informasi');
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: widgetInfo(),
      ),
    );
  }
}