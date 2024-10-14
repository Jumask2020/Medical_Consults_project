bool isPdfFile(String? fileName) {
  if (fileName == null) return false;
  final pdfExtensions = ['pdf'];
  final fileExtension = fileName.split('.').last.toLowerCase();
  return pdfExtensions.contains(fileExtension);
}
