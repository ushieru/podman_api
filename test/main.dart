import 'package:podman_api/images/application/images_list.dart';
import 'package:podman_api/images/infrastructure/api/http/images_http_repository.dart';

void main() async {
  print(await ImagesList(ImagesHttpRepository('localhost:2376')).run());
}
