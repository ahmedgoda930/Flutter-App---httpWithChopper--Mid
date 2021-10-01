import 'package:chopper/chopper.dart';
import 'package:network_operation/core/service/fiexedservice.dart';

part 'album.service.chopper.dart';

@ChopperApi(baseUrl: '/albums')
abstract class AlbumService extends ChopperService {
  @Get()
  Future<Response> getAllAlbums();
  @Post()
  Future<Response> createAlbum(@Body() Map<String, dynamic> album);
  @Put()
  Future<Response> editAlbum(Map<String, dynamic> album);
  @Delete(path: '/{id}')
  Future<Response> deleteAlbum(@Path() int id);

  static AlbumService create() {
    final client = ChopperClient(
      baseUrl: FixedService.baseUrl,
      converter: JsonConverter(),
      services: [_$AlbumService()],
    );
    return _$AlbumService(client);
  }
}
