import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:pocketbase/pocketbase.dart';

import '../../../../../utils/constants/constants.dart';
import '../../../../../utils/log/log.dart';
import '../../../models/pocketbase.user.dart';

Future<bool> registerApi(PocketBaseUser user, [File? img]) async {
  EasyLoading.show();
  final pb = PocketBase(baseUrl);

  debugPrint('Registering User: ${img.toString()}');

  try {
    final res = await pb.collection(users).create(
          body: user.toMap(),
          files: img == null
              ? []
              : [
                  await http.MultipartFile.fromPath(
                    'avatar',
                    img.path,
                    filename: '${user.username}.jpg',
                  ),
                ],
        );
    log.i('User Creation: $res');
  } catch (e) {
    EasyLoading.showError(e.toString());
    log.e('User Creation: $e');
    return false;
  }
  EasyLoading.dismiss();
  return true;
}
