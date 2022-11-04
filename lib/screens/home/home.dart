import 'dart:math';
import 'package:app_iot/constant/images.dart';
import 'package:app_iot/screens/home/components/body.dart';
import 'package:app_iot/widgets/dialog_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app_iot/constant/images.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("SmartFarm"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Ketsana Douangpanya"),
              accountEmail: Text("ketsanadpy@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/IoTLogo.png"),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("SmartFarm1"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("SmartFarm2"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text("About"),
              onTap: () {},
            ),
            Container(
              margin: EdgeInsets.only(top: 300),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("ອອກຈາກລະບົບ"),
                onTap: () => dialogLogout(context),
              ),
            )
          ],
        ),
      ),
      body: Body(),
    );
  }
}
