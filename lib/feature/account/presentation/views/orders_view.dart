import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruithub/feature/account/domain/entities/user_info_entity.dart';

import '../../../../core/common/custom_app_bar.dart';
import '../../../../core/services/get_it_services.dart';
import '../../domain/repos/user_info_repo.dart';
import '../manager/fetch_orders/fetch_orders_cubit.dart';
import 'widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  static const String routeName = 'Orders_View';
  final UserInfoEntity user;

  const OrdersView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FetchOrdersCubit(getIt.get<UserInfoRepo>())..fetchOrders(user),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: 'طلباتي'),
        body: const OrdersViewBody(),
      ),
    );
  }
}
