import 'package:aji/features/Home/data/models/slider_response.dart';

import '../../../../core/config/Strings/api_endpoint.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_services.dart';

abstract class HomeRemoteSource {
  Future<SliderResponse?> getSliderData(Map<String, String> queryParameters);
}

class HomeRemoteSourceImpl implements HomeRemoteSource {
  final ApiMethod apiMethod;
  HomeRemoteSourceImpl({required this.apiMethod});

  @override
  Future<SliderResponse?> getSliderData(
      Map<String, String> queryParameters) async {
    try {
      final result = await apiMethod.get(
          url: ApiEndpoint.GET_SLIDER_DATA,
          showResult: true,
          isBasic: false,
          duration: 30,
          queryParams: queryParameters);
      return SliderResponse.fromJson(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

}
