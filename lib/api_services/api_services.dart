import 'dart:convert';
import 'dart:developer';
import 'package:animequotes/models/anime_quotes_models.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<AnimeQuoteModel>> getSomeData() async {
    var url = Uri.parse('https://animechan.vercel.app/api/quotes');
    var response = await http.get(url);
    print('Response body:${response.body}');
    var decodedList = jsonDecode(response.body) as List;
    List<AnimeQuoteModel> apiModelList = decodedList
        .map(
          (e) => AnimeQuoteModel.fromJson(e),
        )
        .toList();
    print(apiModelList.length);
    return apiModelList;
  }
}
