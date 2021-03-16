import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:tb_net/services/auth.dart';
import 'package:tb_net/storage/storage_manager.dart';
import 'package:tb_net/utils/connection_status.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<StorageManager>(
      () => StorageManager(FlutterSecureStorage()));
  locator.registerLazySingleton<Auth>(() => Auth());
}
