import 'package:flutter/foundation.dart';
import 'package:flutter_getx_boilerplate/api/api_repository.dart';
import 'package:flutter_getx_boilerplate/services/api_call_status.dart';
import 'package:flutter_getx_boilerplate/services/api_service.dart';
import 'package:flutter_getx_boilerplate/services/storage_service.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum AuthViewType { login, verifyEmail, registerSuccess, enterMail }

class AuthController extends GetxController {
  final StorageService _storageService = Get.put(StorageService());

  var apiCallStatus = ApiCallStatus.holding.obs;
  var currentView = Rx<AuthViewType>(AuthViewType.login);
  var isRegisterMode = false.obs;
  var isImage = false.obs;

  FormGroup form = FormGroup({
    'register': FormGroup(
      {
        'name': FormControl<String>(
          validators: [
            Validators.required,
            Validators.pattern(
                r"^[a-zA-ZçÇşŞıİğĞöÖüÜ]+(\s+[a-zA-ZçÇşŞıİğĞöÖüÜ]+){1,3}$",
                validationMessage: ''),
          ],
        ),
        'email': FormControl<String>(
            validators: [Validators.required, Validators.email]),
        'password': FormControl<String>(validators: [
          Validators.required,
          Validators.minLength(8),
          Validators.maxLength(26),
        ]),
        'termsAccepted': FormControl<bool>(
          value: false,
          validators: [Validators.requiredTrue],
        ),
        'explanatoryText': FormControl<bool>(
          value: false,
          validators: [
            Validators.requiredTrue,
          ],
        ),
        'phoneNumber': FormControl<String>(
          validators: [
            Validators.pattern(
              r'^\+?[1-9]\d{1,14}$', // E.164 formatına uygun bir pattern
              validationMessage: 'Geçerli bir telefon numarası giriniz.',
            ),
          ],
        ),
      },
    ),
    'login': FormGroup({
      'email': FormControl<String>(
          validators: [Validators.required, Validators.email]),
      'password': FormControl<String>(validators: [Validators.required]),
      'rememberMe': FormControl<bool>(value: false),
    }),
    'verification': FormGroup({
      'code': FormControl<String>(validators: [Validators.required]),
    }),
    'forgotPassword': FormGroup({
      'email': FormControl<String>(
          validators: [Validators.required, Validators.email]),
      'phoneNumber': FormControl<String>(),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(8),
        Validators.maxLength(26),
        Validators.pattern(r'^(?=.*[a-z])',
            validationMessage:
                "Password must have at least one lowercase letter"),
        Validators.pattern(r'^(?=.*[A-Z])',
            validationMessage:
                "Password must have at least one uppercase letter"),
        Validators.pattern(r'^(?=.*\d)',
            validationMessage: "Password must contain at least one digit"),
        Validators.pattern(r'^(?=.*[\$\*&@\#%!\.])',
            validationMessage:
                "Password must contain at least one special character (\$, *, &, @, #, %, !, .)"),
      ]),
      'passwordAgain': FormControl<String>(validators: [Validators.required]),
      'code': FormControl<String>(),
    }),
  });

  void switchAuthView(AuthViewType viewType) {
    currentView.value = viewType;
  }

  void clearFormData() {
    // Login form verilerini temizle
    final loginForm = form.control('login') as FormGroup;
    loginForm.control('email').reset();
    loginForm.control('password').reset();
    loginForm.control('rememberMe').reset();

    // Register form verilerini temizle
    final registerForm = form.control('register') as FormGroup;
    registerForm.control('name').reset();
    registerForm.control('email').reset();
    registerForm.control('password').reset();
    registerForm.control('termsAccepted').reset();
    registerForm.control('explanatoryText').reset();
    registerForm.control('phoneNumber').reset();

    // Verification form verilerini temizle
    final verificationForm = form.control('verification') as FormGroup;
    verificationForm.control('code').reset();

    // ForgotPassword form verilerini temizle
    final forgotPasswordForm = form.control('forgotPassword') as FormGroup;
    forgotPasswordForm.control('email').reset();
    forgotPasswordForm.control('phoneNumber').reset();
    forgotPasswordForm.control('password').reset();
    forgotPasswordForm.control('passwordAgain').reset();
    forgotPasswordForm.control('code').reset();
  }

  /*Future<void> login() async {
    Get.put(ApiService(apiRepository: Get.find<ApiRepository>()));
    apiCallStatus(ApiCallStatus.loading);
    try {
      final loginForm = form.control('login') as FormGroup;
      
      debugPrint('🔑 Login attempt with email: ${loginForm.control('email').value}');
      
      final response = await ApiService.to.login(
        email: loginForm.control('email').value,
        password: loginForm.control('password').value,
        rememberMe: loginForm.control('rememberMe').value,
      );

      debugPrint('📥 Login Response: ${response.toJson()}');

      if (response.errorList.isEmpty) {
        await _storageService.setToken(response.data?.token ?? '');
        debugPrint('🔑 Token saved: ${_storageService.token}');
        clearFormData(); // Form verilerini temizle
        Get.offAllNamed(Routes.MAIN);
        apiCallStatus(ApiCallStatus.success);
      } else {
        apiCallStatus(ApiCallStatus.error);
        debugPrint('❌ Login Errors: ${response.errorList}');
        Get.snackbar('Hata', response.errorList.first);
      }
    } catch (e) {
      apiCallStatus(ApiCallStatus.error);
      debugPrint('❌ Login Exception: $e');
      Get.snackbar('Hata', '$e');
    }
  }

  Future<void> register() async {
    Get.put(ApiService(apiRepository: Get.find<ApiRepository>()));
    apiCallStatus(ApiCallStatus.loading);

    try {
      final registerForm = form.control('register') as FormGroup;

      // Değeri String'e çeviriyoruz.
      final nameValue = registerForm.control('name').value;
      final nameStr = nameValue?.toString() ?? '';
      print("DEBUG: Name value = $nameStr");

      // Boşluklardan ayırıp, boş olanları filtreleyerek liste oluşturuyoruz.
      final nameParts =
          nameStr.split(' ').where((String s) => s.isNotEmpty).toList();
      print("DEBUG: Name parts = $nameParts");

      // Listenin son elemanını lastName, geri kalanı firstName olarak alıyoruz.
      final lastName = nameParts.isNotEmpty ? nameParts.last : '';
      final firstName = nameParts.length > 1
          ? nameParts.sublist(0, nameParts.length - 1).join(' ')
          : '';
      print("DEBUG: Computed firstName = $firstName");
      print("DEBUG: Computed lastName = $lastName");
      print("DEBUG: Accept privacy policy popup = ${registerForm.control('termsAccepted').value}");
      print("DEBUG: Check username availability enabled = ${registerForm.control('explanatoryText').value}");

      final response = await ApiService.to.register(
        email: registerForm.control('email').value,
        password: registerForm.control('password').value,
        firstName: firstName,
        lastName: lastName,
        acceptPrivacyPolicyPopup: registerForm.control('termsAccepted').value,
        checkUsernameAvailabilityEnabled:
            registerForm.control('explanatoryText').value,
      );


      if (response.errorList.isEmpty) {
        currentView.value = AuthViewType.registerSuccess;
        clearFormData(); // Form verilerini temizle
        apiCallStatus(ApiCallStatus.success);
      } else {
        apiCallStatus(ApiCallStatus.error);
        // Hata mesajlarının tamamını konsola yazdırıyoruz.
        print("DEBUG: Error list: ${response.errorList}");
        // Hata mesajlarını virgülle ayırarak snackbar'da gösteriyoruz.
        Get.snackbar(
            'Error', response.errorList.join(', '));
      }
    } catch (e, stackTrace) {
      print("DEBUG: Exception during registration: $e");
      print("DEBUG: StackTrace: $stackTrace");
      apiCallStatus(ApiCallStatus.error);
      Get.snackbar('Error', 'An error occurred during registration');
    }
  }*/
}
