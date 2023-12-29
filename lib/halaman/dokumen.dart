import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter_web/halaman/dokumen_detail.dart';
import 'package:flutter_web/halaman/dokumen_tambah.dart';


class Dokumen extends StatefulWidget {
  DokumenState createState() => DokumenState();
}

class DokumenState extends State<Dokumen> {
  late Future<List> responseInfo;
  Future<List<dynamic>> getDokumen() async {
    var url = Uri.http('192.168.101.175:3000', 'Dokumen');
    var hasil = await http.get(
      url,
      headers: {"token": "123456"},
      );

      var json = convert.jsonDecode(hasil.body);
      return json['data'];
}
@override
void initState() {
  super.initState();
  responseInfo = getDokumen();
}
void refreshData() {
  setState(() {
    responseInfo = getDokumen();
    });
    }

    Widget widgetInfo() {
      return FutureBuilder(
        future: responseInfo,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.length == 0
            ? Center(child: Text("Data Kosong"))
            : ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: Card(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: ListTile(
                      title: Text(snapshot.data[index]['judul'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        )),
                        subtitle:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Judul: ${snapshot.data[index]['judul']}"),

                          ] 
                          ),
                          ),
                          ),
                          
                          onTap: () async => {
                            //disini nanti memanggil detail Dokumen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DokumenDetail(
                                  id: snapshot.data[index]['id'],
                                  judul: snapshot.data[index]['judul'],
                                  konten: snapshot.data[index]['konten'],
                                  refresh: refreshData,
                                  ),
                                  ),
                                  )
                                  
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
                                            title: Text("Dokumen"),
                                            ),
                                            floatingActionButton: FloatingActionButton(
                                              backgroundColor: Colors.blue,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => DokumenTambah(refresh: refreshData),
                                                      ),
                                                      );
                                                      },
                                                      ),
                                                      body: Container(
                                                        padding: EdgeInsets.all(5.0),
                                                        child: widgetInfo(),
                                                        ),

                        
                                                        );
}
}

