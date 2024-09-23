import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import 'SallerHomepage.dart';
import 'SallerProfile.dart';
import 'SallerWallet.dart';
import 'SalllerCustomerSupport.dart';


class SallerHomPage extends StatefulWidget {
  const SallerHomPage({Key? key}) : super(key: key);

  @override
  State<SallerHomPage> createState() => _SallerHomPageState();
}

class _SallerHomPageState extends State<SallerHomPage> {


  @override
  Widget build(BuildContext context) {

    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.support_agent),
              label: 'Customer Support'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.wallet),
              label: 'Wallet'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person),
              label: 'Profile'
          ),

        ]),


        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child:

                  SallerHome());
                },
              );
            case 1:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child:

                  Salllercustomersupport());
                },
              );
            case 2:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child:

                  Sallerwallet());
                },
              );
            case 3:
              return CupertinoTabView(
                builder: (context) {
                  return CupertinoPageScaffold(child:

                  Sallerprofile());
                },
              );
          }

          return Container();
        });
  }


}




