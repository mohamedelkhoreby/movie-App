abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}