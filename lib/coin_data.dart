import 'package:http/http.dart' as http;
import 'keys.dart' as keys;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String _url = 'https://rest.coinapi.io/v1/exchangerate';

  Future<String> getCoinData(
      {String coin = 'BTC', String currency = 'USD'}) async {
    var response = await http.get('$_url/$coin/$currency', headers: {
      'X-CoinAPI-Key': keys.coinAPI_key,
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var exchangeRate = jsonDecode(response.body);
      double rate = exchangeRate['rate'];
      print(rate);
      print(rate.toStringAsFixed(2));

      return rate.toStringAsFixed(2);
    } else {
      return 'error';
    }
  }
}
