import 'package:get/get.dart';

abstract class BaseController<T> extends GetxController with StateMixin<T> {
  var isLoading = false.obs;
  var dataChange = true.obs;
  showLoader() {
    isLoading(true);
  }

  hideLoader() {
    isLoading(false);
  }

  notifyChange() {
    dataChange(!dataChange.value);
  }
}
