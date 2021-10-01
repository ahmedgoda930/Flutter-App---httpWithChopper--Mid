import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_operation/core/model/language.dart';
import 'package:network_operation/core/service/app_localization.dart';
import 'package:network_operation/core/service/fiexedservice.dart';
import 'package:network_operation/core/service/global_service.dart';
import 'package:network_operation/networkHttp/models/post.dart';
import 'package:network_operation/networkHttp/service/post.service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key, this.title}) : super(key: key);
  final Label? title;
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final postformkey = GlobalKey<FormState>();
  final mycontroller = TextEditingController();
  Post post = new Post();
  @override
  void dispose() {
    super.dispose();
    mycontroller.dispose();
  }

  @override
  void initState() {
    super.initState();
    mycontroller.addListener(setLatest);
  }

  var txt = '0';
  setLatest() {
    setState(() {
      txt = mycontroller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Form(
        key: postformkey,
        child: Container(
          width: GlobalService.width(context),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    AppLocalization.of(context)
                        .translate(GlobalService.getLabel(Label.newPost))
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
                            txt = value;
                            post.userId = int?.parse(mycontroller.text);
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
                            post.title = value;
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
                    child: TextFormField(
                      maxLines: 5,

                      //   autofocus: true,
                      decoration: InputDecoration(
                        hintText: AppLocalization.of(context)
                            .translate(
                              GlobalService.getLabel(Label.formContent),
                            )
                            .toString(),
                        border: OutlineInputBorder(),
                        labelText: AppLocalization.of(context)
                            .translate(
                              GlobalService.getLabel(Label.formContent),
                            )
                            .toString(),
                      ),
                      onChanged: (String? value) {
                        if (value != null ||
                            value!.isEmpty ||
                            value.replaceAll(' ', '') != '') {
                          setState(() {
                            post.body = value;
                          });
                        }
                      },
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.replaceAll(' ', '') == '') {
                          return AppLocalization.of(context)
                              .translate(
                                GlobalService.getLabel(Label.formContent),
                              )
                              .toString();
                        }
                        return null;
                      },
                    ),
                  ),
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
                        if (postformkey.currentState!.validate()) {
                          PostService postSrv = new PostService();
                          if (post.id == null || post.id == 0) {
                            if (await postSrv.add(post))
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Success')));
                            else
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Faild')));
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
      ),
    );
  }

  // ignore: unused_element
  void _saveData(Post post) async {
    PostService postSrv = new PostService();
    if (post.id == null || post.id == 0) {
      if (await postSrv.add(post))
        print('Succes');
      else
        print('Faild');
    } else {
      print('Edit');
    }
  }
}
