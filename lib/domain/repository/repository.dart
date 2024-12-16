import 'package:dartz/dartz.dart';
import 'package:owl_commerce/core/network/failure.dart';
import 'package:owl_commerce/data/model/dto/response/article_response_dto.dart';

abstract class Repository {
  Future<Either<Failure, List<ArticleResponseDto>>> getArticles();
}
