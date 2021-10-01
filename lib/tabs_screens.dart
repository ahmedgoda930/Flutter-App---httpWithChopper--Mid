import 'package:flutter/material.dart';
import 'package:network_operation/core/service/app_localization.dart';
import 'package:network_operation/core/service/fiexedservice.dart';
import 'package:network_operation/core/service/global_service.dart';
import 'package:network_operation/networkHttp/screen/post_screen.dart';

import 'core/model/language.dart';
import 'core/widget/app_drawer.dart';
import 'home.dart';
import 'networkChopper/screen/album_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _slectedindex = index;
    });
  }

  Label vl = Label.newPost;
  int _slectedindex = 0;
  final List<Map<String, Object>> _screens = [
    {
      'Screen': PostScreen(
        title: Label.newPost,
      ),
      'Title': ''
    },
    {
      'Screen': AlbumScreen(),
      'Title': '',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Home.buildAppBar(context, vl),
      drawer: AppDrawer(),
      body: _screens[_slectedindex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          _selectScreen(index);
          if (_slectedindex == 0) {
            setState(() {
              vl = Label.newPost;
            });
          } else if (_slectedindex == 1) {
            setState(() {
              vl = Label.newAlbum;
            });
          }
        },
        selectedItemColor: FixedService.secColor,
        unselectedItemColor: Colors.white,
        currentIndex: _slectedindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.post_add,
            ),
            label: AppLocalization.of(context)
                .translate(GlobalService.getLabel(Label.newPost)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.album,
            ),
            label: AppLocalization.of(context)
                .translate(GlobalService.getLabel(Label.newAlbum)),
          ),
        ],
        backgroundColor: FixedService.primColor,
      ),
    );
  }
}
