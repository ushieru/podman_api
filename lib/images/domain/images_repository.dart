import 'package:podman_api/images/domain/delete_image_response.dart';
import 'package:podman_api/images/domain/image.dart';

abstract class ImagesRepository {
  ImagesRepository(this.serviceUrl);
  final String serviceUrl;
  Future<List<Image>> list();
  Future<String> pull(String registry, String image);
  Future<DeleteImageResponse> delete(String nameOrId);
}
