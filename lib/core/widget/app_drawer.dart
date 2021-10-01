import 'package:flutter/material.dart';
import 'package:network_operation/core/service/fiexedservice.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: FixedService.primColor,
                // image: DecorationImage(
                //   image: AssetImage("assets/imgs/weblogo.png"),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.home),
                  ),
                  title: Text(
                    'Ahmed Goda',
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Software Engineer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.post_add,
                color: Colors.black,
              ),
              title: Text(
                'Posts',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(FixedService.postList);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.album,
                color: Colors.black,
              ),
              title: Text(
                'Albums',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(FixedService.albumList);
              },
            ),
          ],
        ),
      ),
    );
  }
}
