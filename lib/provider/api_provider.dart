import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:studentguide/prefutils.dart';

// import 'package:flutter/foundation.dart';
class ApiProvider extends GetxService {
  late dio.Dio _dio;
  final _baseUrl =
      'https://7608-2409-40e5-104b-138a-7190-4e3d-f02f-e165.ngrok-free.app/';

  ApiProvider() {
    _dio = dio.Dio();
    // setDeviceVariables();
  }

  Future<ApiProvider> init() async {
    //init changes
    return this;
  }

  String getBaseURL(String endpoint) {
    debugPrint("${_baseUrl + endpoint}");
    return _baseUrl + endpoint;
  }

  Future<void> getSummery({
    required Function(dynamic resp) onSuccess,
    required Function(dynamic error) onError,
    required String imagePath,
  }) async {
    debugPrint("get summary method called from apiprovider");
    try {
      final formData = dio.FormData.fromMap({
        "im": await dio.MultipartFile.fromFile(
          imagePath,
          filename: "image.jpg",
        ),
      });

      debugPrint("Form data: $formData");

      final response = await _dio.post(
        "${getBaseURL('summarize')}",
        data: formData,
        options: dio.Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      debugPrint("Response data: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      } else {
        onError('Server error! Status Code: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint("An error occurred in ApiProvider: $e");
      onError('An error occurred: $e');
    }
  }

  Future<void> RegisterParent({
    required Function(dynamic resp) onSuccess,
    required Function(dynamic error) onError,
    required Map<String, dynamic> reqData,
  }) async {
    debugPrint("Request data: ${reqData}");

    try {
      var response = await _dio.post(
        getBaseURL('addparent'),
        data: dio.FormData.fromMap(reqData),
        options: dio.Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      } else {
        onError('Something Went Wrong! Status Code: ${response.statusCode}');
      }
    } catch (e) {
      onError('An error occurred: $e');
    }
  }

  Future<void> RegisterStudent({
    required String name,
    required String password,
    required String fatherName,
    required String schoolName,
    required String address,
    required String className,
    required String imagePath,
    required String email,
    required Function(dynamic) onSuccess,
    required Function(dynamic) onError,
  }) async {
    final parentemail = Get.find<PrefUtils>().getEmailId();

    try {
      final formData = dio.FormData.fromMap({
        "id":
            await dio.MultipartFile.fromFile(imagePath, filename: "image.jpg"),
        "name": name,
        "email": email,
        "password": password,
        "father_name": fatherName,
        "school_name": schoolName,
        "address": address,
        "class_name": className,
      });

      final response = await _dio.post(
        '${getBaseURL('addstudent')}/$parentemail',
        data: formData,
        options: dio.Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      debugPrint("${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      } else {
        onError('Something went wrong! Status Code: ${response.statusCode}');
      }
    } catch (e) {
      onError('An error occurred: $e');
    }
  }

  Future<void> getAllTask({
    required Function(dynamic resp) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String email = Get.find<PrefUtils>().getEmailId();
    try {
      var response = await _dio.get(
        getBaseURL('task/$email'),
        options: dio.Options(
          headers: {
            "accept": "application/json",
          },
        ),
      );

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      } else {
        onError('Something Went Wrong! Status Code: ${response.statusCode}');
      }
    } catch (e) {
      onError('An error occurred: $e');
    }
  }

  Future<void> SignIn({
    required Function(dynamic resp) onSuccess,
    required Function(dynamic error) onError,
    required Map<String, dynamic> reqData,
  }) async {
    debugPrint("Request data: ${reqData}");

    try {
      var response = await _dio.post(
        getBaseURL('signin'),
        data: dio.FormData.fromMap(reqData),
        options: dio.Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      } else {
        onError('Something Went Wrong! Status Code: ${response.statusCode}');
      }
    } catch (e) {
      onError('An error occurred: $e');
    }
  }

  Future<void> addTask({
    required String taskName,
    required String taskDate,
    required String taskTime,
    required String taskDeadline,
    required String taskStatus,
    required String taskDesc,
    required Function(dynamic resp) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final Map<String, dynamic> reqData = {
      'task_name': taskName,
      'task_date': taskDate,
      'task_time': taskTime,
      'task_deadline': taskDeadline,
      'task_status': taskStatus,
      'description': taskDesc
    };
    String email = Get.find<PrefUtils>().getEmailId();

    try {
      var response = await _dio.post(
        getBaseURL('task/$email'),
        data: dio.FormData.fromMap(reqData),
        options: dio.Options(
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "accept": "application/json",
          },
        ),
      );

      debugPrint("Response status: ${response.statusCode}");
      debugPrint("Response body: ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        onSuccess(response.data);
      } else {
        onError('Something Went Wrong! Status Code: ${response.statusCode}');
      }
    } catch (e) {
      onError('An error occurred: $e');
    }
  }
}
