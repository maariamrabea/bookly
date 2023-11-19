import 'package:dio/dio.dart';

abstract class Failure {
  final String errMassage;
  const Failure(this.errMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMassage);

  // ignore: deprecated_member_use
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeoutwith ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeoutwith ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeoutwith ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate timeoutwith ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(' Request to Apiserver was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection timeoutwith ApiServer');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet connection');
        }
        return ServerFailure('unexpected Error');
      default:
        return ServerFailure('opps there was an Error');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(' your request  not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internsal Server error,please try later');
    } else {
      return ServerFailure('opps there was an Error');
    }
  }
}
