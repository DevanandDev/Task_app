import 'package:dio/dio.dart';
import 'package:task/data/models/model.dart';

class ProductService {
  String url = "https://fakestoreapi.com/products/";
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
      sendTimeout: Duration(seconds: 10),
    ),
  );

  Future<List<ProductModel>> getProductService() async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final List listProduct = response.data;

        return listProduct.map((e) => ProductModel.fromjson(e)).toList();
      } else {
        throw Exception("Server error : ${response.statusCode}");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception("Connection timeout, pleace try again");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception("Receive timout, pleace try again");
      } else if (e.type == DioExceptionType.sendTimeout) {
        throw Exception("Send timeout ,pleace try again");
      } else if (e.type == DioExceptionType.badResponse) {
        final statuscode = e.response?.statusCode;
        final message = e.response?.statusMessage;
        throw Exception("Server error ($statuscode) : ($message)");
      } else if (e.type == DioExceptionType.cancel) {
        throw Exception("Request cancelled ");
      } else if (e.type == DioExceptionType.unknown) {
        throw Exception("network issue or unkown error");
      } else {
        throw Exception("unexpected dio error : ${e.message}");
      }
    } catch (e) {
      throw Exception("Unexpected error : $e");
    }
  }
}
