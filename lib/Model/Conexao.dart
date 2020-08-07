import 'package:connectivity/connectivity.dart';
class Conexao2 {

  String _connection = "";
final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    //super.initState();

    _connectivity.checkConnectivity().then((connectivityResult){_updateStatus(connectivityResult);});

  }

void _updateStatus(ConnectivityResult connectivityResult) async{
    if (connectivityResult == ConnectivityResult.mobile) {
        updateText("3G/4G");
      } else if (connectivityResult == ConnectivityResult.wifi) {
        String wifiName = await _connectivity.getWifiName();
        String wifiSsid = await _connectivity.getWifiBSSID();
        String wifiIp = await _connectivity.getWifiIP();
        updateText("Wi-Fi\n$wifiName\n$wifiSsid\n$wifiIp");
      }else{
        updateText("Não Conectado!");
      }
  }

void updateText(String texto){
    
      _connection = texto;
    
  }
  
}