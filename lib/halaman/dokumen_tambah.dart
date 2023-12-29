import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DokumenTambah extends StatefulWidget {
  const DokumenTambah({Key? key, required this.refresh}) : super(key: key);
  final Function refresh;
  DokumenTambahState createState() => DokumenTambahState();
}

class DokumenTambahState extends State<DokumenTambah> {
  final TextEditingController id = TextEditingController();
  final TextEditingController judul = TextEditingController();
  final TextEditingController konten = TextEditingController();
  bool sedangLoading = false;
  void simpan(BuildContext context) async {
    if (!sedangLoading) {
      setState(() {
        sedangLoading = true;
      });

      var url = Uri.http('192.168.101.175:3000', 'dokumen');
      var hasil = await http.post(
        url,
        headers: {"token": "123456", "Content-Type": "application/json"},
        body: convert.jsonEncode({
          "id": id.text,
          "judul": judul.text,
          "konten": konten.text,
        }),
      );
      var json = convert.jsonDecode(hasil.body);
//tampilkan pesan
      String pesan = json['pesan'];
      var snackBar = SnackBar(
        content: Text(pesan),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        sedangLoading = false;
      });
      widget.refresh();
      Navigator.pop(context);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Dokumen"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            TextField(controller: id),
            TextField(controller: judul),
            TextField(controller: konten),
            SizedBox(height: 10),
            ElevatedButton(
              child: sedangLoading
                  ? CircularProgressIndicator()
                  : Icon(
                      Icons.save,
                      color: Colors.blue,
                    ),
              onPressed: () => simpan(context),
            )
          ],
        ),
      ),
    );
  }
}
