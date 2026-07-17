import 'package:flutter_riverpod/legacy.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tracks the selected filter ('All', 'Active', 'Stock Out')
final inventoryFilterProvider = StateProvider<String>((ref) => 'All');
