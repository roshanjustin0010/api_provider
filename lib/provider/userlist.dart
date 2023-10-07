import 'package:flutter/material.dart';
import 'package:regressprovider/data/repositories/repositories.dart';

import '../data/modal/ListModel.dart';

class UserListProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isError = false;
  bool _isLoaded = false;
  ProfileList? _profileList;

  bool get isLoading => _isLoading;
  bool get isLoaded => _isLoaded;
  bool get isLError => _isError;
  ProfileList? get profileList => _profileList;

  void getUserList() async {
    _isLoading = true;
    notifyListeners();
    final response = await Repositories().repositories();


    if (response.isRight()) {
      _isLoading = false;
      _isLoaded = true;
      response.fold((l) => null, (r) => _profileList = r);
      notifyListeners();
    } else {
      _isLoading = false;
      _isError = true;
      notifyListeners();
    }
  }
}
