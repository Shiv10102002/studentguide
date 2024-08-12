// auth_controller.dart
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final isAuthenticated = false.obs;
  final user = Rxn<Map<String, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() {
    final storedUser = GetStorage().read('user');
    if (storedUser != null) {
      user.value = storedUser;
      isAuthenticated.value = true;
    }
  }

  void login(Map<String, dynamic> userData) {
    user.value = userData;
    GetStorage().write('user', userData);
    isAuthenticated.value = true;
  }

  void logout() {
    user.value = null;
    GetStorage().remove('user');
    isAuthenticated.value = false;
    Get.offAllNamed('/login');
  }
}
