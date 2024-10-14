bool isImageFile(String? fileName) {
  if (fileName == null) return false;
  final imageExtensions = ['jpg', 'jpeg', 'png'];
  final fileExtension = fileName.split('.').last.toLowerCase();
  return imageExtensions.contains(fileExtension);
}
