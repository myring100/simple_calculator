import 'package:flutter/material.dart';
import 'keyboard.dart';
import 'inputPage.dart';
import 'package:simple_calculator/resultPage.dart';
import 'menuWidget.dart';
import 'my-globals.dart' as global;
import 'calculator.dart';
import 'ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<CalculatorPage> {

  BannerAd? _bannerAd;

  @override
  void initState() {
    // TODO: Load a banner ad
    print('initState');
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            print('banner ad set');
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    print('width = $width Height = $height');
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            Flexible(flex: 2, child: InputPage()),
        Flexible(flex: 2, child: ResultPage()),
        Flexible(
            flex: 1,
            child: MenuWidget(
              buttonPressed: () =>
                  setState(() {
                    try {
                      complete();
                    } catch (error) {
                      print('error here!!!!!!!!!');
                    }
                  }),
            )),
        Flexible(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Keyboard(
              buttonPressed: () =>
                  setState(() {
                    try {
                      complete();
                      print('global result = ${global.resultString}');
                    } catch (error) {
                      print('error here!!!!!!!!!');
                    }
                  }),
            ),
          ),
        ),
        if (_bannerAd != null) Flexible(
      flex: 1,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: _bannerAd!.size.width.toDouble(),
          height: _bannerAd!.size.height.toDouble(),
          child: AdWidget(ad: _bannerAd!),
        ),
      ),
    )
    ],
    )
    ,
    );
  }
}

void complete() {
  String input = global.input;
  final calculator = Calculator();
  double result = calculator.initCalculate(input);
  print('result = ${result.toString()}');

  global.resultString = result.toString();
}
