import 'dart:io';
import 'package:image/image.dart';

convertImage(FileSystemEntity selectedFile, String format) {
  final rawImage = (selectedFile as File).readAsBytesSync();
  final image = decodeImage(rawImage);
  var newImage;

  if (format == 'jpg') {
    encodeJpg(image);
  } else if (format == 'png') {
    encodePng(image);
  } else {
    print(replaceExtension);
  }
  final newPath = replaceExtension(selectedFile.path, format);
  new File(newPath).writeAsBytesSync(newImage);
  return newPath;
}

String replaceExtension(String path, String newExtension) {
  return path.replaceAll(new RegExp(r'(png|jpg|jpeg)'), newExtension);
}
