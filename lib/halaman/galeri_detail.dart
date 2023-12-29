import 'package:flutter/material.dart';

class GaleriDetail extends StatefulWidget {
  const GaleriDetail(
      {Key? key,
      required this.judul,
      required this.gambar})
      : super(key: key);
  final String judul;
  final String gambar;
  GaleriDetailState createState() => GaleriDetailState();
}

class GaleriDetailState extends State<GaleriDetail> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.judul),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
            children: [Image.network(widget.gambar), Text(widget.judul)]),
      ),
    );
  }
}
