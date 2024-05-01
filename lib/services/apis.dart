import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restapi/model/api_model.dart';

class APIs {
  // Get the data from the API...........

  Future<RestApiModel> fetchData() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return RestApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to Load");
    }
  }

  // Post the data from the API...........
  Future<RestApiModel> createPost(String title, String body) async {
    Map<String, dynamic> request = {
     
      "title": title,
      "body": body,
      
    };

    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.post(uri, body: request);

    if (response.statusCode == 201) {
      // Correcting status code to 201
      return RestApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to Create Post"); // Adjusting error message
    }
  }

  // Update the data from the API...........
  Future<RestApiModel> updatePost(String title, String body) async {
    Map<String, dynamic> request = {
      "title": title,
      "body": body,
 
    };

    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.put(uri, body: request);

    if (response.statusCode == 200) {
      return RestApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to Load Post");
    }
  }

  // Delete the data from the API...........
  Future<RestApiModel> deletePost() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      return RestApiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to Delete");
    }
  }
}
