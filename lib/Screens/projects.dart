import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/bloc_provider.dart';
import 'package:flutter_application_1/state_management/events.dart';
import 'package:flutter_application_1/state_management/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/widgets.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key});

  @override
  State<ProjectWidget> createState() => _ProjectWidget();
}

class _ProjectWidget extends State<ProjectWidget> {
  bool isSbiProjectTapped = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20),

          LayoutBuilder(
            builder: (context, constraints) {
              final isSmallScreen = constraints.maxWidth < 600;

              return isSmallScreen
                  ? Column(
                      spacing: 30,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 18,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.min,
                                spacing: 15,
                                children: [
                                  SizedBox(
                                    height: 70,
                                    width: 80,
                                    child: Image.asset('images/yono_sbi.png'),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                      // style: TextStyle(fontSize: 12),
                                      children: [
                                        TextSpan(
                                          text: 'SBI YONO(UPI)\n',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        WidgetSpan(child: SizedBox(height: 22)),
                                        TextSpan(
                                          text: 'Tata Consultancy Services\n',
                                        ),
                                        TextSpan(
                                          text: 'Flutter Application Developer',
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Text('SBI YONO(UPI)'),
                                ],
                              ),
                              BlocBuilder<PortFolioBloc, PortFolioStates>(
                                builder: (context, state) {
                                  isSbiProjectTapped =
                                      state.isSbiProjectTapped ?? false;
                                  return InkWell(
                                    onTap: () {
                                      context.read<PortFolioBloc>().add(
                                        SbiProjectTap(),
                                      );
                                    },
                                    child: isSbiProjectTapped
                                        ? Icon(Icons.arrow_upward)
                                        : Icon(Icons.arrow_downward),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // spacing: 10,
                          children: [
                            SizedBox(
                              height: 70,
                              width: 80,
                              child: Image.asset('images/yono_sbi.png'),
                            ),
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodySmall,
                                // style: TextStyle(fontSize: 12),
                                children: [
                                  TextSpan(
                                    text: 'SBI YONO(UPI)\n',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  WidgetSpan(child: SizedBox(height: 22)),
                                  TextSpan(text: 'Tata Consultancy Services\n'),
                                  TextSpan(
                                    text: 'Flutter Application Developer',
                                  ),
                                ],
                              ),
                            ),

                            // Text('SBI YONO(UPI)'),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // spacing: 10,
                            children: [
                              SizedBox(
                                height: 70,
                                width: 80,
                                child: Image.asset('images/yono_sbi.png'),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.bodySmall,
                                  // style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: 'SBI YONO(UPI)\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    WidgetSpan(child: SizedBox(height: 22)),
                                    TextSpan(
                                      text: 'Tata Consultancy Services\n',
                                    ),
                                    TextSpan(
                                      text: 'Flutter Application Developer',
                                    ),
                                  ],
                                ),
                              ),

                              // Text('SBI YONO(UPI)'),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // spacing: 10,
                            children: [
                              SizedBox(
                                height: 70,
                                width: 80,
                                child: Image.asset('images/yono_sbi.png'),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.bodySmall,
                                  // style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: 'SBI YONO(UPI)\n',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    WidgetSpan(child: SizedBox(height: 22)),
                                    TextSpan(
                                      text: 'Tata Consultancy Services\n',
                                    ),
                                    TextSpan(
                                      text: 'Flutter Application Developer',
                                    ),
                                  ],
                                ),
                              ),

                              // Text('SBI YONO(UPI)'),
                            ],
                          ),
                        ),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
