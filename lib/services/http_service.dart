import 'package:coincap_udemy/models/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HttpService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HttpService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
    // print(_base_url);
  }

  Future<Response?> get(String _path) async {
    try {
      String _url = "$_base_url$_path";
      // print(_url);
      Response _response = await dio.get(_url);
      // print(_response);
      return _response;
    } catch (e) {
      print("HTTPService: Unable to perform get request");
      print(e);
    }
  }
}
