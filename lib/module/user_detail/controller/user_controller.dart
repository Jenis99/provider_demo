import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider_demo/module/post_search_api/model/item_model.dart';

class UserController extends GetxController {
  Rx<Item> userDetail = Item().obs;
  RxString selectedfile = "".obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userDetail.value = Get.arguments;
  }

  Future<String> pickCameraImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    selectedfile.value = photo!.path;
    return selectedfile.value;
  }

  Future<String> pickGalleryImage() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    selectedfile.value = photo!.path;
    return selectedfile.value;
  }
}
