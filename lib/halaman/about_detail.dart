import 'package:flutter/material.dart';

class AboutDetail extends StatefulWidget {
  const AboutDetail(
      {Key? key,
      required this.judul,
      required this.gambar,
      required this.konten,})
      : super(key: key);
  final String judul;
  final String gambar;
  final String konten;
  AboutDetailState createState() => AboutDetailState();
}
class AboutDetailState extends State<AboutDetail> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.judul),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
            children: [Image.network(widget.gambar), Text(widget.konten)]),
      ),
    );
  }
} 
