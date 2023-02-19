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

  double bottom_drawer_height = 0;
  double min_bottom_drawer_height = 0;
  double max_bottom_drawer_height = 0;

  @override
  void initState() {
    bottom_drawer_height = ss.height*.14;
    min_bottom_drawer_height = ss.height*.13;
    max_bottom_drawer_height = ss.height*.55;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(child: Scaffold(
      body:Container(
        height: ss.height,
        width: ss.width,
        color: detail_bg_color,
        child:Stack(children:[Column(children: [

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
                        fontSize: ss.width * .05,
                        fontWeight: FontWeight.w500,
                        color: Colors.black))])

                        ]))
              ])),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:EdgeInsets.only(left:ss.width*.04),
                child:
              Text("Bid History")),
              Padding(
                padding:EdgeInsets.only(right: ss.width*.04),
                child:
              Text(months[DateTime.now().month] +" "+
                  DateTime.now().day.toString() +" " +
                  DateTime.now().year.toString()))
            ],),

          Container(
            height: ss.height*.76,
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
                  Container(width: ss.width*.5,
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Container(
                          width: ss.width*.3,
                          child:Text(widget.bid_data[iidx]["bidder"],
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,)),
                      Text(widget.bid_data[iidx]["time_ago"] + " ago",
                      style: TextStyle(fontSize: ss.width*.03,
                      fontWeight: FontWeight.w300),),],))
                  ],)
                  ),
                        Padding(
                          padding:EdgeInsets.only(right: ss.width*.02),
                  child: Container(width: ss.width*.25,
                  child:Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text(widget.bid_data[iidx]["amount"]),
                    Text(widget.bid_data[iidx]["currency"])],
                  )
                  ))
                ],)
              )));
            })
          ),
        ],),
Positioned(bottom:0,
          child:Container(color: Colors.blue,
            // duration: Duration.zero,
            height: bottom_drawer_height,
            width: ss.width,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onVerticalDragUpdate:(DragUpdateDetails dud){
                        print("dud + " + dud.delta.dy.toString());
                        if (bottom_drawer_height- dud.delta.dy >= min_bottom_drawer_height &&
                            bottom_drawer_height- dud.delta.dy <= max_bottom_drawer_height) {
                          setState(() {
                            bottom_drawer_height =
                                bottom_drawer_height - dud.delta.dy;
                          });
                        }
                      } ,
                child:Container(
                  height: ss.width*.02,
                  width: ss.width*.1,
                  decoration: BoxDecoration(border:Border(bottom:
                  BorderSide(width: ss.width*.01, color: Colors.black))),
                ))
              ],)
            ],),
          ))


      ]))
    ));
  }
}
