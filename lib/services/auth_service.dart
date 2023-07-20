import 'dart:async';

class AuthService {
  final StreamController<bool> _onAuthStateChange = StreamController<bool>.broadcast();

  Stream<bool> get onAuthStateChange => _onAuthStateChange.stream;

  Future<bool> login() async {
    _onAuthStateChange.add(true);
    return true;
  }

  void logout() {
    _onAuthStateChange.add(false);
  }
}