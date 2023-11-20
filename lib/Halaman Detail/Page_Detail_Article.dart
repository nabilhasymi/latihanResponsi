import 'package:flutter/material.dart';
import '../API_Model/Article_Model.dart'; // Ensure the import path is correct
import 'package:url_launcher/url_launcher.dart';

class PageDetailArticle extends StatelessWidget {
  final Results articleData; // Pass the article data to this page

  const PageDetailArticle({Key? key, required this.articleData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: _buildArticleDetail(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launchUrl(Uri.parse(
            articleData.url ?? '',
          ));
          // Aksi ketika FAB ditekan
        },
        icon: Icon(Icons.search_outlined),
        label: Text('See More...'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildArticleDetail() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            articleData
                .imageUrl!, // Assuming imageUrl exists in the article data
            height: 200, // Set height as needed
            width: double.infinity, // Take full width
            fit: BoxFit.fitHeight, // Adjust the image to cover the space
          ),
          SizedBox(height: 20),
          Text(
            articleData.title!, // Assuming title exists in the article data
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10),
          Text(
            articleData.summary ??
                '', // Assuming description exists in the article data
            style: TextStyle(fontSize: 16),
          ),
          // Add other details about the article as needed
        ],
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
