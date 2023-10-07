
import 'package:flutter/material.dart';

import '../data/modal/ListModel.dart';

class SearchUserProvider extends ChangeNotifier{

  List <Data> _userList=[];

  List <Data> get userList => _userList;

  void searchUser( List <Data> data,String search){
    _userList=[];
  print("call");
    for(int i=0;i<data.length;i++){
      if(data[i].firstName!.toLowerCase().contains(search.toLowerCase()) || data[i].lastName!.toLowerCase().contains(search.toLowerCase()) ){
        _userList.add(data[i]);
      }
    }
    print(_userList);
    notifyListeners();
  }
}