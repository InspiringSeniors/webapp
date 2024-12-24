
import 'splash_screen_repo.dart';

class SplashScreenRepoImpl implements SplashScreenRepo{

  @override
  Future getLatestVersion() async{
    var response;
    try {
      // response = await httpService!.postRequest("${Constants.BASE_URL}auth/appUpdate",{"appName":"Agent App"});
    } catch (e) {
    }
    return response;
    // TODO: implement getTransactions

  }
}