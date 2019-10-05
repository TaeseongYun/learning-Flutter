// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$LoginApiService extends LoginApiService {
  _$LoginApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = LoginApiService;

  Future<Response> getLoginPost(Map<String, dynamic> body) {
    final $url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithIdp?key=AIzaSyDwh3AQ9xa6VtUiFp5sxSiXmw4VfO4RVas';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
