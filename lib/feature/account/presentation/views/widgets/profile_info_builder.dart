import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper/get_dummy_user.dart';
import '../../manager/user_info/user_info_cubit.dart';
import '../../manager/user_info/user_info_state.dart';
import 'profile_info.dart';

class ProfileInfoBuilder extends StatefulWidget {
  const ProfileInfoBuilder({super.key});

  @override
  State<ProfileInfoBuilder> createState() => _ProfileInfoBuilderState();
}

class _ProfileInfoBuilderState extends State<ProfileInfoBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoLoading) {
          return Skeletonizer(
            child: ProfileInfo(userInfoEntity: getDummyUser()),
          );
        } else if (state is UserInfoError) {
          return Center(child: Text(state.message));
        } else if (state is UserInfoLoaded) {
          return ProfileInfo(userInfoEntity: state.user);
        } else {
          return const Center(child: Text("Something went wrong"));
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<UserInfoCubit>().fetchUserInfo();
  }
}
