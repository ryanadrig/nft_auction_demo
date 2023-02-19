import 'package:flutter/material.dart';
import 'package:nft_auction/state/na_globals.dart';

class BidView extends StatefulWidget {
  const BidView({Key? key}) : super(key: key);

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
