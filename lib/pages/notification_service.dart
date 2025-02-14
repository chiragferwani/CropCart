import 'package:flutter/material.dart';

class NotificationService extends ChangeNotifier {
  static final List<String> _notifications = [];

  List<String> get notifications => _notifications;

  void addNotification(String message) {
    _notifications.add(message);
    notifyListeners(); // UI Update Trigger
  }
}

final notificationService = NotificationService();

