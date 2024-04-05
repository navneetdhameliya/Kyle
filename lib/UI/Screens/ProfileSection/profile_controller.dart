import 'package:get/get.dart';
import 'package:kayle/Infrastructure/Constants/image_constant.dart';

class ProfileController extends GetxController {

  List<SettingItemModel> accountItems = [
    SettingItemModel(icon: ImageConstants.camera, name: "Preferences"),
    SettingItemModel(icon: ImageConstants.camera, name: "Chat List",),
    SettingItemModel(icon: ImageConstants.camera, name: "Payment",),
    SettingItemModel(icon: ImageConstants.saveMarkIcon, name: "Payment",),
    SettingItemModel(icon: ImageConstants.camera, name: "Addresses"),
  ];
  List<SettingItemModel> privacyItems = [
    SettingItemModel(icon: ImageConstants.camera, name: "Privacy Setting"),
    SettingItemModel(icon: ImageConstants.camera, name: "Change Password",),
  ];
  List<SettingItemModel> helpItems = [
    SettingItemModel(icon: ImageConstants.camera, name: "FAQ"),
    SettingItemModel(icon: ImageConstants.camera, name: "Get Help"),
    SettingItemModel(icon: ImageConstants.camera, name: "Sign Out"),
  ];
}
class SettingItemModel{
  String name,icon;
  SettingItemModel({required this.icon,required this.name});
}