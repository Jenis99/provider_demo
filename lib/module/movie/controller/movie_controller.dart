import 'package:get/get.dart';
import 'package:provider_demo/module/home/model/movies_model.dart';

class MovieController extends GetxController{

  Rx<Results> movieDetail= Results().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    movieDetail.value=Get.arguments;
  }
}