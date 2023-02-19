import 'package:flutter/material.dart';
import 'package:nft_auction/state/na_globals.dart';

class BidView extends StatefulWidget {
   BidView({Key? key, required this.bid_data}) : super(key: key);

  List<Map> bid_data;

  @override
  _BidViewState createState() => _BidViewState();
}

class _BidViewState extends State<BidView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body:Container(
        height: ss.height,
        width: ss.width,
        child:Column(children: [
          Row()
        ],)
      )
    ));
  }
}
