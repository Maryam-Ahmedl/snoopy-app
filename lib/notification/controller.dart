import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

import 'control_notifiaction.dart';

class Notification_binding extends Bindings{
  @override
  void dependencies() {
    Get.put<control_notification>(control_notification());
  }

}