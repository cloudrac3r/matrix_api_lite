# Matrix API Lite

This package is a dead simple data model over the client-server specification of https://matrix.org and is mostly used as a base for a more complete Matrix SDK.
It doesn't contain any logic and just provides methods for all API endpoints and json parser for all objects. It is intended to be as close to the specificaton
as possible so we get a 1:1 relationship with the API. More complex logic like a sync loop or a data model for rooms should be implemented in a more complete
Matrix SDK.

## Usage

A simple usage example:

```dart
import 'package:matrix_api_lite/src/matrix_api.dart';

void main() async {
  final api = MatrixApi(homeserver: Uri.parse('https://matrix.org'));
  final capabilities = await api.requestServerCapabilities();
  print(capabilities.toJson());
}

```