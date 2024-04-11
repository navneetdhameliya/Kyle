import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/model/cart_items_data_model.dart';

class CartController extends GetxController {
  RxList<CartItemsDataModel> cartItemDataList = <CartItemsDataModel>[].obs;
  RxDouble totalPrice = 0.0.obs;
  RxBool voucherAdded = false.obs;

  getTotalPrice(){
    totalPrice.value = 0.0;
    update([ControllerId.cartKey]);

    for(var data in cartItemDataList){
      totalPrice.value += data.productPrice * data.productQuantity;
    }

    update([ControllerId.cartKey]);

  }
}
