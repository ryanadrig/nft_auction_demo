import 'package:flutter/material.dart';
import 'package:nft_auction/nft_home.dart';


void main() {
  runApp(const MyApp());
}

class CustomError extends StatelessWidget {
  CustomError({Key? key, this.errorDetails}) : super(key: key);
  FlutterErrorDetails? errorDetails;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          color: Colors.tealAccent,
          child: Center(
              child: Text(errorDetails.toString(),
                  style: TextStyle(color: Colors.black))))
    ]);
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT Auction Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
        builder: (BuildContext context, Widget? widget) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return CustomError(errorDetails: errorDetails);
          };
          return widget!;
        },
      home: NFT_Home(),
    );
  }
}

