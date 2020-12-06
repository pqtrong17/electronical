import 'package:electrical/ui/admin/inspection_page.dart';
import 'package:electrical/ui/admin/home_admin.dart';
import 'package:electrical/ui/leader/owner_home_page.dart';
import 'package:electrical/ui/login/login_page.dart';
import 'package:electrical/ui/member/member_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isLogin = pref.getBool("isLogin");
  int level = pref.getInt("level");
  String name = pref.getString("name");
  print(pref.getString("token"));
  runApp(MaterialApp(
    home: isLogin != null && isLogin
        ? level == 1
            ? MemberPage(name)
            : level == 2
                ? OwnerHomePage(name)
                : HomeAdmin(name)
        : LoginPage(),
  ));
}
