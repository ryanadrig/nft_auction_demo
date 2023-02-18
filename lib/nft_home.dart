import 'package:flutter/material.dart';
import 'package:nft_auction/state/na_globals.dart';

class NFT_Home extends StatefulWidget {
  const NFT_Home({Key? key}) : super(key: key);

  @override
  _NFT_HomeState createState() => _NFT_HomeState();
}

class _NFT_HomeState extends State<NFT_Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: Container(
        height: ss.height,
        child: ListView(children: [
          Container(height: ss.height*.1,
          child: Row(
            children: [
              Container(
                width: ss.width*.9,
                child: Text("Explore the most popular NFTs"),
              ),
              Container(width: ss.width*.1,
                child: Center(child: Icon(Icons.notifications_outlined),),
              )
            ],
          ),
          )
        ],),
      ),
    ));
  }
}
