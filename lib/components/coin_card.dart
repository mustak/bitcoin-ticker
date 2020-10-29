import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class CoinCard extends StatelessWidget {
  final String crypto;
  final String currency;
  final String rate;

  CoinCard({@required this.crypto, this.currency, this.rate});

  // void updateRate(String crypto, String currency) async {
  //   this.rate = await CoinData().getCoinData(coin: crypto, currency: currency);
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlue[900],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto  = $rate $currency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// class CoinCard extends StatefulWidget {
//   final String crypto;
//   final String currency;
//   // final String rate;
//
//   CoinCard({@required this.crypto, this.currency});
//
//   @override
//   _CoinCardState createState() => _CoinCardState();
// }
//
// class _CoinCardState extends State<CoinCard> {
//   String _rate;
//
//   @override
//   void initState() async {
//     // TODO: implement initState
//     super.initState();
//
//     _rate = await CoinData()
//         .getCoinData(coin: widget.crypto, currency: widget.currency);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
//       child: Card(
//         color: Colors.lightBlue[900],
//         elevation: 5.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
//           child: Text(
//             '1 ${widget.crypto}  = $_rate ${widget.currency}',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 20.0,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
