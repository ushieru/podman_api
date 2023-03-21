import 'package:podman_api/images/domain/delete_image_response.dart';
import 'package:podman_api/images/domain/images_repository.dart';

class ImagesDelete {
  ImagesDelete(this._repository);

  final ImagesRepository _repository;

  Future<DeleteImageResponse> run(String nameOrId) =>
      _repository.delete(nameOrId);
}
