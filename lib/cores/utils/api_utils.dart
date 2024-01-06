import 'package:dio/dio.dart';
import 'package:nhatlieu/cores/errors/exception.dart';
import 'package:nhatlieu/cores/network/network_Interceptor.dart';
import 'package:nhatlieu/cores/network/network_info.dart';
import 'package:nhatlieu/cores/utils/ProgressDialogUtils.dart';
import 'package:nhatlieu/cores/utils/api_constants.dart';
import 'package:nhatlieu/cores/utils/data_Reponse.dart';
import 'package:nhatlieu/cores/utils/logger.dart';

class ApiUtils {
  factory ApiUtils() {
    return _apiClient;
  }

  ApiUtils._internal();

  var url = ApiConstants.baseUrl;

  static final ApiUtils _apiClient = ApiUtils._internal();

  final _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
  ))
    ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    return false;
  }

  Future<DataResponse> getAcounts(
      {Map<String, String> headers = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/getAccounts',
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return DataResponse.fromJson(response.data);
      } else {
        throw response.data != null
            ? DataResponse.fromJson(response.data)
            : 'Có lỗi xảy ra!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
