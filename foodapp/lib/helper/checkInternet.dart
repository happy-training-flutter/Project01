import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternet() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  print('CONNNNECITON>>>>>>>');
  print(connectivityResult);

  if (connectivityResult.contains(ConnectivityResult.wifi)) {
    print('WIFI CONNECTED');
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.mobile)) {
    print('MOBILE DATA CONNECTED');
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    print('ETHERNET CONNECTED');  
    return true;
  } else {
    print('NO CONNECTION');
    return false;
  }
}