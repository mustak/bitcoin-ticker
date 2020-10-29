import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoPicker;
import 'dart:io' show Platform;
import 'package:bitcoin_ticker/components/coin_card.dart';
import 'coin_data.dart' as coinData;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<String> _currencies;
  List<CoinCard> _cryptoCards = [];
  String _selectedValue = 'USD';
  bool updating = false;

  Widget androidSelect() {
    List<DropdownMenuItem<String>> dropdownList = _currencies
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: e,
          ),
        )
        .toList();

    return DropdownButton(
        style: TextStyle(
          fontSize: 20,
        ),
        value: _selectedValue,
        items: dropdownList,
        onChanged: (newValue) {
          setState(() {
            _selectedValue = newValue;
          });
          populateCardList();
        });
  } //androidSelect

  Widget iOSSelect() {
    List<Widget> dropdownList = _currencies
        .map(
          (e) => Text(e),
        )
        .toList();

    return CupertinoPicker(
      scrollController: FixedExtentScrollController(initialItem: 19),
      children: dropdownList,
      itemExtent: 30,
      onSelectedItemChanged: (index) {
        setState(() {
          _selectedValue = _currencies[index];
        });
      },
    );
  } //iOSSelect

  @override
  void initState() {
    super.initState();
    _currencies = coinData.currenciesList;

    populateCardList();
  }

  void populateCardList() async {
    setState(() {
      updating = true;
    });
    List<CoinCard> tList = [];
    for (String crypto in coinData.cryptoList) {
      String rate = await coinData.CoinData()
          .getCoinData(coin: crypto, currency: _selectedValue);
      tList.add(
        CoinCard(
          crypto: crypto,
          currency: _selectedValue,
          rate: rate,
        ),
      );
    }

    setState(() {
      _cryptoCards = tList;
      updating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: updating
                ? [
                    Center(
                      heightFactor: 12,
                      child: Text(
                        'Loading...',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    )
                  ]
                : _cryptoCards,
          ),
          // coinCard(coin: 'UXC', currency: _selectedValue),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSSelect() : androidSelect(),
          ),
        ],
      ),
    );
  }
}
