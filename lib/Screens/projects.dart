import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_utils.dart';
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
                            return Projects(
                              projectParams: ProjectArgs(
                                childIcon: isNeuExpanded
                                    ? Icon(Icons.arrow_upward)
                                    : Icon(Icons.arrow_downward),
                                company: 'Tata Consultancy Services\n',
                                imageString: 'images/tata-neu.png',
                                isExpanded: isNeuExpanded,
                                isSbi: false,
                                onTap: () {
                                  context.read<PortFolioBloc>().add(
                                    NeuProjectTap(),
                                  );
                                },
                                position: 'Flutter Application Developer',
                                projectTitle:
                                    'Tata Neu - Life style & Travel Super App\n',
                              ),
                            );
                          },
                        ),
                        BlocBuilder<PortFolioBloc, PortFolioStates>(
                          builder: (context, state) {
                            isExpanded = state.isSbiProjectTapped ?? false;
                            return Projects(
                              projectParams: ProjectArgs(
                                childIcon: isExpanded
                                    ? Icon(Icons.arrow_upward)
                                    : Icon(Icons.arrow_downward),
                                company: 'Tata Consultancy Services\n',
                                imageString: 'images/yono_sbi.png',
                                isExpanded: isExpanded,
                                isSbi: true,
                                onTap: () {
                                  context.read<PortFolioBloc>().add(
                                    SbiProjectTap(),
                                  );
                                },
                                position: 'Flutter Application Developer',
                                projectTitle: 'SBI YONO(UPI)\n',
                              ),
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
                              return Projects(
                                projectParams: ProjectArgs(
                                  childIcon: isNeuExpanded
                                      ? Icon(Icons.arrow_upward)
                                      : Icon(Icons.arrow_downward),
                                  company: 'Tata Consultancy Services\n',
                                  imageString: 'images/tata-neu.png',
                                  isExpanded: isNeuExpanded,
                                  isSbi: false,
                                  onTap: () {
                                    context.read<PortFolioBloc>().add(
                                      NeuProjectTap(),
                                    );
                                  },
                                  position: 'Flutter Application Developer',
                                  projectTitle:
                                      'Tata Neu - Life style & Travel Super App\n',
                                ),
                              );
                            },
                          ),
                        ),

                        Expanded(
                          child: BlocBuilder<PortFolioBloc, PortFolioStates>(
                            builder: (context, state) {
                              isExpanded = state.isSbiProjectTapped ?? false;
                              return Projects(
                                projectParams: ProjectArgs(
                                  childIcon: isExpanded
                                      ? Icon(Icons.arrow_upward)
                                      : Icon(Icons.arrow_downward),
                                  company: 'Tata Consultancy Services\n',
                                  imageString: 'images/yono_sbi.png',
                                  isExpanded: isExpanded,
                                  isSbi: true,
                                  onTap: () {
                                    context.read<PortFolioBloc>().add(
                                      SbiProjectTap(),
                                    );
                                  },
                                  position: 'Flutter Application Developer',
                                  projectTitle: 'SBI YONO(UPI)\n',
                                ),
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
