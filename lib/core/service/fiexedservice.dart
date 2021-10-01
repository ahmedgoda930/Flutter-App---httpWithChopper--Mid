import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:network_operation/core/screens/animate_splash.dart';
import 'package:network_operation/networkChopper/screen/album_list.dart';
import 'package:network_operation/networkHttp/screen/post_edit_screen.dart';
import 'package:network_operation/networkHttp/screen/post_list.dart';
import 'package:network_operation/tabs_screens.dart';

import '../../home.dart';
import '/core/model/language.dart';

class FixedService {
  //Language and Transltion
  static const String usFlag = '🇺🇸'; //'assets/icons/uk.png';
  static const String trFlag = '🇹🇷'; //'assets/icons/tr.png';
  static const String egFlag = '🇪🇬'; //'assets/icons/eg.png';
  // static const Map<String, String> Translate = {
  //   'title': 'title',
  //   'body': 'body',
  // };
  static List<TranslateLabel> transLabel = [
    new TranslateLabel(Label.title, "title"),
    new TranslateLabel(Label.body, "body"),
    new TranslateLabel(Label.albumList, "albumList"),
    new TranslateLabel(Label.newPost, "newPost"),
    new TranslateLabel(Label.newAlbum, "newAlbum"),
    new TranslateLabel(Label.postList, "postList"),
    new TranslateLabel(Label.postContent, "postContent"),
    new TranslateLabel(Label.editAlbum, "editAlbum"),
    new TranslateLabel(Label.editPost, "editPost"),
    new TranslateLabel(Label.postTitle, "postTitle"),
    new TranslateLabel(Label.formContent, "formContent"),
    new TranslateLabel(Label.formTitle, "formTitle"),
    new TranslateLabel(Label.userId, "userId"),
  ];
  static List<Language> lang = [
    new Language(
      id: LanguageId.ar,
      dir: 'rtl',
      isRTL: true,
      icon: egFlag,
      langcode: 'ar',
      name: 'عربى',
    ),
    new Language(
      id: LanguageId.en,
      dir: 'ltr',
      isRTL: false,
      icon: usFlag,
      langcode: 'en',
      name: 'English',
    ),
    new Language(
      id: LanguageId.tr,
      dir: 'ltr',
      isRTL: false,
      icon: trFlag,
      langcode: 'tr',
      name: 'Turkish',
    ),
  ];

  /// *******************************************************/
  /// Url
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  /// *******************************************************/
  /// Colors
  static const Color primColor = Color(0xfff1e1e99);
  static const Color secColor = Color(0xfffff70a3);
  static const Color bgColor = Colors.white;

  /// *******************************************************/
  /// Fonts
  static var fontbold = GoogleFonts.roboto(fontWeight: FontWeight.bold);
  static var fontregular = GoogleFonts.roboto();
  static var fontitalic = GoogleFonts.roboto(fontStyle: FontStyle.italic);

  /// *******************************************************/
  /// TextStyles
  static TextStyle brightSmallText = TextStyle(
    color: Colors.white,
    // fontSize: 25,
    // fontFamily: GoogleFonts.roboto().fontFamily,
  );

  /// *******************************************************/
  /// Routes
  static String splash = '/';
  static String tabsscreen = '/tabs';
  static String home = '/home';
  static String postList = '/post-list';
  static String postOperation = '/post-operation';
  static String albumOperation = '/album-operation';
  static String albumList = '/album-list';
  static String editpost = '/edit-post';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => AnimateSplash(),
    tabsscreen: (context) => TabsScreen(),
    home: (context) => Home(),
    splash: (context) => AnimateSplash(),
    splash: (context) => AnimateSplash(),
    postList: (context) => PostListScreen(),
    editpost: (context) => PostEditScreen(),
    albumList: (context) => AlbumListScreen(),
  };
}
