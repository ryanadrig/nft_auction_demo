import 'package:flutter/material.dart';

Size ss = Size(0,0);
Color primaryColor = Colors.green[900]!;
Color snb_border_color = Colors.lightGreenAccent;
Color snb_shadow_color = Colors.lightGreenAccent[700]!;
Color detail_bg_color = Colors.grey[300]!;
Color accent_button_color = Colors.orange[600]!;

List<Map> collections_data = [
  {"title": "New Collections",
    "desc": "Explore the newest collections in our inventory here. Just click here and be amazed by all of our outstanding NFTs",
    "img_path":"assets/images/nft_col_img1.png"
  },
  {"title": "Live Collections",
    "desc": "Check out live collections that you can bid on now here. Just click here and be amazed by all of our outstanding NFTs",
    "img_path":"assets/images/nft_asset4.png"
  }
];

List<Map> home_nft_items = [
  {"title": "Space Whale",
    "desc": "You can run but you can't hide from space whale. Want to own the space whale? Bidding is open. Bid with multiple crypto currencies or a variety of payment options.",
    "artist": "L1ght5p33D",
    "img_path":"assets/images/nft_asset1.png",
    "auction_end": "01:08:08",
    "current_bid": "244.34",
    "bid_data": bd
  },
  {"title": "Lit Astronaut",
    "desc": "Some say his lights harness the power of the sun itself. Want to own the lit astronaut? Bidding is open. Bid with multiple crypto currencies or a variety of payment options.",
    "artist": "L1ght5p33D",
    "img_path":"assets/images/nft_asset2.png",
    "auction_end": "07:07:07",
    "current_bid": "444.56",
    "bid_data": bd
  },
  {"title": "Retro Spacemen",
    "desc": "They're from a time with better music and no physics. Want to own the retro spacemen? Bidding is open. Bid with multiple crypto currencies or a variety of payment options.",
    "artist": "L1ght5p33D",
    "img_path":"assets/images/nft_asset3.png",
    "auction_end": "12:13:14",
    "current_bid": "44.5",
    "bid_data": bd
  },
  {"title": "Abstractonaut",
    "desc": "He's warped into another dimension, and can't seem to get back. Want to own the abstractonaut? Bidding is open. Bid with multiple crypto currencies or a variety of payment options.",
    "artist": "L1ght5p33D",
    "img_path":"assets/images/nft_asset4.png",
    "auction_end": "01:00:10",
    "current_bid": "554.00",
    "bid_data": bd
  }


];

List<Map> bd = [
  {"bidder":"Jean-Ralphio Saperstein",
    "pp_path": "nft_pp_jr.png",
    "time_ago": "8 hours",
    "amount": "3.3",
    "currency": "ETH"
  },
  {"bidder":"Chris Traeger",
    "pp_path": "nft_pp_ct.png",
    "time_ago": "9 hours",
    "amount": "3.1",
    "currency": "ETH"
  },
  {"bidder":"Charlie Kelly",
    "pp_path": "nft_pp_ck.png",
    "time_ago": "9 hours",
    "amount": "5150",
    "currency": "USD"
  },
  {"bidder":"Rob Mac",
    "pp_path": "nft_pp_rm.png",
    "time_ago": "10 hours",
    "amount": "2.9",
    "currency": "ETH"
  },
  {"bidder":"Ellis Mary",
    "pp_path": "nft_pp_em.png",
    "time_ago": "10 hours",
    "amount": "47.6",
    "currency": "LTC"
  },
  {"bidder":"Deandra Reynolds",
    "pp_path": "nft_pp_dr.png",
    "time_ago": "10 hours",
    "amount": "4242",
    "currency": "USD"
  },
  {"bidder":"Dennis Reynolds",
    "pp_path": "nft_pp_dnr.png",
    "time_ago": "10 hours",
    "amount": "2.5",
    "currency": "ETH"
  },
  {"bidder":"Frank Reynolds",
    "pp_path": "nft_pp_fr.png",
    "time_ago": "11 hours",
    "amount": ".1725",
    "currency": "BTC"
  },
  {"bidder":"Matthew Rickety",
    "pp_path": "nft_pp_mr.png",
    "time_ago": "12 hours",
    "amount": ".1691",
    "currency": "BTC"
  },
  {"bidder":"Leslie Knope",
    "pp_path": "nft_pp_lk.png",
    "time_ago": "12 hours",
    "amount": "4141",
    "currency": "USD"
  },
  {"bidder":"Ann Perkins",
    "pp_path": "nft_pp_ap.png",
    "time_ago": "13 hours",
    "amount": "4000",
    "currency": "USD"
  },
  {"bidder":"April Ludgate",
    "pp_path": "nft_pp_al.png",
    "time_ago": "13 hours",
    "amount": "10000",
    "currency": "XRP"
  },
  {"bidder":"Ron Swanson",
    "pp_path": "nft_pp_rs.png",
    "time_ago": "13 hours",
    "amount": "9999",
    "currency": "XRP"
  },
  {"bidder":"Ben Wyatt",
    "pp_path": "nft_pp_bw.png",
    "time_ago": "14 hours",
    "amount": "8000",
    "currency": "XRP"
  },
  {"bidder":"Andy Dwyer",
    "pp_path": "nft_pp_ad.png",
    "time_ago": "15 hours",
    "amount": "100",
    "currency": "USD"
  },
  {"bidder":"Donna Meagle",
    "pp_path": "nft_pp_dm.png",
    "time_ago": "16 hours",
    "amount": "41",
    "currency": "USD"
  },
  {"bidder":"Jerry Gergich",
    "pp_path": "nft_pp_jg.png",
    "time_ago": "16 hours",
    "amount": "40",
    "currency": "USD"
  }
];

List months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];