import 'package:dartz/dartz.dart';
import 'package:delivery/features/home/domain/entites/order_entity.dart';

import '../../../../core/errors/fauilers.dart';
import '../repository/home_reposirory.dart';

class ShowOrdersUsecase{
  final HomeRepository homeRepository;
  const ShowOrdersUsecase({required this.homeRepository});
  Future<Either<Failure,OrderEntity>> call(String start_at,String end_at) async{
    return await homeRepository.showOrders(start_at, end_at);
  }
}