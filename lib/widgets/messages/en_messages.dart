import 'lookupmessages.dart';

/// English Messages
class EnMessages implements LookupMessages {
  @override
  String back() => 'Back';

  @override
  String ohSnap() => 'Oh Snap!';

  @override
  String success() => 'Successfully';

  @override
  String tryAgain() => 'Try Again';

  @override
  String noData() => 'No data available';

  @override
  String noResult() => 'No results found';

  @override
  String searching() => 'Searching ...';

  @override
  String badRequest() => "Bad request";

  @override
  String conflict() => "409 | Conflict";
  @override
  String conflictDesc() =>
      "The request conflicts with the current state of the target resource.";

  @override
  String formatException() => "An unexpected error occurred";

  @override
  String internalServerError() => "500 | Internal Server Error";
  @override
  String internalServerErrorDesc() =>
      "An internal error occurred on the server. This may be due to an app error or a configuration issue";

  @override
  String methodNotAllowed() => "Method not allowed";

  @override
  String noInternetConnection() => "No internet connection";

  @override
  String notAcceptable() => "Not acceptable";

  @override
  String notFound() => "404 | Not Found";
  @override
  String notFoundDesc() => "The requested resource does not exist";

  @override
  String notImplemented() => "Not implemented";

  @override
  String requestCancelled() => "Request cancelled";

  @override
  String requestTimeout() => "408 | Request Timeout";
  @override
  String requestTimeoutDesc() =>
      "The server wants to kill this unused connection. It is sent on an idle connection by the server, even without a prior request by the client.";

  @override
  String sendTimeout() => "Send timeout with respect to API server";

  @override
  String serviceUnavailable() => "503 | Service Unavailable";
  @override
  String serviceUnavailableDesc() =>
      "Sorry for the inconvenience, but we are currently doing maintenance. You can always contact us, otherwise we'll be back online soon";

  @override
  String somethingWhenWrong() => "Something Went Wrong";
  @override
  String somethingWhenWrongDesc() =>
      "Please try or report the problem to our support team";

  @override
  String unableToProcess() => "Cannot Process Data";
  @override
  String unableToProcessDesc() =>
      "The application cannot process the data you requested";

  @override
  String unauthorisedRequest() => "Unauthorised";
  @override
  String unauthorisedRequestDesc() => "Please login first to continue";

  @override
  String unexpectedError() => "An unexpected error occurred";
}
