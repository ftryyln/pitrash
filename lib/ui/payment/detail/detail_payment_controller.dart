import 'dart:io';

import 'package:final_project/base/base_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DetailPaymentController extends BaseController {
  File? gettedFile;

  getSinglePhoto() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      gettedFile = file;
      update();
    } else {
      // User canceled the picker
    }
  }
}
