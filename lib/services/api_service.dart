import 'package:flutter_getx_boilerplate/api/base_api_repository.dart';
import 'package:get/get.dart';

class ApiService extends GetxService {
  static ApiService get to => Get.find();
  final BaseApiRepository apiRepository;

  ApiService({
    required this.apiRepository,
  });

  /*

  // Authentication APIs
  Future<LoginResponse> login({
    required String email,
    required String password,
    bool? rememberMe,
  }) async {
    final request = LoginRequest(
      data: LoginData(
        email: email,
        password: password,
      ),
      formValues: [],
      uploadPicture: {},
    );
    return await apiRepository.login(request);
  }

  Future<RegisterResponse> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required bool acceptPrivacyPolicyPopup,
    required bool checkUsernameAvailabilityEnabled,
  }) async {
    print('📝 Register attempt for email: $email');

    final request = RegisterRequest(
      data: RegisterData(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
        acceptPrivacyPolicyPopup: acceptPrivacyPolicyPopup,
        checkUsernameAvailabilityEnabled: checkUsernameAvailabilityEnabled,
      ),
    );
    return await apiRepository.register(request);
  } 

  Future<ForgotPasswordResponse> forgotPassword({
    required ForgotPasswordRequest request,
  }) async {
    return await apiRepository.forgotPassword(request);
  }

  Future<ChangePasswordResponse> changePassword(
      {required String oldPassword,
      required String newPassword,
      required String newPasswordRepeat}) async {
    final request = ChangePasswordRequest(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmNewPassword: newPasswordRepeat);
    return await apiRepository.changePassword(request);
  }
  */
}
