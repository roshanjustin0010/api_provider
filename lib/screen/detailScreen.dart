import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.searchedlist['fname']"),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Card(
          color: Colors.deepPurple,
          margin: const EdgeInsets.all(50.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage("widget.searchedlist['pic']"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ID',
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "widget.searchedlist['id'].toString()",
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'First Name ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "widget.searchedlist['fname']",
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Last Name ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "widget.searchedlist['lname']",
                      style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'E-Mail ',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "widget.searchedlist['email']",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
