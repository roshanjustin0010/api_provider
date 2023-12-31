import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressprovider/provider/searchUser.dart';
import 'package:regressprovider/provider/userlist.dart';
import 'package:regressprovider/screen/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<UserListProvider>(create: (context) => UserListProvider()),
          ChangeNotifierProvider<SearchUserProvider>(create: (context) => SearchUserProvider()),

        ],
        child: HomeScreen()
      ),
    );
  }
}
