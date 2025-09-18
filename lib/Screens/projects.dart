import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/bloc_provider.dart';
import 'package:flutter_application_1/state_management/events.dart';
import 'package:flutter_application_1/state_management/state.dart';
import 'package:flutter_application_1/widgets/mobile_project_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/widgets.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key});

  @override
  State<ProjectWidget> createState() => _ProjectWidget();
}

class _ProjectWidget extends State<ProjectWidget> {
  bool isExpanded = false;
  bool isNeuExpanded = false;
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
                        BlocBuilder<PortFolioBloc, PortFolioStates>(
                          builder: (context, state) {
                            isNeuExpanded = state.isNeuProjectTapped ?? false;
                            return project(
                              context: context,
                              imageString: 'images/tata-neu.png',
                              projectTitle:
                                  'Tata Neu - Life style & Travel Super App\n',
                              company: 'Tata Consultancy Services\n',
                              position: 'Flutter Application Developer',
                              isSbi: false,
                              onTap: () {
                                context.read<PortFolioBloc>().add(
                                  NeuProjectTap(),
                                );
                              },
                              childIcon: isNeuExpanded
                                  ? Icon(Icons.arrow_upward)
                                  : Icon(Icons.arrow_downward),
                              isExpanded: isNeuExpanded,
                            );
                          },
                        ),
                        BlocBuilder<PortFolioBloc, PortFolioStates>(
                          builder: (context, state) {
                            isExpanded = state.isSbiProjectTapped ?? false;
                            return project(
                              context: context,
                              imageString: 'images/yono_sbi.png',
                              projectTitle: 'SBI YONO(UPI)\n',
                              company: 'Tata Consultancy Services\n',
                              position: 'Flutter Application Developer',
                              isSbi: true,
                              onTap: () {
                                context.read<PortFolioBloc>().add(
                                  SbiProjectTap(),
                                );
                              },
                              childIcon: isExpanded
                                  ? Icon(Icons.arrow_upward)
                                  : Icon(Icons.arrow_downward),
                              isExpanded: isExpanded,
                            );
                          },
                        ),
                      ],
                    )
                  : Row(
                      spacing: 40,
                      children: [
                        Expanded(
                          child: BlocBuilder<PortFolioBloc, PortFolioStates>(
                            builder: (context, state) {
                              isNeuExpanded = state.isNeuProjectTapped ?? false;
                              return project(
                                context: context,
                                imageString: 'images/tata-neu.png',
                                projectTitle:
                                    'Tata Neu - Life style & Travel Super App\n',
                                company: 'Tata Consultancy Services\n',
                                position: 'Flutter Application Developer',
                                isSbi: false,
                                onTap: () {
                                  context.read<PortFolioBloc>().add(
                                    NeuProjectTap(),
                                  );
                                },
                                childIcon: isNeuExpanded
                                    ? Icon(Icons.arrow_upward)
                                    : Icon(Icons.arrow_downward),
                                isExpanded: isNeuExpanded,
                              );
                            },
                          ),
                        ),

                        Expanded(
                          child: BlocBuilder<PortFolioBloc, PortFolioStates>(
                            builder: (context, state) {
                              isExpanded = state.isSbiProjectTapped ?? false;
                              return project(
                                context: context,
                                imageString: 'images/yono_sbi.png',
                                projectTitle: 'SBI YONO(UPI)\n',
                                company: 'Tata Consultancy Services\n',
                                position: 'Flutter Application Developer',
                                isSbi: true,
                                onTap: () {
                                  context.read<PortFolioBloc>().add(
                                    SbiProjectTap(),
                                  );
                                },
                                childIcon: isExpanded
                                    ? Icon(Icons.arrow_upward)
                                    : Icon(Icons.arrow_downward),
                                isExpanded: isExpanded,
                              );
                            },
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
