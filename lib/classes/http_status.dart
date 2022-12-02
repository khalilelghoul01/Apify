enum HttpStatus {
  CONTINUE,
  SWITCHING_PROTOCOLS,
  PROCESSING,
  EARLY_HINTS,
  OK,
  CREATED,
  ACCEPTED,
  NON_AUTHORITATIVE_INFORMATION,
  NO_CONTENT,
  RESET_CONTENT,
  PARTIAL_CONTENT,
  MULTI_STATUS,
  ALREADY_REPORTED,
  IM_USED,
  MULTIPLE_CHOICES,
  MOVED_PERMANENTLY,
  FOUND,
  SEE_OTHER,
  NOT_MODIFIED,
  USE_PROXY,
  TEMPORARY_REDIRECT,
  PERMANENT_REDIRECT,
  BAD_REQUEST,
  UNAUTHORIZED,
  PAYMENT_REQUIRED,
  FORBIDDEN,
  NOT_FOUND,
  METHOD_NOT_ALLOWED,
  NOT_ACCEPTABLE,
  PROXY_AUTHENTICATION_REQUIRED,
  REQUEST_TIMEOUT,
  CONFLICT,
  GONE,
  LENGTH_REQUIRED,
  PRECONDITION_FAILED,
  PAYLOAD_TOO_LARGE,
  URI_TOO_LONG,
  UNSUPPORTED_MEDIA_TYPE,
  RANGE_NOT_SATISFIABLE,
  EXPECTATION_FAILED,
  IM_A_TEAPOT,
  MISDIRECTED_REQUEST,
  UNPROCESSABLE_ENTITY,
  LOCKED,
  FAILED_DEPENDENCY,
  TOO_EARLY,
  UPGRADE_REQUIRED,
  PRECONDITION_REQUIRED,
  TOO_MANY_REQUESTS,
  REQUEST_HEADER_FIELDS_TOO_LARGE,
  UNAVAILABLE_FOR_LEGAL_REASONS,
  INTERNAL_SERVER_ERROR,
  NOT_IMPLEMENTED,
  BAD_GATEWAY,
  SERVICE_UNAVAILABLE,
  GATEWAY_TIMEOUT,
  HTTP_VERSION_NOT_SUPPORTED,
  VARIANT_ALSO_NEGOTIATES,
  INSUFFICIENT_STORAGE,
  LOOP_DETECTED,
  NOT_EXTENDED,
  NETWORK_AUTHENTICATION_REQUIRED
}

