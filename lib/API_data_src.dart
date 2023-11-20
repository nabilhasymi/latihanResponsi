import 'Base_Network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadArticles() {
    return BaseNetwork.get("articles");
  }

  Future<Map<String, dynamic>> loadBlogs() {
    return BaseNetwork.get("blogs");
  }

  Future<Map<String, dynamic>> loadReports() {
    return BaseNetwork.get("reports");
  }
}
