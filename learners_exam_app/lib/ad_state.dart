import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io';

class AdState {
  Future<InitializationStatus> initialization;

  AdState(this.initialization);

  String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-4656576342122806/5345423881' //add unit for android
      : 'ca-app-pub-4656576342122806/5988878562'; //add unit for ios

  BannerAdListener get bannerAddListener => _bannerAddListener;

  final BannerAdListener _bannerAddListener = BannerAdListener(
    onAdLoaded: (ad) => print('Add loaded: ${ad.adUnitId}.'),
    onAdClosed: (ad) => print('Add closed: ${ad.adUnitId}.'),
    onAdFailedToLoad: (ad, error) =>
        print('Add failed to load: ${ad.adUnitId}, $error'),
    onAdOpened: (ad) => print('Add opened: ${ad.adUnitId}.'),
    onAdClicked: (ad) => print('Add clicked: ${ad.adUnitId}.'),
  );
}
