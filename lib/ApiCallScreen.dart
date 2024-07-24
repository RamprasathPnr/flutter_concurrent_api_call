

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_concurrent_api_call/bloc/call_screen_bloc.dart';

import 'bloc/call_screen_event.dart';
import 'bloc/call_screen_state.dart';

class ApiCallScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context){
   // print('main function');

    BlocProvider.of<CallScreenBloc>(context).add(SingleUserCallEvent());
    BlocProvider.of<CallScreenBloc>(context).add(UserCommentsCallEvent());
    BlocProvider.of<CallScreenBloc>(context).add(AllUserCallEvent());


    return Scaffold(
      appBar: AppBar(title: Text('Api Call Screen'),),
      body: Container(
        child: Column(
          children: [
            SectionOne(),
            const SizedBox(height: 20,),
          /*
            const SizedBox(height: 20,),*/
            SectionThree(),
            const SizedBox(height: 20,),
            SectionTwo(),
          ],
        ),
      ),
    );
  }
}


class SectionOne extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallScreenBloc,CallScreenState>(
       builder: (context,state){
        // print('build function ${state}');
         if(state is SingleScreenLoadingState){
           return CircularProgressIndicator();
         } else if(state is SingleScreenSuccessState){
           return Container(
             height: 300,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 CircleAvatar(
                   radius: 60,
                   backgroundImage: NetworkImage(
                     state.singleUserResponse.data.avatar,
                   ),
                 ),
                 SizedBox(height: 20),
                 Text(
                   'Name: ${state.singleUserResponse.data.firstName}',
                   style: TextStyle(fontSize: 20),
                 ),
                 SizedBox(height: 10),
                 Text(
                   'Email: ${state.singleUserResponse.data.email}',
                   style: TextStyle(fontSize: 20),
                 ),
               ],
             ),
           );
         }
         else if(state is SingleScreenFailureState){
           return Container(
             child: Text(state.message),
           );
         }
         return Container();
       },
      // buildWhen: (context,state){
      //    return state is SingleScreenLoadingState || state is SingleScreenSuccessState || state is SingleScreenFailureState;
      // },

    );
  }

}

class SectionTwo extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return BlocBuilder<CallScreenBloc,CallScreenState>(
      builder: (context,state){
        if(state is AllUserLoadingState){
           return CircularProgressIndicator();
        }
        else if(state is AllUserSuccessState){
          return  Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.allUsersListResponse.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(state.allUsersListResponse.data[index].avatar),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                );
              },
            ),
          );
        }
        else if(state is AllUserFailureState){
          return Container(
            child: Text(state.message),
          );
        }
        return Container();

      },
      buildWhen:(context,state){
        return state is AllUserLoadingState || state is AllUserSuccessState || state is AllUserFailureState;
      },
    );
  }
}


class SectionThree extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return BlocBuilder<CallScreenBloc,CallScreenState>(
      builder: (context,state){
        if(state is UserCommentsLoadingState){
          return CircularProgressIndicator();
        }
        else if(state is UserCommentsSuccessState){
          return  Container(
            height: 200,
            child: ListView.builder(
              itemCount: state.userCommentsList.length,
              itemBuilder: (context, index) {
                final item = state.userCommentsList[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.email),
                  onTap: () {
                    // Do something when the ListTile is tapped
                    print('Tapped on ${item.name}');
                  },
                );
              },
            ),
          );
        }
        else if(state is UserCommentsFailureState){
          return Container(
            child: Text(state.message),
          );
        }

        return Container();

      },
      buildWhen:(context,state){
        return state is UserCommentsLoadingState || state is UserCommentsSuccessState || state is UserCommentsFailureState;
      },
    );
  }

}