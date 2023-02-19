import 'package:flutter/material.dart';
import 'package:nft_auction/state/na_globals.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:nft_auction/utils.dart';
import 'dart:ui';

class NFT_Detail_View extends StatefulWidget {
   NFT_Detail_View({Key? key,
    required this.nft}) : super(key: key);
Map nft;
  @override
  _NFT_Detail_ViewState createState() => _NFT_Detail_ViewState();
}

class _NFT_Detail_ViewState extends State<NFT_Detail_View> {
  double nft_img_borderradius = 0;
  double overlay_cd_width = 0;
  @override
  Widget build(BuildContext context) {
    nft_img_borderradius = ss.width*.06;
    overlay_cd_width = ss.width * .3;
    return Scaffold(body:
    SafeArea(child:Container(
      height: ss.height,
      width: ss.width,
      color: Colors.white70,
      child:
          Column(children:[
              Container(
              height: ss.height * .88,
            child:ListView(children: [
      Container(
      height: ss.height*.08,
        width: ss.width,
        child:Stack(children:[
        Container(
          height: ss.height*.08,
          width: ss.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(padding: EdgeInsets.all(ss.width*.02),
            child: IconButton(
              onPressed: (){Navigator.pop(context);},
              color: Colors.white,
              icon: Icon(Icons.arrow_back,
               color: Colors.black,),),),
              Padding(padding: EdgeInsets.all(ss.width*.02),
                child: IconButton(
                  onPressed: (){Navigator.pop(context);},
                  color: Colors.white,
                  icon: Icon(Icons.more_vert ,
                              color: Colors.black,),),)
          ],),
        ),

    Container(
    height: ss.height*.1,
    width: ss.width,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
      Text(widget.nft["title"],
            style: TextStyle(fontSize: ss.width * .05,
                              fontWeight: FontWeight.w500),)
    ]))
    ])),


              Stack(children:[
                Padding(
                    padding:EdgeInsets.symmetric(horizontal:ss.width*.02),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(nft_img_borderradius),
                        child:Image.asset(widget.nft["img_path"],
                          height: ss.height * .6,
                          width: ss.width*.96,
                          fit: BoxFit.fill,))),
                Padding(
                    padding:EdgeInsets.symmetric(horizontal:ss.width*.02),
                child:Positioned(
                    top:0,
                    child:
                    SizedBox(
                        height: ss.height * .08,
                        width: overlay_cd_width,
                        child:
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(nft_img_borderradius),
                            ),
                            child:
                            BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 1.0),
                                child:
                                Container(
                                    width: ss.width * .3,
                                    child:Row(
                                      children: [
                                        Container(
                                            height: ss.height*.18,
                                            width: overlay_cd_width,
                                            child:Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    child: CountdownTimer(endTime:
                                                    ret_counter_endtime(
                                                        widget.nft["auction_end"]),
                                                      textStyle:TextStyle(
                                                          fontSize: ss.width * .03,
                                                          color: Colors.white))),

                                                Stack(children:[
                                                Container(
                                                  width: ss.width* .1,
                                                  decoration: BoxDecoration(
                                                    border: Border(bottom:
                                                    BorderSide(width:ss.width*.01,
                                                    color: Colors.white
                                                    ))
                                                  ),
                                                ),
                                                  Container(
                                                    width: ss.width* .2,
                                                    decoration: BoxDecoration(
                                                        border: Border(bottom:
                                                        BorderSide(width:ss.width*.01,
                                                            color: Colors.white54
                                                        ))
                                                    ),
                                                  )

                                                ])
                                              ],)
                                        ),

                                      ],))
                            ))
                    ))),
              ]
              )




      ],)),

      Expanded(child:Row(children: [
        Container(width: ss.width * .4,
          child:Row(children: [
            Icon(Icons.strikethrough_s_outlined),
            Text(widget.nft["current_bid"])
          ],)
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ss.width*.03),
              color: Colors.orange[600]
            ),
            height: ss.height*.12,
            width: ss.width * .6,
        child:Center(child:Text("Place Bid",style: TextStyle(color: Colors.white),)))

      ],))
    ])
    )));
  }
}
