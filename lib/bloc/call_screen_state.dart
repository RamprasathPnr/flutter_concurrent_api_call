


import 'package:flutter_concurrent_api_call/models/all_users_list.dart';
import 'package:flutter_concurrent_api_call/models/user_comments.dart';

import '../models/single_user_response.dart';

abstract class CallScreenState{

}


class CallScreenInitial extends CallScreenState{

}


class SingleScreenLoadingState extends CallScreenState{

}

class SingleScreenSuccessState extends CallScreenState{

  final SingleUserResponse singleUserResponse;

  SingleScreenSuccessState({required this.singleUserResponse});
}

class SingleScreenFailureState extends CallScreenState{

  final String message;

  SingleScreenFailureState(this.message);

}


class UserCommentsLoadingState extends CallScreenState{

}

class UserCommentsSuccessState extends CallScreenState{

  List<UserCommentsResponse> userCommentsList;

  UserCommentsSuccessState({required this.userCommentsList});

}

class UserCommentsFailureState extends CallScreenState{

  final String message;

  UserCommentsFailureState(this.message);

}

class AllUserLoadingState extends CallScreenState{

}

class AllUserSuccessState extends CallScreenState{

  final AllUsersListResponse allUsersListResponse;

  AllUserSuccessState({required this.allUsersListResponse});

}

class AllUserFailureState extends CallScreenState{

  final String message;

  AllUserFailureState(this.message);

}



class AllAPiSerialLoadingState extends CallScreenState{

}


class AllAPiSerialState extends CallScreenState{

  List<UserCommentsResponse> userCommentsList;
  final AllUsersListResponse allUsersListResponse;
  final SingleUserResponse singleUserResponse;

  AllAPiSerialState({required this.allUsersListResponse,required this.userCommentsList,required this.singleUserResponse});

}