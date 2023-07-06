import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../index.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // UTM UMS Verification

  /// 사용자 이메일 인증 이메일 발송
  @POST('/user/signin')
  Future<DataResponse<SignInResponse>> signInEmail(@Body() SignInRequest request);
}