extension Status on HttpStatus {
  int get code {
    switch (this) {
      case HttpStatus.CONTINUE:
        return 100;
      case HttpStatus.SWITCHING_PROTOCOLS:
        return 101;
      case HttpStatus.PROCESSING:
        return 102;
      case HttpStatus.EARLY_HINTS:
        return 103;
      case HttpStatus.OK:
        return 200;
      case HttpStatus.CREATED:
        return 201;
      case HttpStatus.ACCEPTED:
        return 202;
      case HttpStatus.NON_AUTHORITATIVE_INFORMATION:
        return 203;
      case HttpStatus.NO_CONTENT:
        return 204;
      case HttpStatus.RESET_CONTENT:
        return 205;
      case HttpStatus.PARTIAL_CONTENT:
        return 206;
      case HttpStatus.MULTI_STATUS:
        return 207;
      case HttpStatus.ALREADY_REPORTED:
        return 208;
      case HttpStatus.IM_USED:
        return 226;
      case HttpStatus.MULTIPLE_CHOICES:
        return 300;
      case HttpStatus.MOVED_PERMANENTLY:
        return 301;
      case HttpStatus.FOUND:
        return 302;
      case HttpStatus.SEE_OTHER:
        return 303;
      case HttpStatus.NOT_MODIFIED:
        return 304;
      case HttpStatus.USE_PROXY:
        return 305;
      case HttpStatus.TEMPORARY_REDIRECT:
        return 307;
      case HttpStatus.PERMANENT_REDIRECT:
        return 308;
      case HttpStatus.BAD_REQUEST:
        return 400;
      case HttpStatus.UNAUTHORIZED:
        return 401;
      case HttpStatus.PAYMENT_REQUIRED:
        return 402;
      case HttpStatus.FORBIDDEN:
        return 403;
      case HttpStatus.NOT_FOUND:
        return 404;
      case HttpStatus.METHOD_NOT_ALLOWED:
        return 405;
      case HttpStatus.NOT_ACCEPTABLE:
        return 406;
      case HttpStatus.PROXY_AUTHENTICATION_REQUIRED:
        return 407;
      case HttpStatus.REQUEST_TIMEOUT:
        return 408;
      case HttpStatus.CONFLICT:
        return 409;
      case HttpStatus.GONE:
        return 410;
      case HttpStatus.LENGTH_REQUIRED:
        return 411;
      case HttpStatus.PRECONDITION_FAILED:
        return 412;
      case HttpStatus.PAYLOAD_TOO_LARGE:
        return 413;
      case HttpStatus.URI_TOO_LONG:
        return 414;
      case HttpStatus.UNSUPPORTED_MEDIA_TYPE:
        return 415;
      case HttpStatus.RANGE_NOT_SATISFIABLE:
        return 416;
      case HttpStatus.EXPECTATION_FAILED:
        return 417;
      case HttpStatus.IM_A_TEAPOT:
        return 418;

      case HttpStatus.MISDIRECTED_REQUEST:
        return 421;
      case HttpStatus.UNPROCESSABLE_ENTITY:
        return 422;
      case HttpStatus.LOCKED:
        return 423;
      case HttpStatus.FAILED_DEPENDENCY:
        return 424;
      case HttpStatus.TOO_EARLY:
        return 425;
      case HttpStatus.UPGRADE_REQUIRED:
        return 426;
      case HttpStatus.PRECONDITION_REQUIRED:
        return 428;
      case HttpStatus.TOO_MANY_REQUESTS:
        return 429;
      case HttpStatus.REQUEST_HEADER_FIELDS_TOO_LARGE:
        return 431;
      case HttpStatus.UNAVAILABLE_FOR_LEGAL_REASONS:
        return 451;
      case HttpStatus.INTERNAL_SERVER_ERROR:
        return 500;
      case HttpStatus.NOT_IMPLEMENTED:
        return 501;
      case HttpStatus.BAD_GATEWAY:
        return 502;
      case HttpStatus.SERVICE_UNAVAILABLE:
        return 503;
      case HttpStatus.GATEWAY_TIMEOUT:
        return 504;
      case HttpStatus.HTTP_VERSION_NOT_SUPPORTED:
        return 505;
      case HttpStatus.VARIANT_ALSO_NEGOTIATES:
        return 506;
      case HttpStatus.INSUFFICIENT_STORAGE:
        return 507;
      case HttpStatus.LOOP_DETECTED:
        return 508;
      case HttpStatus.NOT_EXTENDED:
        return 510;
      case HttpStatus.NETWORK_AUTHENTICATION_REQUIRED:
        return 511;
      default:
        return 0;
    }
  }

