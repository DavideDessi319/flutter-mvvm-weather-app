import 'package:flutter/material.dart';

class ScrollStateProvider extends ChangeNotifier {
  bool _isSliverThresholdScrolled = false;

  ScrollStateProvider();

  bool get isSliverThresholdScrolled => _isSliverThresholdScrolled;

  void setIsSliverThresholdScrolled(bool isSliverThresholdScrolled) {
    _isSliverThresholdScrolled = isSliverThresholdScrolled;
    notifyListeners();
  }
}
