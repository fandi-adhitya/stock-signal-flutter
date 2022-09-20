part of 'signal_bloc.dart';

abstract class SignalState extends Equatable {
  const SignalState();
}

class SignalInitial extends SignalState {
  @override
  List<Object> get props => [];
}

class SignalError extends SignalState {
  @override
  List<Object> get props => [];
}


class SignalLoaded extends SignalState {
  final List<Data> signal;
  final bool hasReachedMax;

  SignalLoaded({
    required this.signal,
    required this.hasReachedMax
  });

  SignalLoaded copyWith({
    List<Data>? signal,
    bool? hasReachedMax
  }) {
    return SignalLoaded(
      signal : signal ?? this.signal,
      hasReachedMax : hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  List<Object> get props => [signal, hasReachedMax];
}

