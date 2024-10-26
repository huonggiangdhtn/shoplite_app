import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shoplite/constants/pref_data.dart';
import 'package:shoplite/repositories/auth_repository.dart';
import 'dart:convert';

import '../constants/apilist.dart';
import '../constants/enum.dart';
import '../models/profile.dart';

// Định nghĩa trạng thái cho quá trình đăng nhập

// Provider để quản lý trạng thái đăng nhập
class LoginNotifier extends StateNotifier<LoginStatus> {
  LoginNotifier(this._repository) : super(LoginStatus.initial);
  final AuthRepository _repository;
  Future<void> login(String email, String password) async {
    state = LoginStatus.loading;
    bool kq = await _repository.login(email, password);
    if (kq == true) {
      PrefData.setLogIn(true);
      state = LoginStatus.success;
    } else
      state = LoginStatus.error;
  }
}

// Provider cho ProfileNotifier
final authRepositoryProvider = Provider((ref) => AuthRepository());

final loginProvider = StateNotifierProvider<LoginNotifier, LoginStatus>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginNotifier(repository);
});
