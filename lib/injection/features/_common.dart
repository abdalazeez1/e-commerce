import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../app/user/domain/entities/response_data.dart';
import '../../common/const/const.dart';
import '../../common/const/const/constant_storage.dart';
import '../../common/services/http_client.dart';
import '../../common/storage.dart';
import '../service_locator.dart';

Future<void> common(BuildContext context) async {
  await _regDioClient();
}

Future<void> _regDioClient() async {
  final storageService = si<IStorageService>();
  final DioClient dioClient = DioClient(kBaseUrl);
  dioClient.interceptors.addAll([
    LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
      requestBody: true,
    ),
    QueuedInterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      final String? string = storageService.getString(KeyStorage.user);
      if (string != null) {
        final token = ResponseData.fromJson(json.decode(string)).token;
        options.headers.addAll({'AUTHORIZATION': addBearer(token)});
      }

      return handler.next(options);
    }),
  ]);

  si.registerSingleton<Dio>(dioClient);
}

String addBearer(String hh) => 'Bearer $hh';
