import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profil extends StatefulWidget {
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                "Myprofil",
                style: GoogleFonts.mohave(
                    fontSize: 30,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 120,
              height: 120,
              child: ClipOval(
                child: Image.asset("assets/anya.jpg"), // Ganti dengan path gambar Anda
              ),
            ),
            Card(
               elevation: 2, // Atur elevasi kartu, semakin kecil semakin tipis bayangan
               margin: EdgeInsets.all(4),
              color: Color.fromARGB(255, 10, 58, 109),
              child: ListTile(
                leading: Image.asset(
                  "assets/profil2.png", // Ganti dengan path gambar Anda
                  width: 50, // Lebar gambar
                  height: 50, // Tinggi gambar
                   ),
                title: Text (
                  "Krisna Febrianti",
                  style: TextStyle(color: Colors.white),),
                  
                // subtitle: Text("Sistem informasi",
                // style: TextStyle(color: Colors.white),),
                
              ),
            ),
            Card(
               elevation: 2, // Atur elevasi kartu, semakin kecil semakin tipis bayangan
               margin: EdgeInsets.all(4),
              color: Color.fromARGB(255, 250, 194, 71),
              child: ListTile(
                leading: Image.asset(
                  "assets/prodi.png", // Ganti dengan path gambar Anda
                  width: 50, // Lebar gambar
                  height: 50, // Tinggi gambar
                   ),
                title: Text (
                  "Sistem Informasi",
                  style: TextStyle(color: Colors.white),),
                  
                // subtitle: Text("Sistem informasi",
                // style: TextStyle(color: Colors.white),),
                
              ),
            ),

             Card(
               elevation: 2, // Atur elevasi kartu, semakin kecil semakin tipis bayangan
               margin: EdgeInsets.all(4),
              color: Color.fromARGB(255, 197, 103, 194),
              child: ListTile(
                leading: Image.asset(
                  "assets/alamat3.png", // Ganti dengan path gambar Anda
                  width: 50, // Lebar gambar
                  height: 50, // Tinggi gambar
                   ),
                title: Text (
                  "Jl.Bone Utama No 45 ,Banyuanyar,Banjarsari,Surakarta",
                  style: TextStyle(color: Colors.white),),
                  
                // subtitle: Text("Sistem informasi",
                // style: TextStyle(color: Colors.white),),
                
              ),
            ),

             Card(
               elevation: 2, // Atur elevasi kartu, semakin kecil semakin tipis bayangan
               margin: EdgeInsets.all(4),
              color: Color.fromARGB(255, 112, 32, 129),
              child: ListTile(
                leading: Image.asset(
                  "assets/resume2.png", // Ganti dengan path gambar Anda
                  width: 50, // Lebar gambar
                  height: 50, // Tinggi gambar
                   ),
                title: Text (
                  "Saya lahir pada tanggal 9 Februari 2003 di kota kecil yang damai. Sejak saat itu, perjalanan hidup saya telah penuh dengan beragam pengalaman dan pencapaian yang telah membentuk saya menjadi individu yang saya adalah hari ini.",
                  style: TextStyle(color: Colors.white),),
                  
                // subtitle: Text("Sistem informasi",
                // style: TextStyle(color: Colors.white),),
                
              ),
            ),





          ],
        ),
      ),

      
    );
  }
}
