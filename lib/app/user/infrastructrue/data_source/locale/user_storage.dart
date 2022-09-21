import 'dart:async';
import 'dart:convert';


import 'package:aroundix_store/app/user/domain/entities/response_data.dart';

import '../../../../../common/const/const/constant_storage.dart';
import '../../../../../common/storage.dart';

class UserStorage extends TStorage<ResponseData> with TStorageStreamMixin {
  final IStorageService storageService;

  UserStorage(this.storageService) : super();

  @override
  FutureOr<void> delete() async {
    super.delete();
    await storageService.remove(KeyStorage.user);
  }

  @override
  FutureOr<void> write(ResponseData? value) async {
    super.write(value);
    final data = value != null ? json.encode(value.toJson()) : null;
    await storageService.setString(
      KeyStorage.user,
      data,
    );
  }

  @override
  ResponseData? read() {
    final String? string = storageService.getString(KeyStorage.user);
    if (string != null) {
      return ResponseData.fromJson(json.decode(string));
    }
    return null;
  }
}
