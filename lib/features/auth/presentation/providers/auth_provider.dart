import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final String? username;
  final String? token;

  AuthState({this.username, this.token});

  bool get isAuthenticated => token != null;
}

class AuthNotifier extends Notifier<AuthState> {

  @override
  AuthState build() {
    return AuthState();
  }

  void login(String username) {
    state = AuthState(
      username: username,
      token: "abc123",
    );
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider =
    NotifierProvider<AuthNotifier, AuthState>(
        AuthNotifier.new);