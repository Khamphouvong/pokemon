import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pokemon/core/configs/DI/config_dependencies.dart';
import 'package:pokemon/core/errors/exceptions.dart';
import 'package:pokemon/core/localization/generated/l10n.dart';

class ResponseHelper {
  static Exception returnResponse(DioError dioError) {
    try {
      if (dioError.error.runtimeType == SocketException &&
          dioError.type == DioErrorType.other) {
        return SocketException(dioError.message);
      } else {
        return ServerException(
          dioError.message,
        );
      }
    } catch (e) {
      return ServerException(getIt<I10n>().counterAppBarTitle);
    }
  }
}
