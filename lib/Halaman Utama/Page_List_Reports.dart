import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../API_data_src.dart';
import '../API_Model/Report_Model.dart';
import '../Halaman Detail/Page_Detail_Report.dart';

class PageListReports extends StatefulWidget {
  const PageListReports({super.key});

  @override
  State<PageListReports> createState() => _PageListReportState();
}

class _PageListReportState extends State<PageListReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REPORTS LIST"),
        centerTitle: true,
      ),
      body: _buildListReportsBody(),
    );
  }

  Widget _buildListReportsBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadReports(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            ReportModel reportModel = ReportModel.fromJson(snapshot.data);
            return _buildSuccessSection(reportModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(ReportModel results) {
    return ListView.builder(
      itemCount: results.results.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemReports(results.results[index]);
      },
    );
  }

  Widget _buildItemReports(Results reportData) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageDetailReport(ReportData: reportData),
          ),
        );
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              child: Image.network(reportData.imageUrl),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400, // Atur lebar sesuai kebutuhan
                  child: Wrap(
                    children: [
                      Text(
                        reportData.title,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
