import '../Model/aprilModel.dart';
import '../Repository/aprilD.dart';

class AprilIndexProvider
{
  final _aprilIndexProvider = aprilDatabase.instance;

  Future<List<AprilModel>> getAllAprilDataProvider()
  {
    return _aprilIndexProvider.getAllAprilData();
  }

  Future<int> saveData(aprilModel)
  {
    return _aprilIndexProvider.add(aprilModel);
  }

  Future<AprilModel> getSpecificData(int a)
  {
    return _aprilIndexProvider.getSpecificAprilData(a);
  }

  Future<int> updateData(aprilModel)
  {
    return _aprilIndexProvider.update(aprilModel);
  }

  Future<int> deleteData(int a)
  {
    return _aprilIndexProvider.delete(a);
  }



}