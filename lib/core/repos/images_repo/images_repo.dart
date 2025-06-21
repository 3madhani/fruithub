import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/failure.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage({required File image});
}
