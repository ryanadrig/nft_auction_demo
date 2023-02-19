import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nft_auction/state/na_globals.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:nft_auction/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'dart:ui';
import 'package:nft_auction/bid_view.dart';

class NFT_Detail_View extends StatefulWidget {
   NFT_Detail_View({Key? key,
    required this.nft}) : super(key: key);
Map nft;
  @override
  _NFT_Detail_ViewState createState() => _NFT_Detail_ViewState();
}

class _NFT_Detail_ViewState extends State<NFT_Detail_View> {
  int nft_type_chosen_idx = 0;
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
      color: detail_bg_color,
      child:
          Column(children:[
              Container(
              height: ss.height * .88,
                  color: detail_bg_color,
            child:ListView(children: [
      Container(
      height: ss.height*.1,
        width: ss.width,
        child:Stack(children:[
        Container(
          height: ss.height*.1,
          width: ss.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Padding(padding: EdgeInsets.all(ss.width*.02),
            child:
            GestureDetector(
                onTap:(){
                  Navigator.pop(context);
                },
                child:ClipRRect(
                borderRadius: BorderRadius.circular(ss.width*.06),
                child:Container(
                  height:ss.width*.12,
                  width:  ss.width*.12,
                  color: Colors.white,
                  child:Center(child: Icon(Icons.arrow_back,
               color: Colors.black,),)),))),
              Padding(padding: EdgeInsets.all(ss.width*.03),
                child:GestureDetector(
                    onTap:(){},
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(ss.width*.06),
                      child:Container(
                          height:ss.width*.12,
                          width:  ss.width*.12,
                          color: Colors.white,
                          child:Center(child: Icon(Icons.more_vert,
                            color: Colors.black,),)),)),)
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
             Positioned(
                    top:0,
                    child:   Padding(
                        padding:EdgeInsets.symmetric(horizontal:ss.width*.02),
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
              ),
              Container(height: ss.width*.02,),
Row(children: [
  Container(width: ss.width*.02,),
  ClipRRect(
    borderRadius: BorderRadius.circular(
      ss.width*.05
    ),
    child:Image.asset("assets/images/user1_pp.png",
                      width:ss.width*.1,
        height:ss.width*.1,
      fit: BoxFit.contain,
    )),
  Container(width: ss.width*.02,),
  Container(
      height: ss.height*.09,
      width: ss.width*.35,
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text("@" + widget.nft["artist"]),
      Text(widget.nft["artist"])
    ],)
  ),

  Container(
    height: ss.height*.09,
      width: ss.width*.5,
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(ss.width*.06),
      child:Container(
        height:ss.width*.12,
        width:  ss.width*.12,
        color: Colors.white,
        child:Icon(Icons.message_outlined))),
              Container(width:ss.width*.02),
              ClipRRect(
                  borderRadius: BorderRadius.circular(ss.width*.06),
                  child:Container(
                    height:ss.width*.12,
                    width:  ss.width*.32,
                    color: Colors.white,
                    child:Center(child:Text("Follow"))))])),


],),

              Padding(
                  padding: EdgeInsets.only(top:ss.width*.01),
                  child:Container(
                      width: ss.width,
                      height: ss.width*.08,
                      padding: EdgeInsets.only( left:ss.width*.02),
                      child:ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                              onTap:(){
                                setState(() {
                                  nft_type_chosen_idx = 0;
                                });
                              },
                              child: Container(
                                  width: ss.width * .18,
                                  child: Padding(
                                    padding: EdgeInsets.only(left:ss.width*.01),
                                    child:AnimatedCrossFade(
                                        firstChild:Container(
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(width:1,color: snb_shadow_color))
                                            ),
                                            child:Text("About",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                color: nft_type_chosen_idx == 0? primaryColor: Colors.black
                                              ),)),
                                        secondChild: const Text("About",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400
                                          ),),
                                        crossFadeState:
                                        nft_type_chosen_idx == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                        duration: Duration(milliseconds: 500)),))),
                          GestureDetector(
                              onTap:(){
                                setState(() {
                                  nft_type_chosen_idx = 1;
                                });
                              },
                              child: Container(
                                  width: ss.width * .18,
                                  child: Padding(
                                    padding: EdgeInsets.only(left:ss.width*.01),
                                    child:AnimatedCrossFade(
                                        firstChild:Container(
                                            decoration: BoxDecoration(
                                                border: Border(bottom: BorderSide(width:1,
                                                    color: snb_shadow_color))
                                            ),child: Text("History",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: nft_type_chosen_idx == 1? primaryColor: Colors.black
                                          ),)),
                                        secondChild: const Text("History",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400
                                          ),),
                                        crossFadeState:
                                        nft_type_chosen_idx == 1 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                        duration: Duration(milliseconds: 500)),))),
                          GestureDetector(
                              onTap:(){
                                setState(() {
                                  nft_type_chosen_idx = 2;
                                });
                              },
                              child:Container(
                                width: ss.width * .18,
                                child: Padding(
                                  padding: EdgeInsets.only(left:ss.width*.01),
                                  child:
                                  AnimatedCrossFade(
                                      firstChild: Container(
                                          decoration: BoxDecoration(
                                              border: Border(bottom: BorderSide(width:1,
                                                  color: snb_shadow_color))
                                          ),child:Text("Owners",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: nft_type_chosen_idx == 2? primaryColor: Colors.black
                                        ),)),
                                      secondChild: const Text("Owners",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400
                                        ),),
                                      crossFadeState:
                                      nft_type_chosen_idx == 2 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                      duration: Duration(milliseconds: 500)),
                                ),))
                        ],
                      ))),
              Container(
                  padding:
                  nft_type_chosen_idx == 0?
                  EdgeInsets.only(left: ss.width*.065):
                  nft_type_chosen_idx == 1?
                  EdgeInsets.only(left: ss.width*.063):
                  EdgeInsets.only(left: ss.width*.085)
                  ,
                  child:
                  AnimatedSmoothIndicator(
                    activeIndex: nft_type_chosen_idx,
                    count:  4,
                    axisDirection: Axis.horizontal,
                    effect:  SlideEffect(
                        spacing:  ss.width*.17,
                        radius:  4.0,
                        dotWidth:  5.0,
                        dotHeight:  5.0,
                        paintStyle:  PaintingStyle.stroke,
                        strokeWidth:  1.5,
                        dotColor:  Colors.transparent,
                        activeDotColor: snb_shadow_color
                    ),
                  )),

              Container(height: ss.height*.02,),
                  Padding(
                    padding: EdgeInsets.all(ss.width*.01),child:ExpandableText(widget.nft["desc"],
                            readMoreText: "More",
                            readLessText: "Less",
                            linkTextStyle: TextStyle(color: primaryColor,
                            decoration: TextDecoration.underline),
              )),
                Container(height: ss.height*.02,),  Container(height: ss.height*.02,),


      ],)),

Expanded(child:Container(
    color:detail_bg_color,
    child:Row(children: [
Padding(
padding: EdgeInsets.all(ss.width*.01),child: Container(width: ss.width * .4,
          child:Row(children: [
            Icon(Icons.strikethrough_s_outlined),
            Text(widget.nft["current_bid"])
          ],)
        )),
    Padding(
      padding: EdgeInsets.all(ss.width*.01),
      child:
          GestureDetector(
            onTap:(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context){
    return BidView(bid_data: widget.nft["bid_data"], nft:widget.nft);}));

    },
      child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ss.width*.03),
              color: accent_button_color
            ),
            height: ss.height*.12,
            width: ss.width * .56,
        child:Center(child:Text("Place Bid",style: TextStyle(color: Colors.white),)))))

      ],)))
    ])
    )));
  }
}
