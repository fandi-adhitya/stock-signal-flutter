part of 'signal_bloc.dart';

abstract class SignalEvent extends Equatable {
  const SignalEvent();
}

class FetchSignal extends SignalEvent{
    List<Object> get props => [];
}

