import 'dart:developer';
import 'package:flutter_application_1/Screens/resume_download.dart';
import 'package:flutter_application_1/common_utils.dart';
import 'package:flutter_application_1/state_management/events.dart';
import 'package:flutter_application_1/state_management/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortFolioBloc extends Bloc<PortFolioEvents, PortFolioStates> {
  PortFolioBloc() : super(PortFolioStates.initial()) {
    on<LoadData>((event, emit) async {
      emit(state.copyWith(isLoadingResume: true));
      final fileL = Utils.generateUniQueString(2);
      final result = await ResumeDownload().getResume("Priyadarsini$fileL.pdf");
      await Future.delayed(Duration(seconds: 2));
      emit(state.copyWith(resumeDownload: result, isLoadingResume: false));
    });

    on<TapAbout>((event, emit) async {
      emit(state.copyWith(isTappedAbout: !(state.isTappedAbout!)));
    });

    on<TapLike>((event, emit) {
      emit(state.copyWith(isLiked: !(state.isLiked!)));
    });
    on<SbiProjectTap>((event, emit) {
      emit(state.copyWith(isSbiProjectTapped: !(state.isSbiProjectTapped!)));
    });
  }
  @override
  void onChange(Change<PortFolioStates> change) {
    super.onChange(change);
    log("PortfolioBloc onChange: $change");
  }
}
