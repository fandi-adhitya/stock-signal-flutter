part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsFetchSuccess extends NewsState {
  final News news;
  NewsFetchSuccess(this.news);
  @override
  List<Object?> get props => [news]; 
}

class NewsFetchFail extends NewsState {
  final String message;
  NewsFetchFail(this.message);
  @override
  List<Object?> get props => [message]; 
}

class UauthorizedFromNews extends NewsState { 
  @override
  List<Object?> get props => [];
}





