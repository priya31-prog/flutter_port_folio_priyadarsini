import 'package:flutter/material.dart';

Widget stateManagement(BuildContext context) {
  final List<String> stateMans = ['Mobx', 'RiverPod', 'Bloc'];
  return GridView.builder(
    shrinkWrap: true,
    // scrollDirection: Axis.horizontal,
    itemCount: stateMans.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 2.8,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      mainAxisExtent: 60,
    ),
    itemBuilder: (context, index) {
      return Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            children: [
              Center(
                child: Text(
                  stateMans[index],
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
