import 'package:flutter/material.dart';

Widget skillGridView({
  required BuildContext context,
  required List<dynamic> items,
  List<double>? percentages,
}) {
  return GridView.builder(
    shrinkWrap: true,
    // scrollDirection: Axis.horizontal,
    itemCount: items.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: percentages != null ? 4 : 3,
      childAspectRatio: 2.8,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      mainAxisExtent: percentages != null ? 100 : 60,
    ),
    itemBuilder: (context, index) {
      return Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 12),
          child: percentages != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        items[index],
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),

                    SizedBox(height: 5),
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: percentages[index]),
                      duration: const Duration(seconds: 3),
                      builder: (context, value, _) {
                        return LinearProgressIndicator(
                          value: value,
                          minHeight: 5,
                        );
                      },
                    ),
                  ],
                )
              : Column(
                  children: [
                    Center(
                      child: Text(
                        items[index],
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
