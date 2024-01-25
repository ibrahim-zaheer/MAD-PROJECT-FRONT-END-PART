// // import 'package:dio/dio.dart';
// // // import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
// // import 'package:path_provider/path_provider.dart';
// // // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';

// // class PDFDownnloader extends StatefulWidget {
// //   @override
// //   State<PDFDownnloader> createState() => _PDFDownnloaderState();
// // }

// // class _PDFDownnloaderState extends State<PDFDownnloader> {
// //   String fileurl = "https://fluttercampus.com/sample.pdf";
// //   //you can save other file formats too.
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         resizeToAvoidBottomInset: false,
// //         appBar: AppBar(
// //           title: Text("Download File from URL"),
// //           backgroundColor: Colors.deepPurpleAccent,
// //         ),
// //         body: Container(
// //           margin: EdgeInsets.only(top: 50),
// //           child: Column(
// //             children: [
// //               Text("File URL: $fileurl"),
// //               Divider(),
// //               ElevatedButton(
// //                 onPressed: () async {
// //                   Map<Permission, PermissionStatus> statuses = await [
// //                     Permission.storage,
// //                     //add more permission to request here.
// //                   ].request();

// //                   if (statuses[Permission.storage]!.isGranted) {
// //                     var dir = await DownloadsPath.downloadsDirectory;
// //                     if (dir != null) {
// //                       String savename = "file.pdf";
// //                       String savePath = dir + "/$savename";
// //                       print(savePath);
// //                       //output:  /storage/emulated/0/Download/banner.png

// //                       try {
// //                         await Dio().download(fileurl, savePath,
// //                             onReceiveProgress: (received, total) {
// //                           if (total != -1) {
// //                             print((received / total * 100).toStringAsFixed(0) +
// //                                 "%");
// //                             //you can build progressbar feature too
// //                           }
// //                         });
// //                         print("File is saved to download folder.");
// //                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                           content: Text("File Downloaded"),
// //                         ));
// //                       } on DioError catch (e) {
// //                         print(e.message);
// //                       }
// //                     }
// //                   } else {
// //                     print("No permission to read and write.");
// //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                       content: Text("Permission Denied !"),
// //                     ));
// //                   }
// //                 },
// //                 child: Text("Download File."),
// //               )
// //             ],
// //           ),
// //         ));
// //   }
// // }

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';

// class PDFDownloader extends StatefulWidget {
//   @override
//   State<PDFDownloader> createState() => _PDFDownloaderState();
// }

// class _PDFDownloaderState extends State<PDFDownloader> {
//   String fileUrl = "https://fluttercampus.com/sample.pdf";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("Download File from URL"),
//         backgroundColor: Colors.deepPurpleAccent,
//       ),
//       body: Container(
//         margin: EdgeInsets.only(top: 50),
//         child: Column(
//           children: [
//             Text("File URL: $fileUrl"),
//             Divider(),
//             ElevatedButton(
//               onPressed: () async {
//                 Map<Permission, PermissionStatus> statuses = await [
//                   Permission.storage,
//                   // Add more permissions to request here if needed.
//                 ].request();

//                 if (statuses[Permission.storage]!.isGranted) {
//                   var dir = await DownloadsPath.downloadsDirectory;
//                   if (dir != null) {
//                     String saveName = "file.pdf";
//                     String savePath = dir.toString() + "/$saveName";
//                     print(savePath);

//                     try {
//                       await Dio().download(fileUrl, savePath,
//                           onReceiveProgress: (received, total) {
//                         if (total != -1) {
//                           print((received / total * 100).toStringAsFixed(0) +
//                               "%");
//                           // You can build a progress bar feature too.
//                         }
//                       });
//                       print("File is saved to the download folder.");
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         content: Text("File Downloaded"),
//                       ));
//                     } on DioError catch (e) {
//                       print(e.message);
//                     }
//                   }
//                 } else {
//                   print("No permission to read and write.");
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text("Permission Denied!"),
//                   ));
//                 }
//               },
//               child: Text("Download File"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

Future<void> downloadPDF(String url) async {
  Dio dio = Dio();
  try {
    Response<Uint8List> response = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    // Get the directory for the device's Documents directory
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String pdfPath = "${appDocDir.path}/downloaded_file.pdf";

    // Write the PDF content to a file
    File file = File(pdfPath);
    await file.writeAsBytes(response.data!, flush: true);

    // TODO: Handle the downloaded file, open it, or show a success message.
  } catch (e) {
    // TODO: Handle the error, show an error message, etc.
    print("Error downloading PDF: $e");
  }
}
