import 'package:dio/dio.dart';
import 'package:veacos/app/modules/settings/shared/model/settings_model.dart';
import 'package:veacos/app/modules/settings/shared/repository/interfaces/settings_repository_interfaces.dart';
import 'package:veacos/app/shared/utils/dio_struture.dart';

class SettingsRepository implements ISettingsRepository {
  @override
  Future<SettingsModel> show(String id) async {
    Response response;
    var dio = await DioStruture().dioAction();
    response = await dio.get('settings/$id');
    DioStruture().statusRequest(response);
    return SettingsModel.fromMap(response.data);
  }

  @override
  Future<List<SettingsModel>> index() async {
    Response response;
    var dio = await DioStruture().dioAction();
    response = await dio.get('settings');
    DioStruture().statusRequest(response);
    return (response.data as List).map((e) {
      return SettingsModel.fromMap(e);
    }).toList();
  }

  @override
  store(SettingsModel model) async {
    Response response;
    var dio = await DioStruture().dioAction();
    response = await dio.put('settings/${model.id}', data: model);
    DioStruture().statusRequest(response);
    return response;
  }

  @override
  delete(String id) async {
    Response response;
    var dio = await DioStruture().dioAction();
    response = await dio.delete('settings/$id');
    DioStruture().statusRequest(response);
    return response;
  }
}