  String get message {
    switch (this) {
      case HttpStatus.CONTINUE:
        return 'Continue';
      case HttpStatus.SWITCHING_PROTOCOLS:
        return 'Switching Protocols';
      case HttpStatus.PROCESSING:
        return 'Processing';
      case HttpStatus.EARLY_HINTS:
        return 'Early Hints';
      case HttpStatus.OK:
        return 'OK';
      case HttpStatus.CREATED:
        return 'Created';
      case HttpStatus.ACCEPTED:
        return 'Accepted';
      case HttpStatus.NON_AUTHORITATIVE_INFORMATION:
        return 'Non-Authoritative Information';
      case HttpStatus.NO_CONTENT:
        return 'No Content';
      case HttpStatus.RESET_CONTENT:
        return 'Reset Content';
      case HttpStatus.PARTIAL_CONTENT:
        return 'Partial Content';
      case HttpStatus.MULTI_STATUS:
        return 'Multi-Status';
      case HttpStatus.ALREADY_REPORTED:
        return 'Already Reported';
      case HttpStatus.IM_USED:
        return 'IM Used';
      case HttpStatus.MULTIPLE_CHOICES:
        return 'Multiple Choices';
      case HttpStatus.MOVED_PERMANENTLY:
        return 'Moved Permanently';
      case HttpStatus.FOUND:
        return 'Found';
      case HttpStatus.SEE_OTHER:
        return 'See Other';
      case HttpStatus.NOT_MODIFIED:
        return 'Not Modified';
      case HttpStatus.USE_PROXY:
        return 'Use Proxy';
      case HttpStatus.TEMPORARY_REDIRECT:
        return 'Temporary Redirect';
      case HttpStatus.PERMANENT_REDIRECT:
        return 'Permanent Redirect';
      case HttpStatus.BAD_REQUEST:
        return 'Bad Request';
      case HttpStatus.UNAUTHORIZED:
        return 'Unauthorized';
      case HttpStatus.PAYMENT_REQUIRED:
        return 'Payment Required';
      case HttpStatus.FORBIDDEN:
        return 'Forbidden';
      case HttpStatus.NOT_FOUND:
        return 'Not Found';
      case HttpStatus.METHOD_NOT_ALLOWED:
        return 'Method Not Allowed';
      case HttpStatus.NOT_ACCEPTABLE:
        return 'Not Acceptable';
      case HttpStatus.PROXY_AUTHENTICATION_REQUIRED:
        return 'Proxy Authentication Required';
      case HttpStatus.REQUEST_TIMEOUT:
        return 'Request Timeout';
      case HttpStatus.CONFLICT:
        return 'Conflict';
      case HttpStatus.GONE:
        return 'Gone';
      case HttpStatus.LENGTH_REQUIRED:
        return 'Length Required';
      case HttpStatus.PRECONDITION_FAILED:
        return 'Precondition Failed';
      case HttpStatus.PAYLOAD_TOO_LARGE:
        return 'Payload Too Large';
      case HttpStatus.URI_TOO_LONG:
        return 'URI Too Long';
      case HttpStatus.UNSUPPORTED_MEDIA_TYPE:
        return 'Unsupported Media Type';
      case HttpStatus.RANGE_NOT_SATISFIABLE:
        return 'Range Not Satisfiable';
      case HttpStatus.EXPECTATION_FAILED:
        return 'Expectation Failed';
      case HttpStatus.IM_A_TEAPOT:
        return 'I\'m a teapot';
      case HttpStatus.MISDIRECTED_REQUEST:
        return 'Misdirected Request';
      case HttpStatus.UNPROCESSABLE_ENTITY:
        return 'Unprocessable Entity';
      case HttpStatus.LOCKED:
        return 'Locked';
      case HttpStatus.FAILED_DEPENDENCY:
        return 'Failed Dependency';
      case HttpStatus.TOO_EARLY:
        return 'Too Early';
      case HttpStatus.UPGRADE_REQUIRED:
        return 'Upgrade Required';
      case HttpStatus.PRECONDITION_REQUIRED:
        return 'Precondition Required';
      case HttpStatus.TOO_MANY_REQUESTS:
        return 'Too Many Requests';
      case HttpStatus.REQUEST_HEADER_FIELDS_TOO_LARGE:
        return 'Request Header Fields Too Large';
      case HttpStatus.UNAVAILABLE_FOR_LEGAL_REASONS:
        return 'Unavailable For Legal Reasons';
      case HttpStatus.INTERNAL_SERVER_ERROR:
        return 'Internal Server Error';
      case HttpStatus.NOT_IMPLEMENTED:
        return 'Not Implemented';
      case HttpStatus.BAD_GATEWAY:
        return 'Bad Gateway';
      case HttpStatus.SERVICE_UNAVAILABLE:
        return 'Service Unavailable';
      case HttpStatus.GATEWAY_TIMEOUT:
        return 'Gateway Timeout';
      case HttpStatus.HTTP_VERSION_NOT_SUPPORTED:
        return 'HTTP Version Not Supported';
      case HttpStatus.VARIANT_ALSO_NEGOTIATES:
        return 'Variant Also Negotiates';
      case HttpStatus.INSUFFICIENT_STORAGE:
        return 'Insufficient Storage';
      case HttpStatus.LOOP_DETECTED:
        return 'Loop Detected';
      case HttpStatus.NOT_EXTENDED:
        return 'Not Extended';
      case HttpStatus.NETWORK_AUTHENTICATION_REQUIRED:
        return 'Network Authentication Required';
      default:
        return '';
    }
  }
}

class StatusImp {
  static HttpStatus getStatus(int code) {
    for (HttpStatus status in HttpStatus.values) {
      if (status.code == code) {
        return status;
      }
    }
    return HttpStatus.UNAUTHORIZED;
  }
}
