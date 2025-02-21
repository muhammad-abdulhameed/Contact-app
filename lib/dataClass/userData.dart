class UserData {
  String userName;
  String userEmail;
  String userPhone;
  String userPhoto;
  Function onTapDelete;

  UserData(
      {required this.userName,
      required this.userEmail,
      required this.userPhone,
      required this.userPhoto,
      required this.onTapDelete});
}
