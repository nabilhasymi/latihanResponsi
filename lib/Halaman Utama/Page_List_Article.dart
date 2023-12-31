import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../API_data_src.dart';
import '../API_Model/Article_Model.dart';
import '../Halaman Detail/Page_Detail_Article.dart';

class PageListArticles extends StatefulWidget {
  const PageListArticles({super.key});

  @override
  State<PageListArticles> createState() => _PageListArticlesState();
}

class _PageListArticlesState extends State<PageListArticles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEWS LIST"),
        centerTitle: true,
      ),
      body: _buildListArticlesBody(),
    );
  }

  Widget _buildListArticlesBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadArticles(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            // Jika data ada error maka akan ditampilkan hasil error
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            ArticlesModel articleModel = ArticlesModel.fromJson(snapshot.data);
            return _buildSuccessSection(articleModel);
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

  Widget _buildSuccessSection(ArticlesModel results) {
    return ListView.builder(
      itemCount: results.results!.length,
      itemBuilder: (BuildContext context, int index) {
        final data = _buildItemArticles(results.results![index]);
        return data;
      },
    );
  }

  Widget _buildItemArticles(Results articlesData) {
    return InkWell(
      onTap: () {},
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PageDetailArticle(articleData: articlesData),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              child: Image.network(articlesData.imageUrl!),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 400, // Atur lebar sesuai kebutuhan
                  child: Text(
                    articlesData.title!,
                    style: TextStyle(fontSize: 16),
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
