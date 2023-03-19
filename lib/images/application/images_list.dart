import 'package:podman_api/images/domain/image.dart';
import 'package:podman_api/images/domain/images_repository.dart';

class ImagesList {
  ImagesList(this._repository);

  final ImagesRepository _repository;

  Future<List<Image>> run() => _repository.list();
}
