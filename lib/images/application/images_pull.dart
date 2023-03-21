import 'package:podman_api/images/domain/images_repository.dart';

class ImagesPull {
  ImagesPull(this._repository);

  final ImagesRepository _repository;

  Future<String> run(String registry, String image) =>
      _repository.pull(registry, image);
}
