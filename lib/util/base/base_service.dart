// ignore_for_file: constant_identifier_names
import 'dart:io';
import 'package:eticaret/util/constant/http_option.dart';
import 'package:eticaret/util/constant/service_method.dart';
import 'package:eticaret/util/constant/service_path.dart';
import 'package:eticaret/util/management/user_management.dart';
import 'package:http/http.dart';

import 'base_model.dart';

class BaseService {
  bool isAuthEnable;

  BaseService({this.isAuthEnable = true});

  Future<K> request<T extends BaseModel, K extends BaseModel>({
    T? requestModel,
    required K responseModel,
    required ServiceMethod serviceMethod,
    Map<String, String>? extraHeader,
    String? query,
    bool recursive = true,
  }) async {
    if (query != null) {
      query = "/" + query;
    }
    Response? response;
    Uri requestUri =
        Uri.parse(ServicePath.URL + serviceMethod.servicePath + (query ?? ""));

    Map<String, String> header = {};
    if (extraHeader != null) {
      header.addAll(extraHeader);
    }
    // Auth Token Adding To Header
    if (isAuthEnable) {
      if (UserManagement.user?.accessToken != null) {
        header.addAll({
          HttpHeaders.authorizationHeader:
              "Bearer " + UserManagement.user!.accessToken!
        });
      }
      // else {
      //   throw Exception('No User Found Error');
      // }
    }
    header.addAll({HttpHeaders.contentTypeHeader: 'application/json'});

    // Body Adding
    String? requestBody;
    if (requestModel != null) {
      requestBody = requestModel.toJson();
    }

    switch (serviceMethod.httpOption) {
      case HttpOption.GET:
        response = await get(requestUri, headers: header);
        break;
      case HttpOption.POST:
        response = await post(
          requestUri,
          headers: header,
          body: requestBody,
        );
        break;
      case HttpOption.PUT:
        response = await put(
          requestUri,
          headers: header,
          body: requestBody,
        );
        break;
      case HttpOption.DELETE:
        response = await delete(
          requestUri,
          headers: header,
          body: requestBody,
        );
        break;
      default:
    }

    if (response == null) throw Exception('No Response');

    switch (401) {
      // response.statusCode
      case 200:
        responseModel.fromJson(response.body);
        return responseModel;
      case 401:
        // TODO : Aşağıdaki yapı buradan bir şekilde kaldırılmalı
        // if (recursive && UserViewModel.instance != null) {
        //   if (await UserViewModel.instance!.retoken(UserManagement.user)) {
        //     return request<T, K>(
        //       serviceMethod: serviceMethod,
        //       extraHeader: extraHeader,
        //       responseModel: responseModel,
        //     );
        //   }
        // }
        throw Exception('Auth Error ');

      default:
        throw Exception('Response Error');
    }
  }
}
