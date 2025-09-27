import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:port_folio/state_management/bloc_provider.dart';
import 'package:port_folio/state_management/events.dart';
import 'package:port_folio/state_management/state.dart';

Widget getDownloadButton(BuildContext context) {
  return BlocBuilder<PortFolioBloc, PortFolioStates>(
    builder: (context, state) {
      bool isResumeDownloaded = state.resumeDownload ?? false;

      return state.isLoadingResume ?? false
          ? CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
              strokeWidth: 2,
            )
          : Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.rectangle,
              ),
              child: InkWell(
                onTap: () {
                  // if (!isResumeDownloaded) {
                  context.read<PortFolioBloc>().add(LoadData());
                  // }
                },
                child: !isResumeDownloaded
                    ? Text(
                        'Download Resume',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    : Text(
                        'Downloaded',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
              ),
            );
    },
  );
}
