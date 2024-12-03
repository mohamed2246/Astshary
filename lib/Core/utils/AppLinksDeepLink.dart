/*
import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

class AppLinksDeepLink {
  AppLinksDeepLink._privateConstructor();

  static final AppLinksDeepLink _instance = AppLinksDeepLink._privateConstructor();

  static AppLinksDeepLink get instance => _instance;

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  void initDeepLinks() {
    _appLinks = AppLinks();
    _setupDeepLinks();
  }

  Future<void> _setupDeepLinks() async {
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      _handleDeepLink(appLink);
    }

    _linkSubscription = _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _handleDeepLink(uri);
      }
    }, onError: (err) {
      debugPrint('Deep link error: $err');
    });
  }

  void _handleDeepLink(Uri uri) {
    print('Received deep link: $uri');
    // Handle the deep link here
    // Example: if (uri.path == '/doctorprofile') { // Navigate to Doctor Profile }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
*/
