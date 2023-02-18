import 'package:flutter/material.dart';
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
          Container(
              height: ss.height * .14,
              child: Row(children: [
                Image.asset(collections_data[el_idx]["img_path"],
                  width:ss.height * .14,
                  height: ss.height * .14,
                  fit: BoxFit.contain,
                ),
                Container(
                    padding: EdgeInsets.all(ss.width*.01),
                    child:Column(children: [
                      Text(collections_data[el_idx]["title"]),
                      Text(collections_data[el_idx]["desc"])
                    ],)
                )
              ],)
          ));
      el_idx +=1;
    });

    return Column(
      children: built_collections_items,
    );
  }
}