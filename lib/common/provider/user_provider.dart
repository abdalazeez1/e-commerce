import 'dart:async';


import 'package:aroundix_store/app/user/domain/entities/response_data.dart';
import 'package:flutter/cupertino.dart';

import '../../app/user/application/facade.dart';

class UserProvider extends ChangeNotifier {
  UserProvider(this._userFacade) {
    _init();
  }

  final UserFacade _userFacade;

  late final StreamSubscription<ResponseData?> _streamSubscription;

  late ResponseData _user;

  void _init() {
    user = _userFacade.user!;
    _streamSubscription = _userFacade.userStream.listen(_listener);
  }

  void _listener(event) {
    if (event != null) {
      user = event;
    }
  }

  ResponseData get user => _user;

  set user(ResponseData user) {
    _user = user;
    notifyListeners();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
