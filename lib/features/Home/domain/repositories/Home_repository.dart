import 'package:aji/features/Home/data/models/slider_response.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, SliderResponse>> getSliderData(Map<String, String> queryParameters);
}
