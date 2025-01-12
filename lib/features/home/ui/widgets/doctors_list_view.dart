import 'package:flutter/material.dart';
import 'package:omar_ahmad_advanced_concept/features/home/data/models/specializations_response_model.dart';
import 'package:omar_ahmad_advanced_concept/features/home/ui/widgets/doctors_list_view_item.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key, required this.doctorsList});
  final List<Doctors?>? doctorsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return DoctorsListViewItem(doctorsModel: doctorsList?[index]);
        },
      ),
    );
  }
}
