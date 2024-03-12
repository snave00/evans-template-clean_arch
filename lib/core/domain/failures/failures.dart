abstract class Failure {
  Failure(this.errorMessage);
  final String errorMessage;
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.errorMessage);
}

class CacheFailure extends Failure {
  CacheFailure(super.errorMessage);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.errorMessage);
}

class PlatformFailure extends Failure {
  PlatformFailure(super.errorMessage);
}

class GeneralFailure extends Failure {
  GeneralFailure(super.errorMessage);
}
