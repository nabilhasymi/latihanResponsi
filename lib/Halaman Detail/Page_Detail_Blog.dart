import 'package:flutter/material.dart';
import '../API_Model/Blog_Model.dart'; // Ensure the import path is correct
import 'package:url_launcher/url_launcher.dart';

class PageDetailBlog extends StatelessWidget {
  final Results BlogData; // Pass the Blog data to this page

  const PageDetailBlog({Key? key, required this.BlogData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Detail"),
      ),
      body: _buildBlogDetail(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launchUrl(Uri.parse(
            BlogData.url,
          ));
          // Aksi ketika FAB ditekan
        },
        icon: Icon(Icons.search_outlined),
        label: Text('See More...'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildBlogDetail() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            BlogData.imageUrl, // Assuming imageUrl exists in the Blog data
            height: 200, // Set height as needed
            width: double.infinity, // Take full width
            fit: BoxFit.fitHeight, // Adjust the image to cover the space
          ),
          SizedBox(height: 20),
          Text(
            BlogData.title, // Assuming title exists in the Blog data
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            BlogData.summary, // Assuming description exists in the Blog data
            style: TextStyle(fontSize: 16),
          ),
          // Add other details about the Blog as needed
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
