import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:regressprovider/constants.dart';
class DataSources{

  Future <Either<String,dynamic>> dataSources() async{
    print("hello");


    final response= await http.get(Uri.parse("${Constants.baseUrl}/api/users?page=2"));

    if(response.statusCode == 200)
      {
        print("done");
        print(response.body);
        return Right(jsonDecode(response.body));
      }
    else{
      return const Left("Nothing to show");
    }

  }
}