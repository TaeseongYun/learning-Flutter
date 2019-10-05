import 'package:chopper/chopper.dart';
import 'package:forth_shop_app/http/api_key.dart';

part 'login_api_service.chopper.dart';

@ChopperApi(baseUrl: '/v1/accounts:signInWithIdp?key=${APIKEY.API_KEY}')
abstract class LoginApiService extends ChopperService {
  @Post()
  Future<Response> getLoginPost(
    @Body() Map<String, dynamic> body,
  );

  static LoginApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://identitytoolkit.googleapis.com',
        services: [_$LoginApiService()],
        converter: JsonConverter());
  }
}
