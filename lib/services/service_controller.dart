// ignore_for_file: unused_local_variable
import 'package:get/get.dart';
import 'package:picterest_app/helpers/snackbar_helper.dart';
import 'package:picterest_app/services/service_exceptions.dart';

class ServiceController {
  void handleErrorya(error) {
    if (Get.isDialogOpen!) Get.back();
    if (error is BadRequestException) {
      var message = error.message;
      SnackbarHelper.showError(description: message);
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      SnackbarHelper.showError(description: message);
    } else if (error is UnauthorizedException) {
      var message = error.message;
      SnackbarHelper.showError(description: message);
    } else if (error is FetchDataException) {
      var message = error.message;
      SnackbarHelper.showError(description: message);
    }
  }
}
