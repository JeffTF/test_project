class ReserveModel {
  late final int? id;
  final String? reservationTime;
  final String? reservationDate;
  final int? reservationGuest;

  ReserveModel({
    required this.id ,
    required this.reservationTime,
    required this.reservationDate,
    required this.reservationGuest,
  });

  ReserveModel.fromMap(Map<dynamic , dynamic>  res)
      : id = res['id'],
        reservationTime = res["reservationTime"],
        reservationDate = res["reservationDate"],
        reservationGuest = res["reservationGuest"];

  Map<String, Object?> toMap(){
    return {
      'id' : id ,
      'reservationTime' : reservationTime,
      'reservationDate' :reservationDate,
      'reservationGuest' : reservationGuest,
    };
  }
}
