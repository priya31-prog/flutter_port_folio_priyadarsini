import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/bloc_provider.dart';
import 'package:flutter_application_1/state_management/events.dart';
import 'package:flutter_application_1/state_management/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget aboutContent(BuildContext context) {
  return BlocBuilder<PortFolioBloc, PortFolioStates>(
    builder: (context, state) {
      bool isTapped = state.isTappedAbout ?? false;

      return InkWell(
        onTap: () {
          context.read<PortFolioBloc>().add(TapAbout());
        },
        child: Card(
          elevation: 30,
          margin: EdgeInsets.all(10),
          color: Colors.white.withAlpha(200),
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 24),
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  overflow: isTapped
                      ? TextOverflow.visible
                      : TextOverflow.ellipsis,
                  maxLines: isTapped ? null : 2,
                  // style: TextStyle(fontSize: 24),
                  "I am a Flutter Developer with 3+ years of experience building "
                  "cross-platform mobile applications. hghjgkjb ijiiiiiiiiiiiiii    hhkhkkk hjkkkkkkkkkkkjk bdnbfhjd kdjfksd idoter orirower oeiqwoir djshjd",
                ),
                if (isTapped) ...[
                  SizedBox(height: 5),
                  Text(
                    textAlign: TextAlign.center,
                    'I’ve contributed to large-scale apps '
                    "like SBI YONO and Tata Neu, specializing in Flutter, Dart, MobX, Riverpod, "
                    "and REST APIs. I focus on creating seamless, user-friendly, and high-performance "
                    "digital experiences.",
                  ),
                ],
                SizedBox(height: 15),

                BlocBuilder<PortFolioBloc, PortFolioStates>(
                  builder: (context, state) {
                    if (state.isLoadingResume == false &&
                        state.resumeDownload == false) {
                    } else if (state.isLoadingResume == true) {
                      //change this to downloading with animation
                      return CircularProgressIndicator();
                    } else if (state.resumeDownload == true) {}
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
