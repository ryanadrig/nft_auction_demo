import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:nft_auction/state/na_globals.dart';
import 'package:nft_auction/utils.dart';
import 'package:nft_auction/nft_detail_view.dart';
import 'dart:ui';
import 'dart:math'as math;



class CarouselItem extends StatelessWidget {
  CarouselItem({Key? key, required this.item_idx}) : super(key: key);
  double nft_card_width = 0.0;
  double nft_card_height = 0.0;
  double nft_item_padding = 0.0;
  double nft_item_borderradius = 0.0;
  double overlay_text_bg_height = 0.0;

  TextStyle nft_overlay_text_title = TextStyle(color: Colors.white,
                                                fontSize: 14,
                                          fontWeight: FontWeight.w500);
  TextStyle nft_overlay_text_sub = TextStyle(color: Colors.white,
                                              fontSize: 10,
                                          fontWeight: FontWeight.w400);
  int item_idx;



  @override
  Widget build(BuildContext context) {
    nft_card_width = ss.width * .88;
    nft_card_height = ss.height* .66;
    nft_item_padding = ss.width*.03;
    nft_item_borderradius = ss.width * .08;
    overlay_text_bg_height = ss.height*.14;
    return Transform.rotate(
        angle: math.pi/2,
        child:
        Container(
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
                          borderRadius: BorderRadius.circular(nft_item_borderradius),
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
                            borderRadius: BorderRadius.only(bottomRight:
                            Radius.elliptical( ss.width*.03, ss.width*.02),
                              bottomLeft: Radius.elliptical( ss.width*.03, ss.width*.02),

                            ),
                          child:
                              Container(
                                  color: Colors.white,
                                  child:
                                  SizedBox(
                                      width: ss.width*.2,
                                      child:
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children:[Text("Live"),
                                      Image.asset("assets/images/fire_emoji.png",
                                          width:ss.width*.06,
                                          height:ss.width*.06,
                                          fit: BoxFit.contain,
                                        )]))))
                            ],))
                  ),
                  Positioned(
                      bottom:0,
                      left: nft_item_padding,
                      child:

                      SizedBox(
                          height: overlay_text_bg_height,
                          child:
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(nft_item_borderradius),
                                  bottomRight: Radius.circular(nft_item_borderradius)
                                ),
                                  child:
                          BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                              child:
                              Container(
                                  height: overlay_text_bg_height,
                                  width:  nft_card_width - (4 * nft_item_padding),
                                  child:Row(
                                    children: [
                                    Container(
                                        height: ss.height*.18,
                                        width:ss.width*.44,
                                        child:Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                          Text(home_nft_items[item_idx]["title"],
                                          style: nft_overlay_text_title,),
                                          Text(home_nft_items[item_idx]["artist"],
                                          style: nft_overlay_text_sub,)
                                        ],)
                                    ),
                                    Container(width: ss.width*.22,
                                        child: CountdownTimer(endTime:
                                          ret_counter_endtime(
                                              home_nft_items[item_idx]["auction_end"]),
                                        textStyle: nft_overlay_text_title,))
                                  ],))
                          ))
                      )),
                ]
                )
        )));
  }
}