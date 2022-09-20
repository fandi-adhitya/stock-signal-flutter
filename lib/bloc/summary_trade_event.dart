part of 'summary_trade_bloc.dart';

abstract class SummaryTradeEvent extends Equatable {
  const SummaryTradeEvent();
}


class FetchSummaryTrade extends SummaryTradeEvent{
    List<Object> get props => [];
}