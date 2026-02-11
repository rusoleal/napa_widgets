import 'package:vector_math/vector_math_64.dart';

enum NapaMatrix4Type {
  identity,
  translation,
  rotationX,
  rotationY,
  rotationZ,
  scale,
  skew,
}

class NapaMatrix4Compose {
  List<NapaMatrix4> elements;

  NapaMatrix4Compose({required this.elements});

  Matrix4 get matrix {
    if (elements.isEmpty) {
      return Matrix4.identity();
    }

    Matrix4 toReturn = elements[0].matrix;
    for (int a = 1; a < elements.length; a++) {
      toReturn = toReturn * elements[a].matrix;
    }
    return toReturn;
  }

  dynamic toJson() {
    return elements.map((e) => e.toJson()).toList();
  }

  static NapaMatrix4Compose? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    return NapaMatrix4Compose(
      elements: data.map<NapaMatrix4>((e) => NapaMatrix4.decode(e)!).toList(),
    );
  }
}

class NapaMatrix4 {
  NapaMatrix4Type type;
  Vector3 data;

  NapaMatrix4.identity() : type = .identity, data = Vector3.zero();

  NapaMatrix4.translation(double x, double y, double z)
    : type = .translation,
      data = Vector3(x, y, z);

  NapaMatrix4.rotationX(double radians)
    : type = .rotationX,
      data = Vector3(radians, 0.0, 0.0);

  NapaMatrix4.rotationY(double radians)
    : type = .rotationY,
      data = Vector3(radians, 0.0, 0.0);

  NapaMatrix4.rotationZ(double radians)
    : type = .rotationZ,
      data = Vector3(radians, 0.0, 0.0);

  NapaMatrix4.scale(double x, double y, double z)
    : type = .scale,
      data = Vector3(x, y, z);

  NapaMatrix4.skew(double alpha, double beta)
    : type = .skew,
      data = Vector3(alpha, beta, 0.0);

  Matrix4 get matrix {
    switch (type) {
      case .identity:
        return Matrix4.identity();
      case .rotationX:
        return Matrix4.rotationX(data.x);
      case .rotationY:
        return Matrix4.rotationY(data.x);
      case .rotationZ:
        return Matrix4.rotationZ(data.x);
      case .scale:
        return Matrix4.diagonal3(data);
      case .translation:
        return Matrix4.translation(data);
      case .skew:
        return Matrix4.skew(data.x, data.y);
    }
  }

  dynamic toJson() {
    switch (type) {
      case .identity:
        return <String, dynamic>{'type': type.name};
      case .rotationX:
      case .rotationY:
      case .rotationZ:
        return <String, dynamic>{'type': type.name, 'radians': data.x};
      case .scale:
      case .translation:
        return <String, dynamic>{
          'type': type.name,
          'x': data.x,
          'y': data.y,
          'z': data.z,
        };
      case .skew:
        return <String, dynamic>{
          'type': type.name,
          'alpha': data.x,
          'beta': data.y,
        };
    }
  }

  static NapaMatrix4? decode(dynamic data) {
    if (data == null) {
      return null;
    }

    switch (data['type']) {
      case 'rotationX':
        return NapaMatrix4.rotationX(data['radians']);
      case 'rotationY':
        return NapaMatrix4.rotationY(data['radians']);
      case 'rotationZ':
        return NapaMatrix4.rotationZ(data['radians']);
      case 'scale':
        return NapaMatrix4.scale(data['x'], data['y'], data['z']);
      case 'translation':
        return NapaMatrix4.translation(data['x'], data['y'], data['z']);
      case 'skew':
        return NapaMatrix4.skew(data['alpha'], data['beta']);
      case 'identity':
      default:
        return NapaMatrix4.identity();
    }
  }
}
