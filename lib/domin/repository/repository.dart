import '../model/model.dart';

abstract class Repository{
 Future<Either<Failure,HomeObject>> getHome();
}