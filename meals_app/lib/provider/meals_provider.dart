import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
