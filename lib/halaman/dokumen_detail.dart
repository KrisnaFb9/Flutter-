import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DokumenDetail extends StatefulWidget {
  const DokumenDetail({
    Key? key,
    required this.id,
    required this.judul,
    required this.konten,
    required this.refresh,
  }) : super(key: key);
  final int id;
  final String judul;
  final String konten;
  final Function refresh;
  DokumenDetailState createState() => DokumenDetailState();
}

class DokumenDetailState extends State<DokumenDetail> {
  final TextEditingController judul = TextEditingController();
  final TextEditingController konten = TextEditingController();
  bool sedangLoading = false;

  @override
  void initState() {
    super.initState();
    judul.text = widget.judul;
    konten.text = widget.konten;
  }

  void ubah(BuildContext context) async {
    if (!sedangLoading) {
      setState(() {
        sedangLoading = true;
      });
      var url = Uri.http('192.168.101.175:3000', 'dokumen');
      var hasil = await http.put(
        url,
        headers: {"token": "123456", "Content-Type": "application/json"},
        body: convert.jsonEncode({
          "id": widget.id,
          "judul": judul.text,
          "konten": konten.text,
        }),
      );

      var json = convert.jsonDecode(hasil.body);
      // Menampilkan pesan
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

  void hapus(BuildContext context) async {
    if (!sedangLoading) {
      setState(() {
        sedangLoading = true;
      });
      var url = Uri.http('localhost:3000', 'dokumen');
      var hasil = await http.delete(
        url,
        headers: {"token": "123456", "Content-Type": "application/json"},
        body: convert.jsonEncode({
          "id": widget.id,
        }),
      );
      var json = convert.jsonDecode(hasil.body);
      // Menampilkan pesan
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.judul),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Text("ID: ${widget.id}"),
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
              onPressed: () => ubah(context),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: sedangLoading
                  ? CircularProgressIndicator()
                  : Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
              onPressed: () => hapus(context),
            )
          ],
        ),
      ),
    );
  }
}
