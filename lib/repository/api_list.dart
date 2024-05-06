import "package:dio/dio.dart";
import"../models/list_data_model.dart";

class GetListApi{
  Future<List<Datum>> getobjectlistapi() async{
    Dio dio = Dio();

    Response response= await dio.get("https://bhujelrajib.com.np/api/question");
    print(response.data);
    print(response.statusCode);

    List<Datum> data=[];

    if (response.statusCode == 200) {
      data = (response.data)["data"]
          .map<Datum>(
              (e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList();
          print(data);
    }
    return data;
  }
}

    
    

  