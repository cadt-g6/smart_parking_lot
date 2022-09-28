import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:smart_parking_lot/providers/app_auth_provider.dart';
import 'package:path_provider/path_provider.dart';

abstract class BaseCloudStorage {
  String get refPath;
  String get localPath => "firebase/cache/$refPath";
  Directory? directory;

  final FirebaseStorage storage = FirebaseStorage.instance;
  late final Reference reference;

  BaseCloudStorage() {
    String? uid = AppAuthProvider.instance.user?.id;
    reference = storage.ref("$refPath/$uid");
  }

  Future<UploadTask?> upload(Uint8List data, String fileName) async {
    String? uid = AppAuthProvider.instance.user?.id;
    if (uid == null) return null;

    DateTime now = DateTime.now();
    String fileBasename = "${now.millisecondsSinceEpoch}-$fileName";
    Reference child = reference.child(fileBasename);

    UploadTask uploadTask = child.putData(
      data,
      SettableMetadata(customMetadata: {
        "uploader": uid,
        "file_basename": fileBasename,
        "created_at": DateTime.now().toIso8601String(),
      }),
    );

    return uploadTask;
  }

  Future<File> download(String fullPath) async {
    directory ??= await getApplicationDocumentsDirectory();

    Reference reference = FirebaseStorage.instance.ref(fullPath);
    File file = File("${directory!.path}/${reference.fullPath}");
    if (await file.exists()) return file;

    if (!file.parent.existsSync()) file.parent.createSync(recursive: true);
    Completer completer = Completer<bool>();
    reference.writeToFile(file).whenComplete(() {
      completer.complete(true);
    });

    await completer.future;
    return file;
  }

  Future<void> delete(Reference reference) async {
    return reference.delete();
  }

  Future<ListResult> list() async {
    return reference.listAll();
  }
}
