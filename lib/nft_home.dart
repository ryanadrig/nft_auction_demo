import 'package:flutter/material.dart';
import 'package:nft_auction/state/na_globals.dart';
import 'package:nft_auction/collections_col.dart';
import 'package:nft_auction/home_carousel.dart';
import 'package:nft_auction/utils.dart';
import 'package:nft_auction/nft_detail_view.dart';
import 'dart:math' as math;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:nft_auction/sn_bottom_navbar.dart';

class NFT_Home extends StatefulWidget {
  const NFT_Home({Key? key}) : super(key: key);

  @override
  _NFT_HomeState createState() => _NFT_HomeState();
}

class _NFT_HomeState extends State<NFT_Home> {

  FixedExtentScrollController fixedExtentScrollController =
  FixedExtentScrollController();

  int nft_type_chosen_idx = 0;

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
          Container(height: ss.height*.12,
            padding: EdgeInsets.only(left:ss.width*.02, top:ss.width*.02),
            child: Row(
            children: [
              Container(
                width: ss.width*.8,
                child: Text("Explore our Network of popular NFTs",
                style: TextStyle(fontSize: ss.width*.07,
                                    fontWeight: FontWeight.w500)
                  ,),
              ),
              Container(width: ss.width*.1,
                child: Center(child: Icon(Icons.notifications_outlined),),
              )
            ],
          ),
          ),

          Padding(
            padding: EdgeInsets.only(top:ss.width*.07),
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
                      child:Text("Live",
                    style: TextStyle(
                        fontWeight: FontWeight.w600
                    ),)),
                  secondChild: const Text("Live",
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
                   ),child: Text("New",
                 style: TextStyle(
                     fontWeight: FontWeight.w600
                 ),)),
               secondChild: const Text("New",
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
                              ),child:Text("Popular",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600
                                ),)),
                          secondChild: const Text("Popular",
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

          // Padding(padding: EdgeInsets.symmetric(vertical: ss.width*.02),
          // child:

     GestureDetector(
       onTap:(){
         print("tap tap");
         Navigator.of(context).push(createNFTDetailRoute(
             NFT_Detail_View(nft: home_nft_items[fixedExtentScrollController.selectedItem])));
       },
       child:
          Container(
              height: ss.height * .65,
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
                          ))))
          ,

          Padding(
            padding: EdgeInsets.only(left:ss.width*.04, bottom:ss.width*.07),
            child:Text("Browse Collections",
            style: TextStyle(fontWeight: FontWeight.w500),)
          ),
          Container(
            child: Collections_Col()
          )

        ],),
      ),
    ),
      bottomNavigationBar: SuperBottomNavigationBar(
        height: ss.width*.13,
      currentIndex: 0,
      items: [
        SuperBottomNavigationBarItem(
          size: ss.width*.09,
            unSelectedIcon: Icons.home_outlined,
            selectedIcon: Icons.home,
            splashColor: primaryColor,
            borderBottomColor: snb_border_color,
            backgroundShadowColor: snb_shadow_color,
            selectedIconColor: primaryColor,
            unSelectedIconColor: Colors.grey
        ),
        SuperBottomNavigationBarItem(
            size: ss.width*.09,
            unSelectedIcon: Icons.favorite_border,
            selectedIcon: Icons.favorite,
            splashColor: primaryColor,
            borderBottomColor: snb_border_color,
            backgroundShadowColor: snb_shadow_color,
            selectedIconColor: primaryColor,
            unSelectedIconColor: Colors.grey
        ),
        SuperBottomNavigationBarItem(
            size: ss.width*.09,
            unSelectedIcon: Icons.cloud_done_outlined,
            selectedIcon: Icons.cloud_done,
            splashColor: primaryColor,
            borderBottomColor: snb_border_color,
            backgroundShadowColor: snb_shadow_color,
            selectedIconColor: primaryColor,
            unSelectedIconColor: Colors.grey
        ),
      ],
      onSelected: (index){
        print('tab $index');
      },
    ),);
  }
}





