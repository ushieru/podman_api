class Image {
  String id;
  String parentId;
  List<String> repoTags;
  List<String> repoDigests;
  int created;
  int size;
  int sharedSize;
  int virtualSize;
  dynamic labels;
  int containers;
  List<String> names;
  String digest;
  List<String> history;

  Image(
      this.id,
      this.parentId,
      this.repoTags,
      this.repoDigests,
      this.created,
      this.size,
      this.sharedSize,
      this.virtualSize,
      this.labels,
      this.containers,
      this.names,
      this.digest,
      this.history);

  factory Image.fromJson(Map<String, dynamic> json) {
    final id = json['Id'];
    final parentId = json['ParentId'];
    final repoTags = json['RepoTags'].cast<String>();
    final repoDigests = json['RepoDigests'].cast<String>();
    final created = json['Created'];
    final size = json['Size'];
    final sharedSize = json['SharedSize'];
    final virtualSize = json['VirtualSize'];
    final labels = json['Labels'];
    final containers = json['Containers'];
    final names = json['Names'].cast<String>();
    final digest = json['Digest'];
    final history = json['History'].cast<String>();
    return Image(id, parentId, repoTags, repoDigests, created, size, sharedSize,
        virtualSize, labels, containers, names, digest, history);
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'ParentId': parentId,
      'RepoTags': repoTags,
      'RepoDigests': repoDigests,
      'Created': created,
      'Size': size,
      'SharedSize': sharedSize,
      'VirtualSize': virtualSize,
      'Labels': labels,
      'Containers': containers,
      'Names': names,
      'Digest': digest,
      'History': history
    };
  }

  @override
  String toString() {
    return 'Image(${toJson()})';
  }
}
