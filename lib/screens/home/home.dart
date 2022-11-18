import 'dart:math';
import 'package:app_iot/constant/enum.dart';
import 'package:app_iot/constant/images.dart';
import 'package:app_iot/screens/dashboard1/dashboard1.dart';
import 'package:app_iot/screens/dashboard2/dashboard2.dart';
import 'package:app_iot/widgets/dialog_about.dart';
import 'package:app_iot/widgets/dialog_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:app_iot/constant/images.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentPage = DrawerSections.dashboard1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var dashboard;
    if (currentPage == DrawerSections.dashboard1) {
      dashboard = Dashboard1Page();
    } else if (currentPage == DrawerSections.dashboard2) {
      dashboard = Dashboard2Page();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("CEIT-IoT-Lab"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: dashboard,
    );
  }

  Widget MyHeaderDrawer() {
    return const UserAccountsDrawerHeader(
      accountName: Text("Ketsana Douangpanya"),
      accountEmail: Text("ketsanadpy@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage("assets/images/IoTLogo.png"),
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "ໂຮງເຮືອນທີ1", Icons.home,
              currentPage == DrawerSections.dashboard1 ? true : false),
          menuItem(2, "ໂຮງເຮືອນທີ2", Icons.home,
              currentPage == DrawerSections.dashboard2 ? true : false),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              leading: Icon(Icons.account_box),
              title: Text("ກ່ຽວກັບພວກເຮົາ"),
              onTap: () => dialogAbout(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              margin: EdgeInsets.only(top: 300),
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("ອອກຈາກລະບົບ"),
                onTap: () => dialogLogout(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard1;
            } else if (id == 2) {
              currentPage = DrawerSections.dashboard2;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
