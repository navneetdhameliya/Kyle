import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';
import 'package:kayle/Infrastructure/Constants/key_constant.dart';
import 'package:kayle/Infrastructure/model/cart_items_data_model.dart';
import 'package:kayle/Infrastructure/model/payment_method_data_model.dart';

class CartController extends GetxController {
  RxList<CartItemsDataModel> cartItemDataList = <CartItemsDataModel>[].obs;
  RxDouble totalPrice = 0.0.obs;
  RxBool voucherAdded = false.obs;
  RxInt selectedPaymentMethod = 0.obs;

  RxList<PaymentMethodDataModel> paymentMethodDataList = <PaymentMethodDataModel>[
    PaymentMethodDataModel(image: ImageConstants.masterCardImg,name: "Master Card"),
    PaymentMethodDataModel(image: ImageConstants.paypalImg,name: "PayPal"),
    PaymentMethodDataModel(image: ImageConstants.visaImg,name: "Visa"),
    PaymentMethodDataModel(image: ImageConstants.appleImg,name: "ApplePay"),
    PaymentMethodDataModel(image: ImageConstants.walletIcon,name: "Payment on delivery"),
  ].obs;

  getTotalPrice(){
    totalPrice.value = 0.0;
    update([ControllerId.cartKey]);

    for(var data in cartItemDataList){
      totalPrice.value += data.productPrice * data.productQuantity;
    }

    update([ControllerId.cartKey]);

  }
}
