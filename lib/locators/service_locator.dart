import 'package:get_it/get_it.dart';
import 'package:taxi_app_flutter/services/call_sms.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}