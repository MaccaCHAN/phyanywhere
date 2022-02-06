

import 'package:dse_physics_app/Version/enforced_version.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../constants.dart';

Future<void> checkAppVersion () async {
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  currentAppVersion = packageInfo.version;
  print ('current App Version: $currentAppVersion');
  final String enforcedVersion = await EnforcedVersion.getEnforcedVersion;
  print ('enforced App Version: $enforcedVersion');
  isNeedsUpdate = EnforcedVersion().needsUpdate(currentAppVersion, enforcedVersion);
  print('needsUpdate: $isNeedsUpdate');
  print('needsUpdate method: ${EnforcedVersion().needsUpdate(currentAppVersion, enforcedVersion)}');

}