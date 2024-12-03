import 'package:dio/dio.dart';
import '../end_points.dart';


class DioHelper {
  static Dio dio = Dio();


  static inti() {
    dio = Dio(BaseOptions(
      responseType: ResponseType.plain,

      baseUrl: BASEURL,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: 50000), // 5 seconds
      receiveTimeout: Duration(milliseconds: 50000), // 3 seconds
    ));
  }

  static Future<Response> getUserProfileData({
    required String url,
    String? token,
  }) async {
    dio.options.headers = {
      // TOKENKEY: token ,
      TOKENKEY:
          token ?? '', //saveToken==null?'':saveToken,//==null?'':token,
    };
    return await dio.get(
      url,
    );
  }

  static Future<Response> getDataOffices({
    required url,
    // Map<String, dynamic>? queres,
    String? token,
  }) async {
    dio.options.headers = {
      TOKENKEY: token ?? '',
    };

    return await dio.get(
      url,
    ); // queryParameters: queres ?? null);
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? queres,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      TOKENKEY: token ?? '',
    }; // queryParameters: queres ?? null);
    return dio.get(url);
  }

  static Future<Response> getDataDetails({
    required url,
    // Map<String, dynamic>? queres,
    String lang = "en",
    String? token,
    String? id,
  }) async {
    dio.options.headers = {
      TOKENKEY: token ?? '',
    };

    return await dio.get(
      url + '?id=' + id!,
    ); // queryParameters: queres ?? null);
  }


  static Future<Response> getAddtionalItems({
    required url,
    // Map<String, dynamic>? queres,
    String lang = "en",
    String? token,
    String? id ,

  }) async {
    dio.options.headers = {
      TOKENKEY: token ?? '',
    };

    return await dio.get(url+'?shipment_id='+id!,);// queryParameters: queres ?? null);
  }

  static Future<Response> getcheckShipmentDestinationFromApi({
    required url,
    // Map<String, dynamic>? queres,
    String lang = "en",
    String? token,
    String? id ,

  }) async {
    dio.options.headers = {
      TOKENKEY: token ?? '',
    };

    return await dio.get(url+'?id='+id!,);// queryParameters: queres ?? null);
  }

  static Future<Response> getDataAuth({required url,
      String? id,
      Map<String, dynamic>? queres,
      String lang = "en",
      // String? token,
      required String login,
      required String password}) async {
    dio.options.headers = {
      //TOKENKEY: token ?? '',
      'login': login,
      'password': password
    };

    return await dio.get(
      url,
      queryParameters: queres ?? null,
    );
  }

  static Future<Response> getDataBranch({
    required url,
    String? id,
    Map<String, dynamic>? queres,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      TOKENKEY: token ?? '',
      'login': 'api_testing',
      'password': 'api_testing'
    };

    return await dio
        .get(url /*+'/?city_id='+id!*/, queryParameters: {'city_id': id});
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token}) async {
    dio.options.headers = {
      TOKENKEY: token ?? "",
    };

    return await dio.post(url, data: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      TOKENKEY: token == null ? '' : token, //==null?'':token,
    };

    return await dio.put(
      url,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    required String? token,
    required String? id,
  }) async {
    dio.options.headers = {TOKENKEY: token ?? ''};
    return await dio.delete(url /*+'/?id='+id!*/, queryParameters: {
      'id': id,
    });
  }

  static Future<Response> getTransactionsDetails({
    required url,
    Map<String, dynamic>? queres,
    String? token,
    String? id,
  }) async {
    dio.options.headers = {
      TOKENKEY: token ?? '',
    };

    return await dio.get(url +'/?id='+id! , queryParameters: {
      'id': id,
    });
  }
  static Future<Response> getLookup({
    required url,
    Map<String, dynamic>? queres,
    String? token,
    String? awb_code,
  }) async {
    dio.options.headers = {
      TOKENKEY: token ?? '',
    };

    return await dio.get(url +'/?awb_code='+awb_code! , queryParameters: {
      'awb_code': awb_code,
    });
  }

  static Future<Response> getWhatsapp({
    required url,
    Map<String, dynamic>? queres,
    String? phone,
  }) async {
    dio.options.headers = {

    };

    return await dio.get(url , queryParameters: {
      'phone': phone,
    });
  }


/*
  static Future<String?> refreshAccessToken() async {
    // Your token refreshing logic
    String updatedToken ="" ;
    print("the user Phone Form Refresh Token is ${userPhone}");
    print("the user Phone Form Refresh Token is ${userPassword}");
    await
    getUserLoginReturnTokenString( userPhone! , userPassword! )!.then((value){
     updatedToken = value;
     print("the Updated Token is ${updatedToken}");
     saveToken = updatedToken;
     return updatedToken ;
    });

  }
*/




}
