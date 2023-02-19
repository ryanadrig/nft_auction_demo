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
    bottom_drawer_height = ss.height*.06;
    min_bottom_drawer_height = ss.height*.06;
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
                    padding: EdgeInsets.only(top: ss.width*.03),
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

          Padding(
            padding:EdgeInsets.only(bottom:ss.width*.02),
            child:
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
            ],)),

          Container(
            height: ss.height*.76,
            child:ListView.builder(
                itemCount: widget.bid_data.length,
                itemBuilder: (context, iidx){
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
                  child:Image.asset("assets/images/" +widget.bid_data[iidx]["pp_path"],
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
          child:Container(color: detail_bg_color,
            height: bottom_drawer_height,
            width: ss.width,
            child:
            ListView(children: [
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
                child:
                ClipRRect(
                    borderRadius: BorderRadius.circular(ss.width*.02) ,
                    child:Container(
                  height: ss.width*.05,
                  width: ss.width*.1,
                  decoration: BoxDecoration(border:Border(bottom:
                  BorderSide(width: ss.width*.015, color: Colors.black))),
                )))
              ],),

            AnimatedScale(
                duration: Duration.zero,
                scale: bottom_drawer_height/max_bottom_drawer_height,
                child:
              Padding(padding: EdgeInsets.fromLTRB(ss.width*.02, ss.width*.04, ss.width*.02, ss.width*.04),
              child:
              ClipRRect(
                // borderRadius: BorderRadius.only(topLeft:Radius.circular(ss.width*.04),
                //     topRight:Radius.circular(ss.width*.04)),
                  borderRadius: BorderRadius.circular(ss.width*.04),
              child:Container(
                height: max_bottom_drawer_height -ss.height*.1 ,
                  color: Colors.white54,
                  // color: Colors.blue,
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[  ClipRRect(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(ss.width*.04),
                      topRight:Radius.circular(ss.width*.04)),
              child:Container(
                  height: ss.height * .12,
                      padding:EdgeInsets.only(top:ss.width*.06),

                  child:Row(children: [
                    Padding(
                        padding:EdgeInsets.only(left:ss.width*.04),
                        child:Icon(Icons.account_balance_outlined,
                          size: ss.width*.1,
                      weight: 1000,
                      grade:1000
                    )),
                  Padding(
                    padding:EdgeInsets.only(left:ss.width*.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Your Balance",
                          style:TextStyle(fontSize: ss.width*.035)),
                                    Text("87 ETH",
                                    style:TextStyle(fontSize: ss.width*.06))],))
                  ],)

              )),
                  Container(
                      height: ss.height * .04,
                      padding:EdgeInsets.only(left:ss.width*.04),
                      child: Row(children:[Container(
                    child:Text("Your Bid"))])),
                  Padding(
                      padding:EdgeInsets.only(top:ss.width*.04),
               child: ClipRRect(
                    borderRadius: BorderRadius.circular(ss.width*.04),
                    child:Container(
                        color: Colors.white,
                        height: ss.height * .1,
                        width: ss.width*.84,
                        padding: EdgeInsets.fromLTRB(ss.width*.03, ss.width*.02, ss.width*.03, ss.width*.02),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("3.5 ETH"),
                            Text("Min 3.3 ETH")
                        ],)

                    ))),
                  Padding(padding: EdgeInsets.fromLTRB(ss.width*.02, ss.width*.04, ss.width*.02, ss.width*.04),
                      child:
                ClipRRect(
                    borderRadius: BorderRadius.circular(ss.width*.04),
                    child:Container(
                      height: ss.height*.1,
                        color: accent_button_color,
                        child:Center(child:Text("Place Bid",
                        style: TextStyle(color: Colors.white),)))))

            ])
              )),
              ))

            ]),
          ))


      ]))
    ));
  }
}
