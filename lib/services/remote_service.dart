import 'package:github_project/models/User.dart';
import 'package:github_project/models/repositories.dart';

import 'package:http/http.dart' as http;

class RemoteService{

  Future<User?> getUser() async{
    var client = http.Client();

    var uri = Uri.parse('https://api.github.com/users/7ussainLz');
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json = response.body;
      return userFromJson(json);
    }
  }
//_______________________________________

  Future<List<Repositories>?> getRepositories(String repoUri) async{
    var client = http.Client();

    var uri = Uri.parse(repoUri);
    var response = await client.get(uri);
    if (response.statusCode == 200){
      var json = response.body;
      return repositoriesFromJson(json);
    }
  }
}