import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:hsse2/app/widgets/dialog_alert.dart';
import 'package:hsse2/utils/values/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

Future<void> downloadFile(String url, String fileName) async {
  try {
    Directory? directory;

    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      // Android 13 (API 33) and up: don't need MANAGE_EXTERNAL_STORAGE
      if (sdkInt >= 33) {
        final status =
            await Permission.photos.request(); // Or use Permission.media
        if (!status.isGranted) {
          throw Exception("Izin akses media ditolak");
        }
      }
      // Android 11-12 (API 30-32)
      else if (sdkInt >= 30) {
        final status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) {
          throw Exception("Izin manajemen penyimpanan ditolak");
        }
      }
      // Android 10 ke bawah
      else {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          throw Exception("Izin penyimpanan ditolak");
        }
      }

      // Simpan ke folder "Download"
      final downloadsDir = Directory('/storage/emulated/0/Download');
      if (!await downloadsDir.exists()) {
        await downloadsDir.create(recursive: true);
      }
      directory = downloadsDir;
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }

    if (directory == null) {
      throw Exception("Gagal mengakses direktori penyimpanan");
    }

    final filePath = "${directory.path}/$fileName";

    // Download file
    final dio = Dio();
    await dio.download(
      url,
      filePath,
      onReceiveProgress: (rec, total) {
        if (total != -1) {
          debugPrint("Downloading: ${(rec / total * 100).toStringAsFixed(0)}%");
        }
      },
    );

    Get.snackbar(
      "Berhasil",
      "File disimpan di ${directory.path}",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  } catch (e) {
    debugPrint("Download error: $e");
    Get.snackbar(
      "Error",
      "Gagal mendownload: ${e.toString()}",
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}

Future<void> previewPDF({
  required BuildContext context,
  required String namaFile,
  required String url,
}) async {
  if (namaFile.isEmpty || url.isEmpty) {
    Get.snackbar(
      "Error",
      "Nama file atau URL tidak boleh kosong",
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return;
  }

  Future.microtask(() {
    DialogAlert.showLoading(message: "Loading...");
  });

  try {
    // Get directory sementara
    Directory tempDir = await getTemporaryDirectory();
    String filePath = "${tempDir.path}/$namaFile";

    // Download file menggunakan Dio
    Dio dio = Dio();
    await dio.download(url, filePath);

    // Tutup loading
    Get.back();

    // Navigasi ke PDF viewer
    Get.to(() => PDFViewerPage(filePath: filePath, title: namaFile, url: url,));
  } catch (e) {
    // Tutup loading
    Get.back();

    Get.snackbar(
      "Error",
      "Gagal memuat PDF: ${e.toString()}",
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}

// Halaman untuk menampilkan PDF
class PDFViewerPage extends StatefulWidget {
  final String filePath;
  final String title;
  final String url;

  const PDFViewerPage({Key? key, required this.filePath, required this.title, required this.url})
    : super(key: key);

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PDFViewController pdfViewController;
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: CustomColor.appBarColor,
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // Download ke gallery/downloads
              downloadFile(
                widget.url,
                widget.title,
              );
              Get.snackbar(
                "Info",
                "File sedang didownload",
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.filePath,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false,
            onRender: (pages) {
              setState(() {
                pages = pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              this.pdfViewController = pdfViewController;
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(child: CircularProgressIndicator())
                  : Container()
              : Center(child: Text(errorMessage)),
        ],
      ),
      floatingActionButton: FutureBuilder<bool>(
        future: _checkIfPDFExists(),
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Previous"),
                  onPressed: () {
                    if (currentPage! > 0) {
                      currentPage = currentPage! - 1;
                      pdfViewController.setPage(currentPage!);
                    }
                  },
                ),
                FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Next"),
                  onPressed: () {
                    if (currentPage! < pages! - 1) {
                      currentPage = currentPage! + 1;
                      pdfViewController.setPage(currentPage!);
                    }
                  },
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar:
          isReady
              ? Container(
                height: 50,
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    "Page ${currentPage! + 1} of $pages",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              )
              : Container(height: 0),
    );
  }

  Future<bool> _checkIfPDFExists() async {
    return File(widget.filePath).exists();
  }
}
