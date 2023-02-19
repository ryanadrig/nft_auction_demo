import 'package:flutter/material.dart';

Size ss = Size(0,0);
Color primaryColor = Colors.green[900]!;
Color snb_border_color = Colors.lightGreenAccent;
Color snb_shadow_color = Colors.lightGreenAccent[700]!;
Color detail_bg_color = Colors.grey[300]!;


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
    "current_bid": "244.34"
  },
  {"title": "Lit Astronaut",
    "desc": "Some say his lights harness the power of the sun itself. Want to own the lit astronaut? Bidding is open. Bid with multiple crypto currencies or a variety of payment options.",
    "artist": "L1ght5p33D",
    "img_path":"assets/images/nft_asset2.png",
    "auction_end": "07:07:07",
    "current_bid": "444.56"
  },
  {"title": "Retro Spacemen",
    "desc": "They're from a time with better music and no physics. Want to own the retro spacemen? Bidding is open. Bid with multiple crypto currencies or a variety of payment options.",
    "artist": "L1ght5p33D",
    "img_path":"assets/images/nft_asset3.png",
    "auction_end": "12:13:14",
    "current_bid": "44.5"
  },
  {"title": "Abstractonaut",
    "desc": "He's warped into another dimension, and can't seem to get back. Want to own the abstractonaut? Bidding is open. Bid with multiple crypto currencies or a variety of payment options.",
    "artist": "L1ght5p33D",
    "img_path":"assets/images/nft_asset4.png",
    "auction_end": "01:00:10",
    "current_bid": "554.00"
  }


];

List<Map> bd = [
  {"bidder":"Jean-Ralphio Saperstein",
    "time_ago": "8 hours",
    "amount": "3.3",
    "currency": "ETH"
  },
  {"bidder":"Chris Traeger",
    "time_ago": "9 hours",
    "amount": "3.1",
    "currency": "ETH"
  },
  {"bidder":"Charlie Kelly",
    "time_ago": "9 hours",
    "amount": "5150",
    "currency": "USD"
  },
  {"bidder":"Rob Mac",
    "time_ago": "10 hours",
    "amount": "2.9",
    "currency": "ETH"
  },
  {"bidder":"Ellis Mary",
    "time_ago": "10 hours",
    "amount": "47.6",
    "currency": "LTC"
  },
  {"bidder":"Deandra Reynolds",
    "time_ago": "10 hours",
    "amount": "4242",
    "currency": "USD"
  },
  {"bidder":"Dennis Reynolds",
    "time_ago": "10 hours",
    "amount": "2.5",
    "currency": "ETH"
  },
  {"bidder":"Frank Reynolds",
    "time_ago": "11 hours",
    "amount": ".1725",
    "currency": "BTC"
  },
  {"bidder":"Matthew Rickety",
    "time_ago": "12 hours",
    "amount": ".1691",
    "currency": "BTC"
  },
  {"bidder":"Leslie Knope",
    "time_ago": "12 hours",
    "amount": "4141",
    "currency": "USD"
  },
  {"bidder":"Ann Perkins",
    "time_ago": "13 hours",
    "amount": "4000",
    "currency": "USD"
  },
  {"bidder":"April Ludgate",
    "time_ago": "13 hours",
    "amount": "10000",
    "currency": "XRP"
  },
  {"bidder":"Ron Swanson",
    "time_ago": "13 hours",
    "amount": "9999",
    "currency": "XRP"
  },
  {"bidder":"Ben Wyatt",
    "time_ago": "14 hours",
    "amount": "8000",
    "currency": "XRP"
  },
  {"bidder":"Andy Dwyer",
    "time_ago": "15 hours",
    "amount": "100",
    "currency": "USD"
  },
  {"bidder":"Donna Meagle",
    "time_ago": "16 hours",
    "amount": "41",
    "currency": "USD"
  },
  {"bidder":"Jerry Gergich",
    "time_ago": "16 hours",
    "amount": "40",
    "currency": "USD"
  }
];