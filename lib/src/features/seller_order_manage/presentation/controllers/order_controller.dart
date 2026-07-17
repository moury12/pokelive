import 'package:flutter_riverpod/legacy.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tracks the currently selected order tab (0 = To Ship, 1 = Shipped, 2 = Completed)
final orderTabProvider = StateProvider<int>((ref) => 0);
