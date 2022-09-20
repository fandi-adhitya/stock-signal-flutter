
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fawz_apps/models/models.dart';
import 'package:fawz_apps/services/services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if(event is FetchNews){
        try{
          final response = await NewsServices().getNews();
          if(response.success == true) {
            emit(NewsFetchSuccess(response));
          }
          else if(response.statusCode == 401){
            emit(UauthorizedFromNews());
          } 
        } catch(_) {
          emit(NewsFetchFail("Failed to fetch data from server"));
        }
      }
    });
  }
}
