class PortFolioStates {
  final bool? isLoadingResume;
  final bool? isLiked;
  final bool? resumeDownload;
  final bool? isTappedAbout;
  final bool? isSbiProjectTapped;
  final bool? isNeuProjectTapped;

  const PortFolioStates({
    this.isLiked = false,
    this.isLoadingResume = false,
    this.resumeDownload = false,
    this.isTappedAbout = false,
    this.isSbiProjectTapped = false,
    this.isNeuProjectTapped = false,
  });

  factory PortFolioStates.initial() => const PortFolioStates();

  PortFolioStates copyWith({
    bool? isLoadingResume,
    bool? isLiked,
    bool? resumeDownload,
    bool? isTappedAbout,
    bool? isSbiProjectTapped,
    bool? isNeuProjectTapped,
  }) {
    return PortFolioStates(
      isLoadingResume: isLoadingResume ?? this.isLoadingResume,
      isLiked: isLiked ?? this.isLiked,
      resumeDownload: resumeDownload ?? this.resumeDownload,
      isTappedAbout: isTappedAbout ?? this.isTappedAbout,
      isNeuProjectTapped: isNeuProjectTapped ?? this.isNeuProjectTapped,
      isSbiProjectTapped: isSbiProjectTapped ?? this.isSbiProjectTapped,
    );
  }
}

// abstract class PortFolioStates {}

// class InitialState extends PortFolioStates {}

// class LoadingState extends PortFolioStates {}

// class ResumeDownloadedState extends PortFolioStates {
//   final bool data;
//   ResumeDownloadedState(this.data);
// }

// class TapAboutInitialState extends PortFolioStates {
//   final bool init;
//   TapAboutInitialState(this.init);
// }

// class TappedOnAbout extends PortFolioStates {
//   final bool isTapped;

//   TappedOnAbout(this.isTapped);
// }

// class TappedLike extends PortFolioStates {
//   final bool liked;

//   TappedLike(this.liked);
// }
