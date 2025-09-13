abstract class PortFolioStates {}

class InitialState extends PortFolioStates {}

class LoadingState extends PortFolioStates {}

class ResumeDownloadedState extends PortFolioStates {
  final bool data;
  ResumeDownloadedState(this.data);
}
