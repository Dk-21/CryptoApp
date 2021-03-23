import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List  currencies;
  @override

  void initState()
  {
    super.initState();
    currencies= await getCurrencies();
  }

  Future<List> getCurrencies() async {
    var response = await http.get(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest",
        headers: {
          'X-CMC_PRO_API_KEY': 'f69794af-49f6-4100-8a92-8320c15e006d',
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      return payloadFromJson(response.body);
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      title: new  Text("Crypto App"),
      backgroundColor: Colors.indigo,
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return new Container(
      child: new Flexible(
          flex: 2,
          child: new ListView.builder(
              itemCount: 0,
              itemBuilder: (BuildContext Context, int index){

              },
          ),
      ),
    );
  }
}
