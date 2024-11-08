import 'package:get/get.dart';
import 'package:machinetest_trogun/feature/model/product_model.dart';
import 'package:machinetest_trogun/feature/services/api_services.dart';

class ProductController extends GetxController {
  var products = <Products>[].obs;
  var isLoading = true.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();

    getProducts();
  }

  Future<void> getProducts() async {
    isLoading.value = true;

    try {
      final products = await ApiServices.getProducts();
      this.products.assignAll(products);
    } catch (e) {
      const errorMessage = 'Cannot load products';
      Get.snackbar('Error', errorMessage);

      error.value = errorMessage;
    } finally {
      isLoading.value = false;
    }
  }
}
