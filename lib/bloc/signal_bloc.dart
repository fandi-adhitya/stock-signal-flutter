import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fawz_apps/models/models.dart';
import 'package:fawz_apps/services/services.dart';
part 'signal_event.dart';
part 'signal_state.dart';

class SignalBloc extends Bloc<SignalEvent, SignalState> {
  SignalBloc() : super(SignalInitial()) {
    on<SignalEvent>((event, emit) async {
      if(event is FetchSignal) {
        var page = 1;
        emit(SignalInitial());
        // User? checkUserIsTrading = await UserServices().userData();
        // if(checkUserIsTrading!.data.isTrading == false) {
        //   emit(SignalWithBottomSheet());
        // }
        try {
            SignalResponse initSignal = await SignalServices().getSignal(page);
            emit(SignalLoaded(signal: initSignal.data!.toList(), hasReachedMax: false));
        } catch (_) {
          emit(SignalError());
        }
      }
    });
  }

}

// bool _hasReachedMax(SignalState state) => state is SignalLoaded && state.hasReachedMax;

