import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tech_blog/constant/api_constant.dart';
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
    debugPrint(response);
    email = response['email'];
    userId = response['user_id'];
  }

  verfiy() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activateTextEditingController,
      'command': 'verify'
    };
    var response =
        await DioService().postMethod(map, ApiConstant.postRegisterUrl);
    debugPrint(response);
  }
}
