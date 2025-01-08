
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String?> uploadImage(File imageFile) async {
  String cloudName = dotenv.env['CLOUDINARY_NAME'] ?? '';
  String upload_preset = dotenv.env['CLOUDINARY_UPLOAD_PRESET'] ?? '';
  final String uploadUrl = 'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

  // Tạo FormData
  final request = http.MultipartRequest('POST', Uri.parse(uploadUrl))
    ..fields['upload_preset'] = upload_preset
    ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

  // Gửi request
  final response = await request.send();

  // Kiểm tra kết quả
  if (response.statusCode == 200) {
    final responseData = await http.Response.fromStream(response);
    final jsonData = json.decode(responseData.body);
    return jsonData['secure_url']; // URL ảnh được tải lên
  } else {
    print('Failed to upload image: ${response.statusCode}');
    return null;
  }
}