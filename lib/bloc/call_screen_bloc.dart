


import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_concurrent_api_call/bloc/call_screen_event.dart';
import 'package:flutter_concurrent_api_call/bloc/call_screen_state.dart';
import 'package:flutter_concurrent_api_call/models/all_users_list.dart';
import 'package:flutter_concurrent_api_call/models/single_user_response.dart';
import 'package:flutter_concurrent_api_call/models/user_comments.dart';

import '../data/rest_services.dart';

class CallScreenBloc extends Bloc<CallEvent,CallScreenState>{

  CallScreenBloc(callScreenInitial) : super(CallScreenInitial()){

    on<SingleUserCallEvent>(singleUserCallEvent);
    on<AllUserCallEvent>(allUserCallEvent);
    on<UserCommentsCallEvent>(userCommentsEvent);


    on<ApiCallSerialEvent>(allApiRequest);

  }


  @override // WORKING
  void onChange(Change<CallScreenState> change) {
    super.onChange(change);
   // print('on change $change');
  }

  FutureOr<void> singleUserCallEvent(SingleUserCallEvent event, Emitter<CallScreenState> emit) async{
    emit(SingleScreenLoadingState());

    SingleUserResponse singleUserResponse = await getSingleUserResponse();


    emit(SingleScreenSuccessState(singleUserResponse: singleUserResponse));

  }
  
  FutureOr<void> userCommentsEvent(UserCommentsCallEvent event, Emitter<CallScreenState> emit) async {
    emit(UserCommentsLoadingState());
    
    List<UserCommentsResponse> userCommentResponseList = await getUserComments(); 
    
    emit(UserCommentsSuccessState(userCommentsList: userCommentResponseList));
  }
  
  FutureOr<void> allUserCallEvent(AllUserCallEvent allUserCallEvent,Emitter<CallScreenState> emit) async{
    
    emit(AllUserLoadingState());
    
    AllUsersListResponse allUsersListResponse = await getAllUserResponse();
    
    emit(AllUserSuccessState(allUsersListResponse: allUsersListResponse));
  }


  FutureOr<void> allApiRequest(ApiCallSerialEvent apiCallSerialEvent,Emitter<CallScreenState> emit) async{

    emit(AllAPiSerialLoadingState());

    AllUsersListResponse allUsersListResponse = await getAllUserResponse();
    List<UserCommentsResponse> userCommentResponseList = await getUserComments();
    SingleUserResponse singleUserResponse = await getSingleUserResponse();



    /*List<dynamic> responses = await Future.wait([
      getAllUserResponse(),
      getUserComments(),
      getSingleUserResponse(),
    ]);*/

    // Extracting individual responses
    /*AllUsersListResponse allUsersListResponse = responses[0];
    List<UserCommentsResponse> userCommentResponseList = responses[1];
    SingleUserResponse singleUserResponse = responses[2];*/

    emit(AllAPiSerialState(allUsersListResponse: allUsersListResponse,
        userCommentsList: userCommentResponseList,
        singleUserResponse: singleUserResponse));
  }

}