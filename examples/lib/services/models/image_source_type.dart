enum ImageSourceType { local, asset, web }

ImageSourceType parseToImageSourceType(String value) {
  switch (value) {
    case "ImageSourceType.local":
      return ImageSourceType.local;
    case "ImageSourceType.asset":
      return ImageSourceType.asset;
    case "ImageSourceType.web":
      return ImageSourceType.web;
    default:
      return ImageSourceType.asset;
  }
}
