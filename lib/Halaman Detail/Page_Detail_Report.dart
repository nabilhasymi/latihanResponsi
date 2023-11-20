import 'package:flutter/material.dart';
import '../API_Model/Report_Model.dart'; // Ensure the import path is correct
import 'package:url_launcher/url_launcher.dart';

class PageDetailReport extends StatelessWidget {
  final Results ReportData; // Pass the Report data to this page

  const PageDetailReport({Key? key, required this.ReportData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Detail"),
      ),
      body: _buildReportDetail(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launchUrl(Uri.parse(
            ReportData.url,
          ));
          // Aksi ketika FAB ditekan
        },
        icon: Icon(Icons.search_outlined),
        label: Text(
          'See More...',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildReportDetail() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            ReportData.imageUrl, // Assuming imageUrl exists in the Report data
            height: 200, // Set height as needed
            width: double.infinity, // Take full width
            fit: BoxFit.fitHeight, // Adjust the image to cover the space
          ),
          SizedBox(height: 20),
          Text(
            ReportData.title, // Assuming title exists in the Report data
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            ReportData
                .summary, // Assuming description exists in the Report data
            style: TextStyle(fontSize: 16),
          ),
          // Add other details about the Report as needed
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
