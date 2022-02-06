import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initHive () async {
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path); //initiate Hive
// Hive.registerAdapter(MyFormulaIdListAdapter());
  await Hive.openBox<String>('myFormulaId');
  await Hive.openBox<bool>('isDarkMode');
  print('hive isDarkMode: ${Hive.box<bool>('isDarkMode').values}');
  print(Hive.box<String>('myFormulaId').values);
}

