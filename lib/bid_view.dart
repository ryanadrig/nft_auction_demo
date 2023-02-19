import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nft_auction/state/na_globals.dart';
import 'package:nft_auction/utils.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class BidView extends StatefulWidget {
   BidView({Key? key, required this.bid_data, required this.nft }) : super(key: key);

  List<Map> bid_data;
  Map nft;

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
        color: detail_bg_color,
        child:Column(children: [
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
                          Column(
                              children:[
                                Text("Time Left:"),
                    CountdownTimer(endTime:
                    ret_counter_endtime(
                    widget.nft["auction_end"]),
                    textStyle:TextStyle(
                        fontSize: ss.width * .04,
                        color: Colors.black))])

                        ]))
              ])),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Bid History"),
              Text(months[DateTime.now().month] +" "+
                  DateTime.now().day.toString() +" " +
                  DateTime.now().year.toString())
            ],),

          Container(
            height: ss.height*.74,
            child:ListView.builder(itemBuilder: (context, iidx){
              return
                Padding(
              padding:EdgeInsets.all(ss.width*.02),
                child:
                ClipRRect(
                    borderRadius: BorderRadius.circular(ss.width*.04),
                    child:Container(
                width: ss.width*.88,
                height: ss.width*.16,
                    padding:EdgeInsets.all(ss.width*.01),
                color: Colors.white,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(width: ss.width*.3,
                  child: Row(children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(ss.width*.04),
                  child:Image.asset("assets/images/user1_pp.png",
                    height: ss.width*.12,
                    width: ss.width*.12,
                    fit: BoxFit.contain,),),
                        Padding(
                          padding:EdgeInsets.only(left: ss.width*.02),
                          child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(widget.bid_data[iidx]["bidder"]),
                      Text(widget.bid_data[iidx]["time_ago"])],))
                  ],)
                  ),
                  Container(width: ss.width*.2,
                  child:Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(widget.bid_data[iidx]["amount"]),
                    Text(widget.bid_data[iidx]["currency"])],
                  )
                  )
                ],)
              )));
            })
          )
        ],)
      )
    ));
  }
}
