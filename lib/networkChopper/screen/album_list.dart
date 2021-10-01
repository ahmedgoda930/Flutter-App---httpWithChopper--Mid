import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:network_operation/core/model/language.dart';
import 'package:network_operation/core/service/fiexedservice.dart';
import 'package:network_operation/networkChopper/service/album.service.dart';

import '../../home.dart';

class AlbumListScreen extends StatefulWidget {
  const AlbumListScreen({Key? key}) : super(key: key);

  @override
  _AlbumListScreenState createState() => _AlbumListScreenState();
}

class _AlbumListScreenState extends State<AlbumListScreen> {
  AlbumService? albumSrv;
  Future<Response>? albumRes;
  @override
  void initState() {
    super.initState();
    albumSrv = AlbumService.create();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Home.buildAppBar(context, Label.albumList),
      body: FutureBuilder<Response>(
        future: albumRes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> lst = json.decode(snapshot.data!.bodyString);
            // if (lst.length > 0) {
            //   var albums = lst.map<Album>((item) => ).toList();
            // }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Center(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Id')),
                    DataColumn(label: Text('User ID')),
                    DataColumn(label: Text('Album Name')),
                  ],
                  rows: loadRows(lst),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('There is an error');
          }
          return Center(
            child: CircularProgressIndicator(
              color: FixedService.primColor,
              strokeWidth: 3,
            ),
          );
        },
      ),
    );
  }

  List<DataRow> loadRows(List<dynamic> data) {
    return data
        .map((e) => DataRow(cells: [
              DataCell(Text(e["id"].toString())),
              DataCell(Text(e["userId"].toString())),
              DataCell(Text(e["title"].toString())),
            ]))
        .toList();
  }

  Future<bool> delete(int id) async {
    var res = await albumSrv!.deleteAlbum(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Success')));
    return true;
  }
}
