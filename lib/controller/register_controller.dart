import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/constant/api_constant.dart';
import 'package:tech_blog/constant/storage_constant.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/view/my_cats.dart';

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
    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write(StorageConstant.token, response.data['token']);
      box.write(StorageConstant.userId, response.data['user_id']);
      box.write(StorageConstant.email, email);
      debugPrint(box.read(StorageConstant.userId));
      debugPrint(box.read(StorageConstant.token));
      Get.to(() => MyCats());
    }
  }
}
