import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

void downloadFile(String url, String filename) async {
  var dir = await getExternalStorageDirectory();
  await FlutterDownloader.enqueue(
    url: url,
    headers: {}, // optional: header send with url (auth token etc)
    savedDir: dir!.path,
    saveInPublicStorage: true,
    showNotification:
        true, // show download progress in status bar (for Android)
    openFileFromNotification:
        true, // click on notification to open downloaded file (for Android)
  );
}
