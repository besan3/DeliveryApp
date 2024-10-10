import 'package:dartz/dartz.dart';
import 'package:delivery/core/errors/fauilers.dart';
import 'package:delivery/features/home/domain/entites/add_order_entity.dart';
import 'package:delivery/features/home/domain/repository/home_reposirory.dart';

class AddOrderUseCase {
  final HomeRepository homeRepository;
  const AddOrderUseCase({required this.homeRepository});
  Future<Either<Failure,AddOrderEntity>> call(String date,String description_one,String staff_names) async{
    return await homeRepository.addOrder(date, description_one, staff_names);
  }
}