import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nft_auction/state/na_globals.dart';

class Collections_Col extends StatefulWidget {
  const Collections_Col({Key? key}) : super(key: key);

  @override
  _Collections_ColState createState() => _Collections_ColState();
}

class _Collections_ColState extends State<Collections_Col> {
  @override
  Widget build(BuildContext context) {
    List<Widget> built_collections_items = [];

    int el_idx = 0;
    collections_data.forEach((el) {
      built_collections_items.add(
         
        Padding(
            padding:EdgeInsets.only(left:ss.width*.05),
          child:  ClipRRect(
              borderRadius: BorderRadius.circular(ss.width*.08),
              child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors:[Colors.grey[400]!,Colors.white] ,
                  begin:Alignment.centerLeft , end: Alignment.centerRight)
            ),
              height: ss.height * .18,
              width: ss.width * .94,
              child: Row(children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(ss.width*.08),
            child: Image.asset(collections_data[el_idx]["img_path"],
                  width:ss.height * .18,
                  height: ss.height * .18,
                  fit: BoxFit.fill,
                )),
                Container(
                    padding: EdgeInsets.all(ss.width*.01),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding( padding: EdgeInsets.only(left:ss.width*.02),
                      child:Text(collections_data[el_idx]["title"],
                          style :TextStyle(fontSize: ss.width*.04,
                              fontWeight: FontWeight.w600))),
                      Container(
                        width: (ss.width * .6) ,
                        height: ss.height * .08,
                       padding: EdgeInsets.only(left:ss.width*.01),
                      child:Text(collections_data[el_idx]["desc"],
                        softWrap: true,
                        style: TextStyle(fontSize: ss.width*.03,
                                        fontWeight: FontWeight.w300),
                      ))
                    ],)
                )
              ],)
          ))));
      el_idx +=1;
    });

    return Column(
      children: built_collections_items,
    );
  }
}