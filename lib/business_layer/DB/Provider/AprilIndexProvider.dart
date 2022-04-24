import '../Model/aprilModel.dart';
import '../Repository/aprilD.dart';

class AprilIndexProvider
{
  final _aprilIndexProvider = aprilDatabase.instance;

  Future<List<AprilModel>> getAllAprilDataProvider()
  {
    return _aprilIndexProvider.getAllAprilData();
  }

  Future<int> savedata(aprilModel)
  {
    return _aprilIndexProvider.add(aprilModel);
  }
}