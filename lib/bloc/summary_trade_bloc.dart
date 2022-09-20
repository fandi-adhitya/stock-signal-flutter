import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fawz_apps/models/SummaryTrade.dart';
import 'package:fawz_apps/services/services.dart';

part 'summary_trade_event.dart';
part 'summary_trade_state.dart';

class SummaryTradeBloc extends Bloc<SummaryTradeEvent, SummaryTradeState> {
  SummaryTradeBloc() : super(SummaryTradeInitial()) {
    on<SummaryTradeEvent>((event, emit) async {
        if(event is FetchSummaryTrade){
          emit(SummaryTradeInitial());
          try{
            var response = await SummaryTradeService().getSummaryTrade();
            emit(SummaryTradeLoaded(response));
          } catch (e) {
            emit(SummaryTradeError());
          }
        }
    });
  }
}
