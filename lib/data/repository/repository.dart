import 'package:nhatlieu/cores/utils/api_utils.dart';
import 'package:nhatlieu/cores/utils/data_Reponse.dart';

class Repository {
  final _apiClient = ApiUtils();

  Future<DataResponse> getAccounts(
      {Map<String, String> headers = const {}}) async {
    return await _apiClient.getAcounts(
      headers: headers,
    );
  }
}
