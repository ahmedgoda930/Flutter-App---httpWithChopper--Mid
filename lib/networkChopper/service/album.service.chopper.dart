// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$AlbumService extends AlbumService {
  _$AlbumService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AlbumService;

  @override
  Future<Response<dynamic>> getAllAlbums() {
    final $url = '/albums';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createAlbum(Map<String, dynamic> album) {
    final $url = '/albums';
    final $body = album;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> editAlbum(Map<String, dynamic> album) {
    final $url = '/albums';
    final $request = Request('PUT', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> deleteAlbum(int id) {
    final $url = '/albums/$id';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
