import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/animation/shimmer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/specializations_response_model.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctors_list_view.dart';
import 'doctors_speciality_list_view.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccessful ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return const MyShimmer();
          },
          specializationSuccessful: (model) {
            var specializationList = model.specializationDataList;
            return successfulState(specializationList);
          },
          specializationError: (error) {
            return const SizedBox.shrink();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget successfulState(List<SpecializationsData?>? specializationList) {
    return Expanded(
        child: Column(
      children: [
        DoctorsSpecialityListView(
          specializationsDataList: specializationList ?? [],
        ),
        verticalSpace(8),
        DoctorsListView(
          doctorsList: specializationList?.first?.doctorsList ?? [],
        ),
      ],
    ));
  }
}
