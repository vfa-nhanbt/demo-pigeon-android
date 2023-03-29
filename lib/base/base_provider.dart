import 'package:flutter/material.dart';

abstract class BaseProvider extends ChangeNotifier {
  bool _disposed = false;
  bool _isLoading = false;

  void showLoading() {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    if (!_isLoading) return;
    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (_disposed) return;
    super.notifyListeners();
  }
}
