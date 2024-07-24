

import '../models/all_users_list.dart';
import '../models/single_user_response.dart';
import '../models/user_comments.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

Future<SingleUserResponse> getSingleUserResponse() async {


  final response = await http.get(Uri.parse(singleUserInfo)).timeout(Duration(seconds: 60));

    print('Single User API called');
 // if(response.statusCode == 200){
    SingleUserResponse singleUserResponse = singleUserResponseFromJson(response.body);
    print('Single User API Response ${response.body}');
  await Future.delayed(Duration(seconds: 5));
  //}
  return singleUserResponse;

}

Future<AllUsersListResponse> getAllUserResponse() async {

  print('All User API called');
  final response = await http.get(Uri.parse(userList)).timeout(Duration(seconds: 60));
  AllUsersListResponse allUsersListResponse = allUsersListResponseFromJson(response.body);
  await Future.delayed(Duration(seconds: 5));
  print('Single User API Response ${response.body}');
  return allUsersListResponse;
}

Future<List<UserCommentsResponse>> getUserComments() async {
  final response = await http.get(Uri.parse(userComments)).timeout(Duration(seconds: 60));

  print('User Comments API called');
  List<UserCommentsResponse> userCommentsResponse = userCommentsResponseFromJson(response.body);
  await Future.delayed(Duration(seconds: 5));
  print('User comments API Response ${response.body}');

  return userCommentsResponse;

}