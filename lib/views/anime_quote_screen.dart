import 'package:animequotes/models/anime_quotes_models.dart';
import 'package:animequotes/providers/anime_quote_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeQuoteScreen extends StatefulWidget {
  const AnimeQuoteScreen({Key? key}) : super(key: key);

  @override
  _AnimeQuoteScreenState createState() => _AnimeQuoteScreenState();
}

class _AnimeQuoteScreenState extends State<AnimeQuoteScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AnimeQuoteProvider>(context, listen: false).callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.dashboard,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
        bottom: PreferredSize(
            child: Container(
              color: Colors.red,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        title: Text(
          'Anime Quotes',
          style: TextStyle(color: Colors.red, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.red,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<AnimeQuoteProvider>(
        builder: (context, provider, _) {
          List<AnimeQuoteModel> _apiModelList = provider.ApiModelList;
          print(provider.isLoading);
          if (provider.isLoading) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return ListView.builder(
            itemCount: _apiModelList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${_apiModelList[index].character} ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              ),
                              Spacer(),
                              Text(
                                " ${_apiModelList[index].anime}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${_apiModelList[index].quote}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            },
          );
        },
      ),
    );
  }
}
