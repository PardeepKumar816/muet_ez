class UserActions {
  String name;
  String imgUrl;
  UserActions({required this.name, required this.imgUrl});

  static final List<UserActions> actions = [
    UserActions(name: 'Attendance', imgUrl: 'assets/images/attendance.png'),
    UserActions(name: 'Schedule', imgUrl: 'assets/images/schedule.png'),
    UserActions(name: 'Map', imgUrl: 'assets/images/map.png'),
    UserActions(name: 'Emergency', imgUrl: 'assets/images/emergency.png'),
    UserActions(name: 'Challan', imgUrl: 'assets/images/challan.png'),
    UserActions(name: 'Notification', imgUrl: 'assets/images/notification.png'),
    UserActions(name: 'Dinning', imgUrl: 'assets/images/dinning.png'),
    UserActions(name: 'Profile', imgUrl: 'assets/images/profile.png'),
    UserActions(name: 'Results', imgUrl: 'assets/images/results.png'),
    UserActions(name: 'Events', imgUrl: 'assets/images/events.png'),
    UserActions(name: 'Transport', imgUrl: 'assets/images/transport.png'),
    UserActions(name: 'Log out', imgUrl: 'assets/images/logout.png'),
    UserActions(name: 'Transport', imgUrl: 'assets/images/transport.png'),
    UserActions(name: 'Log out', imgUrl: 'assets/images/logout.png'),
  ];
}
