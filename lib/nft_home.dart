import 'package:flutter/material.dart';
import 'package:nft_auction/state/na_globals.dart';
import 'package:nft_auction/collections_col.dart';
import 'package:nft_auction/home_carousel.dart';
import 'dart:math' as math;

class NFT_Home extends StatefulWidget {
  const NFT_Home({Key? key}) : super(key: key);

  @override
  _NFT_HomeState createState() => _NFT_HomeState();
}

class _NFT_HomeState extends State<NFT_Home> {

  FixedExtentScrollController fixedExtentScrollController =
  FixedExtentScrollController();


  @override
  Widget build(BuildContext context) {
    ss = MediaQuery.of(context).size;

    List<Widget> carousel_images = [];
    int nft_item_idx = 0;
    home_nft_items.forEach((element) {
      carousel_images.add(CarouselItem(item_idx: nft_item_idx));
      nft_item_idx +=1;
    });
    return  Scaffold(
        body: SafeArea(child:
   Container(
        height: ss.height,
        width: ss.width,
        child:
        ListView(children: [
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
            height: ss.width*.1,
          child:ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(width: ss.width * .16,
              child: Text("Live")),
              Container(width: ss.width * .16,
                  child: Text("New")),
              Container(width: ss.width * .16,
                  child: Text("Popular"))
            ],
          )),

          // Padding(padding: EdgeInsets.symmetric(vertical: ss.width*.02),
          // child:
          Container(
              height: ss.height * .69,
              width: ss.width*.88,
              child:
            Transform.rotate(
              angle: 3 * (math.pi/2),
              child:ListWheelScrollView(
                squeeze: 1.15,
                controller: fixedExtentScrollController,
                physics: FixedExtentScrollPhysics(),
                // scrollDirection: Axis.horizontal,
                // shrinkWrap: false,
                children: carousel_images,
                            itemExtent:ss.width * .88 ,
                            // clipBehavior: Clip.none,
                            // padEnds: false,
                          )))
          ,

          Container(
            child: Collections_Col()
          )

        ],),
      ),
    ));
  }
}





