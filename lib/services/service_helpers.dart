import 'service_exception.dart';

bool isSuccessResponse(dynamic response) => response?.code == 0;

String resolveResponseMessage(dynamic response, String fallback) {
  final message = response?.message?.toString();
  if (message == null || message.trim().isEmpty) {
    return fallback;
  }
  return message;
}

T requireResponseData<T>(
  dynamic response, {
  required String fallbackMessage,
  required String emptyDataMessage,
}) {
  if (!isSuccessResponse(response)) {
    throw ServiceException(resolveResponseMessage(response, fallbackMessage));
  }

  final data = response?.data;
  if (data == null) {
    throw ServiceException(emptyDataMessage);
  }

  return data as T;
}

void requireResponseSuccess(
  dynamic response, {
  required String fallbackMessage,
}) {
  if (!isSuccessResponse(response)) {
    throw ServiceException(resolveResponseMessage(response, fallbackMessage));
  }
}
