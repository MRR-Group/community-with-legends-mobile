class HttpException implements Exception {
  final String message;
  final int? statusCode;

  HttpException({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => message;

  factory HttpException.fromStatusCode({
    required int statusCode,
    String? message,
  }){
    switch(statusCode){
      case 400:
        return HttpException(
          message:
          'There was an issue with your request. Please check your data and try again.',
          statusCode: statusCode,
        );
      case 401:
        return HttpException(
          message: 'Authentication failed. Please sign in to continue.',
          statusCode: statusCode,
        );
      case 403:
        return HttpException(
          message: 'You do not have permission to perform this action.',
          statusCode: statusCode,
        );
      case 404:
        return HttpException(
          message:
          'The page or resource you are looking for could not be found.',
          statusCode: statusCode,
        );
      case 408:
        return HttpException(
          message: 'The request timed out. Please try again.',
          statusCode: statusCode,
        );
      case 409:
        return HttpException(
          message:
          'There was a conflict with your request. Please check the data and try again.',
          statusCode: statusCode,
        );
      case 500:
        return HttpException(
          message: 'An error occurred on the server. Please try again later.',
          statusCode: statusCode,
        );
      case 502:
        return HttpException(
          message: 'There was a problem with the connection. Please try again.',
          statusCode: statusCode,
        );
      case 503:
        return HttpException(
          message:
          'The service is currently unavailable. Please try again later.',
          statusCode: statusCode,
        );
      case 504:
        return HttpException(
          message:
          'There was a problem with the connection. Please try again later.',
          statusCode: statusCode,
        );
      default:
        return HttpException(
          message: message ?? 'An unexpected error occurred. Please try again later.',
          statusCode: statusCode,
        );
    }
  }
}
