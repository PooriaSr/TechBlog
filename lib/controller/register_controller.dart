import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/constant/my_colors.dart';
import 'package:tech_blog/constant/my_strings.dart';
import 'package:tech_blog/constant/storage_constant.dart';
import 'package:tech_blog/services/dio_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activateTextEditingController = TextEditingController();
  String email = '';
  String userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register',
    };

    var response =
        await DioService().postMethod(map, ApiConstant.postRegisterUrl);
    debugPrint(response.toString());
    email = emailTextEditingController.text;
    userId = response.data['user_id'];
  }

  verfiy() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activateTextEditingController.text,
      'command': 'verify'
    };
    var response =
        await DioService().postMethod(map, ApiConstant.postRegisterUrl);
    debugPrint(response.toString());

    switch (response.data['response']) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageConstant.token, response.data['token']);
        box.write(StorageConstant.userId, response.data['user_id']);
        box.write(StorageConstant.email, email);
        box.write(StorageConstant.loginStatus, 'true');
        debugPrint(box.read(StorageConstant.userId));
        debugPrint(box.read(StorageConstant.token));
        Get.offAllNamed(NamedRoute.myCatsScreen);
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد وارد شده اشتباه است',
            duration: const Duration(seconds: 6),
            backgroundColor: SolidColors.primaryColor.withAlpha(170),
            colorText: Colors.white);
        break;
      case 'expired':
        Get.snackbar('خطا', 'کد وارد شده منقضی شده است',
            duration: const Duration(seconds: 6),
            backgroundColor: SolidColors.primaryColor.withAlpha(170),
            colorText: Colors.white);
        break;
    }
  }

  bool toggleLogin() {
    if (GetStorage().read(StorageConstant.token) == null) {
      GetStorage().write(StorageConstant.loginStatus, 'false');
      return false;
    } else {
      GetStorage().write(StorageConstant.loginStatus, 'true');
      return true;
    }
  }
}
