import 'package:dio/dio.dart';
import 'package:app_repo/Model/Empresa.dart';

class Api {
   var dio;
  @override
  void initState() {
    //super.initState();

    BaseOptions options = new BaseOptions(
      baseUrl: "https://reqres.in/api",
      connectTimeout: 5000,
    );

    dio = new Dio(options);
  }

  void getEmpresaBd() async {
    Response response = await dio.get("/url/ ");
    Empresa empresa = response.data["data"];
    empresa.toJson();

    
    
  }

  void submitUser() async {

    Response response =
        await dio.post("/users", data: {});
      
    
  }
  
}