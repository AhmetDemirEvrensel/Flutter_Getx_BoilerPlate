import 'package:flutter_getx_boilerplate/api/models/request/login_request.dart';
import 'package:flutter_getx_boilerplate/api/models/request/register_request.dart';
import 'package:flutter_getx_boilerplate/api/models/response/login_response.dart';
import 'package:flutter_getx_boilerplate/api/models/response/register_response.dart';

abstract class BaseApiRepository {
  Future<RegisterResponse> register(RegisterRequest request);
  Future<LoginResponse> login(LoginRequest request);
}
