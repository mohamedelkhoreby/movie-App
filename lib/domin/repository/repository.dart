import '../../data/network/failure.dart';
import '../model/model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository{
 Future<Either<Failure,HomeObject>> getHome();
}