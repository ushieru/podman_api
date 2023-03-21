import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:podman_api/images/domain/delete_image_response.dart';
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
  Future<String> pull(String registry, String image) async {
    final url = Uri.http(serviceUrl, '/v4.0.0/libpod/images/pull',
        {'reference': '$registry/$image'});
    final response = await http.post(url);
    if (response.statusCode > 200 && response.statusCode < 300) {
      final bodyJson = jsonDecode(response.body);
      throw PodmanError.fromJson(bodyJson);
    }
    return response.body;
  }

  @override
  Future<DeleteImageResponse> delete(String nameOrId) async {
    final url = Uri.http(serviceUrl, '/v4.0.0/libpod/images/$nameOrId');
    final response = await http.delete(url);
    final bodyJson = jsonDecode(response.body);
    if (response.statusCode > 200 && response.statusCode < 300) {
      throw PodmanError.fromJson(bodyJson);
    }
    return DeleteImageResponse.fromJson(bodyJson);
  }
}
