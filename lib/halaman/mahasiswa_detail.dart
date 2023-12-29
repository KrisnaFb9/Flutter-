import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MahasiswaDetail extends StatefulWidget {
  const MahasiswaDetail({
    Key? key,
    required this.nim,
    required this.nama,
    required this.alamat,
    required this.refresh,
  }) : super(key: key);
  final int nim;
  final String nama;
  final String alamat;
  final Function refresh;
  MahasiswaDetailState createState() => MahasiswaDetailState();
}

class MahasiswaDetailState extends State<MahasiswaDetail> {
  final TextEditingController nama = TextEditingController();
  final TextEditingController alamat = TextEditingController();
  bool sedangLoading = false;

  @override
  void initState() {
    super.initState();
    nama.text = widget.nama;
    alamat.text = widget.alamat;
  }

  void ubah(BuildContext context) async {
    if (!sedangLoading) {
      setState(() {
        sedangLoading = true;
      });
      var url = Uri.http('192.168.101.175:3000', 'mahasiswa');
      var hasil = await http.put(
        url,
        headers: {"token": "123456", "Content-Type": "application/json"},
        body: convert.jsonEncode({
          "nim": widget.nim,
          "nama": nama.text,
          "alamat": alamat.text,
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
      var url = Uri.http('localhost:3000', 'mahasiswa');
      var hasil = await http.delete(
        url,
        headers: {"token": "123456", "Content-Type": "application/json"},
        body: convert.jsonEncode({
          "nim": widget.nim,
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
        title: Text(widget.nama),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Text("NIM: ${widget.nim}"),
            TextField(controller: nama),
            TextField(controller: alamat),
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
