

import 'package:flutter/material.dart';

@immutable
abstract class CallEvent {
}


class SingleUserCallEvent extends CallEvent{
}


class AllUserCallEvent extends CallEvent{

}

class UserCommentsCallEvent extends CallEvent{

}

class ApiCallSerialEvent extends CallEvent{

}