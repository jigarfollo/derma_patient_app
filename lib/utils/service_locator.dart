import 'package:follo_patient_app/utils/gcloud_util.dart';
import 'package:follo_patient_app/utils/global_data.dart';
import 'package:follo_patient_app/utils/http_service.dart';
import 'package:follo_patient_app/utils/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = new GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => HttpService());
  locator.registerLazySingleton(() => GlobalData());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => GcloudUtil());
}
