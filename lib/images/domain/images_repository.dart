import 'package:podman_api/images/domain/image.dart';

abstract class ImagesRepository {
  ImagesRepository(this.serviceUrl);
  final String serviceUrl;
  Future<List<Image>> list();
  Future<void> pull(String registry, String image, String name);
  Future<void> delete(String nameOrId);
}
