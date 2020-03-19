import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/post.dart';


// GET request create a method to get the request
// this method will call the api endpoint
// we will receive a json string in response.body,
// which we have to send to postFromJson to do its conversion

String url = 'http://api.open-notify.org/astros';
Future<Post> getPost() async{
 final response = await http.get(url);

 if(response.statusCode == 200){
//   If the call to the server was successful, parse the JSON
    return Post.fromJSON(json.decode(response.body));
 } else {
//   if that call was not successful, throw an error
    throw Exception('Failed to load post');
 }

}