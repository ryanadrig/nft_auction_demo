import 'package:flutter/material.dart';
import 'package:nft_auction/nft_detail_view.dart';


// return endtime for counter from formatted string
int ret_counter_endtime(String et_str){
  int hours = int.parse(et_str.split(":")[0]);
  int minutes = int.parse(et_str.split(":")[1]);
  int seconds = int.parse(et_str.split(":")[2]);
  int endtime = DateTime.now().millisecondsSinceEpoch + (1000 * seconds)
      + (60000 * minutes) + (3600000 * hours);
  return endtime;
}

Route createNFTDetailRoute( Widget detail_view ) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        detail_view,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
