import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoPicker;
import 'dart:io' show Platform;
import 'coin_data.dart' as coinData;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  List<String> _currencies;
  String _selectedValue = 'USD';

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
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
