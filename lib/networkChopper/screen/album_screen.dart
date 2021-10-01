import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_operation/core/model/language.dart';
import 'package:network_operation/core/service/app_localization.dart';
import 'package:network_operation/core/service/fiexedservice.dart';
import 'package:network_operation/core/service/global_service.dart';
import 'package:network_operation/networkChopper/models/album.dart';
import 'package:network_operation/networkChopper/service/album.service.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final albumformkey = GlobalKey<FormState>();
  final mycontroller = TextEditingController();
  Album album = new Album();
  AlbumService? albumSrv;
  Future<Response>? albumRes;
  @override
  void initState() {
    super.initState();
    albumSrv = AlbumService.create();
    // albumRes = albumSrv!.getAllAlbums();
  }

  @override
  void dispose() {
    super.dispose();
    mycontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: albumformkey,
      child: Container(
        width: GlobalService.width(context),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  AppLocalization.of(context)
                      .translate(GlobalService.getLabel(Label.editPost))
                      .toString(),
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: FixedService.primColor,
                      ),
                ),
                SizedBox(height: 10),
                Container(
                  width: GlobalService.width(context) * .9,
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    controller: mycontroller,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(
                      hintText: AppLocalization.of(context)
                          .translate(
                            GlobalService.getLabel(Label.userId),
                          )
                          .toString(),
                      border: OutlineInputBorder(),
                      labelText: AppLocalization.of(context)
                          .translate(
                            GlobalService.getLabel(Label.userId),
                          )
                          .toString(),
                    ),
                    onChanged: (dynamic value) {
                      if (value != null ||
                          value!.isEmpty ||
                          value.replaceAll(' ', '') != '') {
                        setState(() {
                          album.userId = int?.parse(mycontroller.text);
                        });
                      }
                    },
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.replaceAll(' ', '') == '') {
                        return AppLocalization.of(context)
                            .translate(
                              GlobalService.getLabel(Label.userId),
                            )
                            .toString();
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: GlobalService.width(context) * .9,
                  child: TextFormField(
                    //   autofocus: true,
                    decoration: InputDecoration(
                      hintText: AppLocalization.of(context)
                          .translate(
                            GlobalService.getLabel(Label.postTitle),
                          )
                          .toString(),
                      border: OutlineInputBorder(),
                      labelText: AppLocalization.of(context)
                          .translate(
                            GlobalService.getLabel(Label.postTitle),
                          )
                          .toString(),
                    ),
                    onChanged: (String? value) {
                      if (value != null ||
                          value!.isEmpty ||
                          value.replaceAll(' ', '') != '') {
                        setState(() {
                          album.title = value;
                        });
                      }
                    },
                    validator: (String? value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.replaceAll(' ', '') == '') {
                        return AppLocalization.of(context)
                            .translate(
                              GlobalService.getLabel(Label.formTitle),
                            )
                            .toString();
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: GlobalService.width(context) * .9,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        FixedService.primColor,
                      ),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () async {
                      if (albumformkey.currentState!.validate()) {
                        if (album.id != null || album.id != 0) {
                          var albm = {
                            "id": album.id,
                            "userId": album.userId,
                            "title": album.title
                          };
                          var res = await albumSrv!.createAlbum(albm);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Success'),
                            backgroundColor: Colors.green,
                            duration: Duration(microseconds: 5000),
                          ));
                        } else {
                          print('Edit');
                        }
                      }
                    },
                    child: const Text('Save'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
