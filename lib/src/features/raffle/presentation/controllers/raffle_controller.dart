import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Ticket Quantity Provider
final raffleQuantityProvider = StateProvider<int>((ref) => 1);

// Countdown Timer Provider (Emits a new Duration every second)
final raffleCountdownProvider = StreamProvider.autoDispose<Duration>((ref) {
  // Target date: 3 days, 12 hours, 45 mins from now for demo
  final targetDate = DateTime.now().add(const Duration(days: 3, hours: 12, minutes: 45));

  return Stream.periodic(const Duration(seconds: 1), (_) {
    final remaining = targetDate.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  });
});