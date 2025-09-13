import 'package:flutter_application_1/Screens/home_page.dart';
import 'package:flutter_application_1/Screens/resume_download.dart';
import 'package:flutter_application_1/state_management/events.dart';
import 'package:flutter_application_1/state_management/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortFolioBloc extends Bloc<PortFolioEvents, PortFolioStates> {
  PortFolioBloc() : super(InitialState()) {
    on<LoadData>((event, emit) async {
      emit(LoadingState());
      final fileL = generateUniQueString(1);
      final result = await ResumeDownload().getResume("Priyadarsini$fileL.pdf");
      await Future.delayed(Duration(seconds: 2));
      emit(ResumeDownloadedState(result));
    });
  }
}
