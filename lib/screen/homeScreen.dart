import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regressprovider/provider/searchUser.dart';
import 'package:regressprovider/provider/userlist.dart';

import 'detailScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserListProvider>(context,listen: false).getUserList();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 40,
              width: 250,
              // color: Colors.green,
              child: TextField(
                onChanged: (value) {
                  print(value);
                  if(value.isEmpty){
                    Provider.of<SearchUserProvider>(context,listen: false).searchUser(Provider.of<UserListProvider>(context,listen: false).profileList!.data!, "");
                  }
                  else{
                    Provider.of<SearchUserProvider>(context,listen: false).searchUser(Provider.of<UserListProvider>(context,listen: false).profileList!.data!, value);
                  }

                },
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    label: const Text('Search'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ],
        ),
      ),
      body:
      Consumer<UserListProvider>(
        builder: (context,userListProvider,child) {
          if(userListProvider.isLoaded == true){
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Provider.of<SearchUserProvider>(context,listen: false).searchUser(userListProvider.profileList!.data!, "");
            });
          return  Consumer<SearchUserProvider>(
            builder: (context,searchProvider,child) {
              return SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: searchProvider.userList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(data: searchProvider.userList[index],)),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.deepPurple,
                            child:  Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                     searchProvider.userList[index].avatar!,
                                      // foundperson[index]['avatar'],
                                    ),
                                    radius: 40.0,
                                  ),
                                  Text(
                                    searchProvider.userList[index].firstName!+" "+
                                        searchProvider.userList[index].lastName!,

                                    // foundperson[index]['first_name'].toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
            }
          );

          }
          else if(userListProvider.isLError == true){
            return const Center(
              child: Text("SomeThing went wrong"),
            );
            
          }
          else{
            return const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
      )


    );
  }
}
