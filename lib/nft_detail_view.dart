import 'package:flutter/material.dart';
import 'package:nft_auction/state/na_globals.dart';

class NFT_Detail_View extends StatefulWidget {
   NFT_Detail_View({Key? key,
    required this.nft}) : super(key: key);
Map nft;
  @override
  _NFT_Detail_ViewState createState() => _NFT_Detail_ViewState();
}

class _NFT_Detail_ViewState extends State<NFT_Detail_View> {
  @override
  Widget build(BuildContext context) {
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
