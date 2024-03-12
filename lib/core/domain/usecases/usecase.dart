import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../failures/failures.dart';

/// * a class that needs to be followed by all usecases
/// Type -> what we should return (entities)
/// Params -> what we want to pass
/// use [void] as param if you don't need to pass anything
/// common example is getting a list or details from remote/local
/// UseCase -> left - what to return. right - what to pass
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseStream<Type, Params> {
  Either<Failure, Stream<Type?>> callStream(Params params);
}

// this is different from UseCaseStream. It uses different position of '?'
//  Stream<Type?>> vs  Stream<Type>?>
abstract class UseCaseStream2<Type, Params> {
  Either<Failure, Stream<Type>?> callStream2(Params params);
}

abstract class UseCaseNormal<Type, Params> {
  Either<Failure, Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
