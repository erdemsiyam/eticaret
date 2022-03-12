// ignore_for_file: non_constant_identifier_names

import 'http_option.dart';
import 'service_path.dart';

class ServiceMethod {
  String servicePath;
  HttpOption httpOption;
  ServiceMethod._private(this.servicePath, this.httpOption);

  static ServiceMethod SIGNUP =
      ServiceMethod._private(ServicePath.SINGUP, HttpOption.POST);
  static ServiceMethod TOKEN =
      ServiceMethod._private(ServicePath.TOKEN, HttpOption.POST);
  static ServiceMethod RETOKEN =
      ServiceMethod._private(ServicePath.RETOKEN, HttpOption.GET);
  static ServiceMethod GET_NOTES =
      ServiceMethod._private(ServicePath.NOTES, HttpOption.GET);
  static ServiceMethod CREATE_NOTE =
      ServiceMethod._private(ServicePath.NOTE, HttpOption.POST);
  static ServiceMethod UPDATE_NOTE =
      ServiceMethod._private(ServicePath.NOTE, HttpOption.PUT);
  static ServiceMethod DELETE_NOTE =
      ServiceMethod._private(ServicePath.NOTE, HttpOption.DELETE);
}
