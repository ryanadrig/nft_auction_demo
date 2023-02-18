import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:nft_auction/state/na_globals.dart';
import 'package:nft_auction/collections_col.dart';
import 'dart:ui';

class NFT_Home extends StatefulWidget {
  const NFT_Home({Key? key}) : super(key: key);

  @override
  _NFT_HomeState createState() => _NFT_HomeState();
}

class _NFT_HomeState extends State<NFT_Home> {

  double nft_card_width = 0.0;
  double nft_card_height = 0.0;
  double nft_item_padding = 0.0;
  int endtime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;


  @override
  Widget build(BuildContext context) {
    ss = MediaQuery.of(context).size;
    nft_card_width = ss.width * .78;
    nft_card_height = ss.height* .66;
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

          Padding(padding: EdgeInsets.symmetric(vertical: ss.width*.02),
          child:
          Container(
              height: ss.height * .69,
              width: nft_card_width,
              child: FlutterCarousel.builder(
                  options: CarouselOptions(height: nft_card_height),
                  itemCount: home_nft_items.length,
                  itemBuilder: (context, i_idx, pv_idx){
                    print("carousel i idx ~ " + i_idx.toString());
                    print("carousel pv idx ~ " + pv_idx.toString());
                      return Container(
                        height: ss.height * .66,
                        width: nft_card_width - ss.width * .06,
                        child:
                        Stack(children:[
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal:nft_item_padding),
                          child: Image.asset("assets/images/nft_asset" + (pv_idx - 9999).toString()+".png",
                            height: ss.height * .6,
                            width: nft_card_width,
                          fit: BoxFit.fill,)),
                        Positioned(
                          top:0,
                          child:Expanded(child:Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Container(
                color: Colors.white,
                child:
                                SizedBox(

                                    width: ss.width*.2,
                                  child:
                                  Row(children:[Text("Live"),
                                                Image.asset("assets/images/fire_emoji.png",
                                                            width:ss.width*.06,
                                                    height:ss.width*.06,
                                                  fit: BoxFit.contain,
                                                )])))
                          ],))
                        ),
                          Positioned(
                              bottom:0,
                              child:
                              SizedBox(
                                  width: nft_card_width,
                                  height: ss.height*.18,
                                  child:
                                  BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                                  child:
                Container(
                height: ss.height*.18,
                                 width: nft_card_width,
                                 child:Row(children: [
                                  Container(
                                      height: ss.height*.18,
                                      width:ss.width*.44,
                                    child:Column(children: [
                                      Text(home_nft_items[pv_idx - 10000]["title"]),
                                        Text(home_nft_items[pv_idx - 10000]["artist"])
                                    ],)
                                  ),
                                  Container(width: ss.width*.22,
                                  child: CountdownTimer(endTime:endtime))
                                ],))
                              )
                )),

                        ])
                      );
              }))
          ),

          Container(
            child: Collections_Col()
          )

        ],),
      ),
    ));
  }
}




