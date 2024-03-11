enum ShellOrigin {
  manualSignIn,
  autoSignIn,
  freshSignUp,
  noAuth,
}

enum LanguageCode {
  en, // English
  fil, // Filipino
  de, // Deutsch/German
}

// ! Error Codes
/// * This is to identify what Error Exception/Category was thrown
/// 001 => General Error
enum ErrorCodes {
  g001, // General Error
  p001, // Platform Error
  c001, // Cache Error
  n001, // Network Error
  s001, // Server Error
  s400, // Bad Request
  s401, // Unauthorized
  s402, // Payment Required
  s403, // Forbidden
  s404, // Not Found
  s405, // Method Not Allowed
  s406, // Not Acceptable
  s407, // Proxy Authentication Required
  s408, // Request Timeout
  s409, // Conflict
  s410, // Gone
  s411, // Length Required
  s412, // Precondition Failed
  s413, // Request Entity Too Large
  s414, // Request-URI Too Long
  s415, // Unsupported Media Type
  s416, // Requested range not satisfiable
  s417, // Expectation Failed
  s418, // I'm a teapot
  s419, // Insufficient Space On Resource
  s420, // Method Failure
  s421, // Destination Locked
  s422, // Unprocessable Entity
  s423, // Locked
  s424, // Failed Dependency
  s426, // Upgrade Required
  s428, // Precondition Required
  s429, // Too Many Requests
  s431, // Request Header Fields Too Large
  s500, // Internal Server Error
  s501, // Not Implemented
  s502, // Bad Gateway
  s503, // Service Unavailable
  s504, // Gateway Timeout
  s505, // HTTP Version not supported
  s506, // Variant Also Negotiates
  s507, // Insufficient Storage
  s508, // Loop Detected
  s509, // Bandwidth Limit Exceeded
  s510, // Not Extended
  s511, // Network Authentication Required
}
