import 'package:pmsapp/net/entity/parking_data_entity.dart';

import '../Api.dart';
import '../DataResult.dart';
import '../HttpRequest.dart';
import '../ResultData.dart';

class ParkingModel {
  static getParkingData(Map object) async {
    ResultData response = await HttpRequest.post(Api.getParking, object);
    if (response != null && response.result) {
      ParkingDataEntity parkingDataEntity =
          ParkingDataEntity.fromJson(response.data);
      return new DataResult(parkingDataEntity, true);
    } else {
      return new DataResult(null, false);
    }
  }

  // 接收泊车申请
  static appAcceptParking(int id) async {
    ResultData response =
        await HttpRequest.post(Api.appAcceptParking, {"idparking": id.toString()});
    print(response);
    if (response != null && response.result) {
      ParkingDataEntity parkingDataEntity =
          ParkingDataEntity.fromJson(response.data);
      return new DataResult(parkingDataEntity, true);
    } else {
      return new DataResult(null, false);
    }
  }
}