import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:teste_firebase_web/core/common/errors/exceptions.dart';
import 'package:teste_firebase_web/core/common/errors/failures.dart';
import 'package:teste_firebase_web/core/common/services/connection/internet_connection_checker_impl.dart';

class TreaterService {
  Future<Either<Failure, T>> call<T>(
    Future<T> Function() code, {
    String? errorIdentification,
    bool online = false,
  }) async {
    if (await InternetConnectionCheckerImpl().isConnected || !online) {
      try {
        return Right(await code());
      } on Failure catch (e) {
        //log(e.toString());
        return Left(e);
      } catch (e) {
        if (e is DioException) {
          return Left(
            ServerFailure(
              title: '$errorIdentification',
              description: e.response?.data['message'] ?? 'Houve um erro inesperado',
            ),
          );
        }
        if (e is ServerException) {
          return Left(
            ServerFailure(
              title: '$errorIdentification',
              description: e.message,
            ),
          );
        }
        if (e is DBException) {
          return Left(
            DatabaseFailure(
              title: '$errorIdentification',
              description: e.message,
            ),
          );
        }
        if (e is NotFoundException) {
          return Left(
            NotFoundFailure(
              title: '$errorIdentification',
              description: e.message,
            ),
          );
        }
        return Left(
          Failure(
            title: '$errorIdentification',
            description: e.toString(),
          ),
        );
      }
    } else {
      return const Left(Failure(title: 'Sem conexão com a internet'));
    }
  }
}
