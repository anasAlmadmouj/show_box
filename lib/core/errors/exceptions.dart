import 'package:show_box/core/app_imports/app_imports.dart';

class ServerException implements Exception{
  ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});

}