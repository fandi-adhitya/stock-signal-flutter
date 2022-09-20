part of 'summary_trade_bloc.dart';

abstract class SummaryTradeState extends Equatable {
  const SummaryTradeState();
}

class SummaryTradeInitial extends SummaryTradeState {
  @override
  List<Object> get props => [];
}

class SummaryTradeLoaded extends SummaryTradeState {
  final SummaryTradeM summaryTrade;
  SummaryTradeLoaded(this.summaryTrade);
  
  @override
  List<Object> get props => [];
}

class SummaryTradeError extends SummaryTradeState {
  @override
  List<Object> get props => [];
}

