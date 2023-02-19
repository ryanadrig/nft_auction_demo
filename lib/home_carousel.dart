import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nft_auction/state/na_globals.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'dart:ui';
import 'dart:math'as math;


class CarouselItem extends StatelessWidget {
  CarouselItem({Key? key, required this.item_idx}) : super(key: key);
  double nft_card_width = 0.0;
  double nft_card_height = 0.0;
  double nft_item_padding = 0.0;
  int item_idx;
  int endtime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  @override
  Widget build(BuildContext context) {
    nft_card_width = ss.width * .88;
    nft_card_height = ss.height* .66;
    nft_item_padding = ss.width*.03;

    return Transform.rotate(
        angle: math.pi/2,
        child:Container(
            height: ss.height * .66,
            width: nft_card_width,
            child:
            Padding(
                padding:EdgeInsets.symmetric(horizontal:nft_item_padding),
                child:
                Stack(children:[
                  Padding(
                      padding:EdgeInsets.symmetric(horizontal:nft_item_padding),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(ss.width*.08),
                          child:Image.asset("assets/images/nft_asset" + (item_idx + 1).toString()+".png",
                        height: ss.height * .6,
                        width: nft_card_width,
                        fit: BoxFit.fill,))),
              Positioned(
                      top:0,
                      child:SizedBox(
                          width: ss.width*.88,
                          height: ss.height*.1,
                          child:Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                          ClipRRect(
                            
                          child:
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
                                        )]))))
                            ],))
                  ),
                  Positioned(
                      bottom:0,
                      child:
                      SizedBox(
                          width: nft_card_width,
                          height: ss.height*.18,
                          child:
                              ClipRRect(
                                  child:
                          BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 1.0),
                              child:
                              Container(
                                  height: ss.height*.18,
                                  width: nft_card_width,
                                  child:Row(children: [
                                    Container(
                                        height: ss.height*.18,
                                        width:ss.width*.44,
                                        child:Column(children: [
                                          Text(home_nft_items[item_idx]["title"]),
                                          Text(home_nft_items[item_idx]["artist"])
                                        ],)
                                    ),
                                    Container(width: ss.width*.22,
                                        child: CountdownTimer(endTime:endtime))
                                  ],))
                          ))
                      )),
                ]
                ))
        ));
  }
}