import 'package:flutter/material.dart';
import 'package:latihan_responsi/Halaman%20Utama/Page_List_Article.dart';
import 'package:latihan_responsi/Halaman%20Utama/Page_List_Blog.dart';
import 'package:latihan_responsi/Halaman%20Utama/Page_List_Reports.dart';

class halamanUtama extends StatelessWidget {
  const halamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white, // Atur warna AppBar secara global
          iconTheme: IconThemeData(
            color: Colors.black, // Ubah warna tombol kembali secara global
          ),
          titleTextStyle: TextStyle(
            color: Colors.black, // Atur warna teks judul AppBar secara global
            fontSize: 20, // Atur ukuran teks judul AppBar secara global
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Space Flight News"),
          centerTitle: true,
          //titleSpacing: 0.0,
        ),
        body: ListView(
          children: [
            MenuCard(
              img: "../assets/ArticlesIcon.jpg",
              title: "News",
              description:
                  "Get an Overview of the latest SpaceFlight news, from various resource! Easily link your users to the right websites.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageListArticles();
                    },
                  ),
                );
              },
            ),
            MenuCard(
              img: "../assets/BlogsIcon.jpg",
              title: "Blog",
              description:
                  "Blogs often provide a more detailed overview of launches and mission. A must have for the serious spaceflight enthusiast.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageListBlogs();
                    },
                  ),
                );
              },
            ),
            MenuCard(
              img: "../assets/ReportsIcon.jpg",
              title: "Reports",
              description:
                  "Space Stations and other missions often publish their data. With SNAPI, you can include it in your app as well.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PageListReports();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  final VoidCallback onTap;

  MenuCard({
    required this.img,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Atur tinggi shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Atur border radius
      ),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 20), // Atur margin dari luar Card
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              width: 200, // Atur lebar kontainer
              height: 200, // Atur tinggi kontainer
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit
                      .cover, // Atur bagaimana gambar ditampilkan dalam kontainer
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  50, 10, 50, 20), // Atur jarak dari sisi kiri dan atas
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
