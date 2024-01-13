import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/new_article_controller.dart';

class MyFilePicker {
  final NewArticleController _newArticleController =
      Get.put(NewArticleController());
  Future pickFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    _newArticleController.file.value = result!.files.first;
  }
}
