abstract class JsonConvertible {
  dynamic fromJson(Map<String, dynamic> data);

}

extension DefaultNullPropertiesExtension<T extends JsonConvertible> on T {
  T withDefaultValues() {
    final Map<String, dynamic> data = {};


    data.forEach((key, value) {
      if (value == null) {
        data[key] = _getDefaultForType(T, key);
      } else {
        data[key] = value;
      }
    });

    return fromJson(data);
  }

  dynamic _getDefaultForType(Type type, String key) {
    if (type == String) {
      return '';
    } else if (type == int) {
      return 0;
    }else if (type == bool) {
      return false;
    } else {
      throw ArgumentError('Unsupported type: $type for property: $key');
    }
  }
}
