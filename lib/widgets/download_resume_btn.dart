import 'package:flutter/material.dart';
import 'package:flutter_application_1/state_management/bloc_provider.dart';
import 'package:flutter_application_1/state_management/events.dart';
import 'package:flutter_application_1/state_management/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget getDownloadButton({
  required BuildContext context,
  required IconData icon,
  required String text,
  // required PortFolioBloc bloc,
}) {
  return BlocBuilder<PortFolioBloc, PortFolioStates>(
    builder: (context, state) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 30,
          backgroundColor: state.resumeDownload == true
              ? const Color.fromARGB(255, 89, 69, 108).withAlpha(150)
              : Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(3),
            side: BorderSide(color: Colors.green),
          ),
        ),
        onPressed: () {
          if (text == 'Download Resume') {
            context.read<PortFolioBloc>().add(LoadData());
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              // isDownloadedResume
              //     ? Icons.download_done
              //     : Icons.download,
              size: 15,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              text,
              // isDownloadedResume
              //     ? 'Downloaded'
              //     : 'Download Resume',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
    },
  );
}
