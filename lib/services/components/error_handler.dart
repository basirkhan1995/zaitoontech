import 'app_exceptions.dart';
import 'dialog_helper.dart';

class BaseController {
  void handleError(error){
    hideLoading();
    if(error is BadRequestException){
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    }else if(error is FetchDataException){
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    }else if (error is ApiNotRespondingException){
      DialogHelper.showErrorDialog(description: "Server is not responding",title: "Oops! Time Out");
    }
  }
  showLoading([String? message]){
    DialogHelper.showLoadingDialog(message);
  }
  hideLoading(){
    DialogHelper.hideLoading();
  }
}