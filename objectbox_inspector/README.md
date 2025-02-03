# Objectbox Inspector for Objectbox

[![pub package](https://img.shields.io/pub/v/objectbox_inspector.svg)](https://pub.dev/packages/objectbox_inspector)

This package provides a visual interface for all the classes annotated with `@Entity` in [ObjectBox](https://pub.dev/packages/objectbox).

![Objectbox Inspector Demo](./assets/demo.png)

## Features

- [x] view boxes
- [x] auto navigate to related entities
- [x] view entities
- [x] Edit non-relation & non-final entity properties

## Limitations

There are some types that the editor `DOES NOT` support yet.

- `Int8List`
- `Uint8List`
- `Int16List`
- `Uint16List`
- `Int32List`
- `Uint32List`
- `Int64List`
- `Uint64List`
- `Float32List`
- `Float64List`

Also the `int` and `double` have the signed functionality, and this editor does not disable it for unsigned `PropertyType`'s. [described here](https://docs.objectbox.io/advanced/custom-types).


> Note: they are still viewable.

## Usage

To use the Objectbox Inspector, you need to add the `objectbox_inspector` and [objectbox_inspector_generator](https://pub.dev/packages/objectbox_inspector_generator) dependency to your project.

> Note: Obviosly `objectbox` itself is required.

```yaml
dependencies:
  objectbox_inspector: latest

dev_dependencies:
  objectbox_inspector_generator: latest
```

After running `flutter pub get`, you can run the `objectbox_inspector` command to generate the inspector.

```bash
flutter pub get
flutter pub run build_runner build
```

This will generate a `objectbox.inspector.g.dart` file in your project. That contains the necessary code to run the inspector.

## Example

```dart
final store = openStore(); // need the Store instance...

// ...
IconButton(
    onPressed: () => openObjectboxInspector(
        context,
        getInspectableBoxes(store),
    ),
    icon: const Icon(Icons.bug_report),
),
// ...
```

## Advanced relations preview

There might be a case where instead of the preview of the relation, you want to see the actual data.

Now for a `ToOne` relation you would get a default preview.

- `ToOne<User>(id: 1)`

To override this you can override the `@Entity`'s class `toString` method.

```dart
@Entity()
class User {
  @override
  String toString() => "User(id: $id)";
}
```

> Note: you cannot override the `ToMany` relation preview (for now).

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoffee.com/cosneanuc2)
