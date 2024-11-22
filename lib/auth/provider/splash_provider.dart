import 'package:flutter/cupertino.dart';
import 'package:mystore/auth/comman/sevice/storage_helper.dart';

class SplashProvider extends ChangeNotifier{
  bool isloggedIn=false;

  Future<bool> checkLogged()async{
    String? token=await StorageHelper.getToken();
    if(token!=null){
      isloggedIn=true;

    }else{
      isloggedIn=false;
    }
    return isloggedIn;
  }
}