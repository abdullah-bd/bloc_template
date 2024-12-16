import 'package:dartz/dartz.dart';
import 'package:owl_commerce/core/app/app_prefs.dart';
import 'package:owl_commerce/core/app/constants.dart';
import 'package:owl_commerce/core/network/api_service.dart';
import 'package:owl_commerce/core/network/error_handler.dart';
import 'package:owl_commerce/core/network/failure.dart';
import 'package:owl_commerce/data/model/dto/response/article_response_dto.dart';
import 'package:owl_commerce/data/model/dto/response/base_response_dto.dart';
import 'package:owl_commerce/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final ApiService _apiService;
  final AppPreferences _appPref;

  RepositoryImpl(this._apiService, this._appPref);

  @override
  Future<Either<Failure, List<ArticleResponseDto>>> getArticles() async {
    try {
      final params = {
        "apiKey": Constants.key,
        "country": _appPref.getLocal().countryCode,
      };
      final response = await _apiService.get(endPoint: "top-headlines", params: params);
      // success
      // return either right
      // return data
      final data = BaseResponseDto.fromJson(response.data);
      return Right(data.articles!);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
