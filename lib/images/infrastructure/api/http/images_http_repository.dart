import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:podman_api/images/domain/image.dart';
import 'package:podman_api/images/domain/images_repository.dart';
import 'package:podman_api/shared/domain/podman_error.dart';

class ImagesHttpRepository extends ImagesRepository {
  ImagesHttpRepository(super.serviceUrl);

  @override
  Future<List<Image>> list() async {
    final url = Uri.http(serviceUrl, '/v4.0.0/libpod/images/json');
    final response = await http.get(url);
    final bodyJson = jsonDecode(response.body) as List<dynamic>;
    final images =
        bodyJson.map((imageJson) => Image.fromJson(imageJson)).toList();
    return images;
  }

  @override
  Future<void> pull(String registry, String image, String name) async {
    final url = Uri.http(serviceUrl,
        '/v4.0.0/libpod/images/pull?reference=$registry/$image/$name');
    final response = await http.post(url);
    if (response.statusCode > 200 && response.statusCode < 300) return;
    final bodyJson = jsonDecode(response.body);
    throw PodmanError.fromJson(bodyJson);
  }

  @override
  Future<void> delete(String nameOrId) async {
    final url = Uri.http(serviceUrl, '/v4.0.0/libpod/images/$nameOrId');
    final response = await http.delete(url);
    if (response.statusCode > 200 && response.statusCode < 300) return;
    final bodyJson = jsonDecode(response.body);
    throw PodmanError.fromJson(bodyJson);
  }
}
