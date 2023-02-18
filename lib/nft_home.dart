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
          ),

          Container(
            width: ss.width,
          child:ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(width: ss.width * .12,
              child: Text("Live")),
              Container(width: ss.width * .12,
                  child: Text("New")),
              Container(width: ss.width * .12,
                  child: Text("Popular"))
            ],
          )),

          Padding(padding: EdgeInsets.symmetric(vertical: ss.width*.02),
          child:
              PageView.builder(itemBuilder: (context, position){
                      return Container(
                        child:Image.asset("assets/images/nft_asset" + position.toString())
                      );
              })
          ),

          Container(
            child: Collections_Col()
          )

        ],),
      ),
    ));
  }
}


List<Map> collections_data = [];

class Collections_Col extends StatefulWidget {
  const Collections_Col({Key? key}) : super(key: key);

  @override
  _Collections_ColState createState() => _Collections_ColState();
}

class _Collections_ColState extends State<Collections_Col> {
  @override
  Widget build(BuildContext context) {
    return Column(

    );
  }
}
