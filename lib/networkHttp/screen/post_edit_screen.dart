import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:network_operation/core/model/language.dart';
import 'package:network_operation/core/service/app_localization.dart';
import 'package:network_operation/core/service/fiexedservice.dart';
import 'package:network_operation/core/service/global_service.dart';
import 'package:network_operation/home.dart';
import 'package:network_operation/networkHttp/models/post.dart';
import 'package:network_operation/networkHttp/service/post.service.dart';

class PostEditScreen extends StatefulWidget {
  const PostEditScreen({Key? key}) : super(key: key);

  @override
  _PostEditScreenState createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {
  final postformkey = GlobalKey<FormState>();
  final mycontroller = TextEditingController();
  final bodycontroller = TextEditingController();
  final titlecontroller = TextEditingController();
  Post post = new Post();
  @override
  void dispose() {
    super.dispose();
    mycontroller.dispose();
    titlecontroller.dispose();
    bodycontroller.dispose();
  }

  @override
  void initState() {
    super.initState();
    //mycontroller.addListener(setLatest);
  }

  var txt = '0';
  setLatest() {
    setState(() {
      txt = mycontroller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    post = ModalRoute.of(context)!.settings.arguments as Post;
    mycontroller.text = post.userId.toString();
    titlecontroller.text = post.title.toString();
    bodycontroller.text = post.body.toString();
    return Scaffold(
        appBar: Home.buildAppBar(context, Label.editPost),
        body: Padding(
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
                          controller: titlecontroller,
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
                          controller: bodycontroller,
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
                              if (post.id != null || post.id != 0) {
                                if (await postSrv.edit(post)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Success')));
                                } else
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
        ));
  }
}
