import 'package:flutter_riverpod/legacy.dart';

// 0 = Store (Products), 1 = Reviews
final storeTabProvider = StateProvider<int>((ref) => 0);
