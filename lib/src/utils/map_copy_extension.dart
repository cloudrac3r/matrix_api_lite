/* MIT License
*
* Copyright (C) 2019, 2020, 2021 Famedly GmbH
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/

extension MapCopyExtension on Map<String, dynamic> {
  dynamic _copyValue(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value.copy();
    }
    if (value is List) {
      final ret = [];
      for (final val in value) {
        ret.add(_copyValue(val));
      }
      return ret;
    }
    return value;
  }

  /// Deep-copies a given json map
  Map<String, dynamic> copy() {
    final copy = Map<String, dynamic>.from(this);
    for (final entry in copy.entries) {
      copy[entry.key] = _copyValue(entry.value);
    }
    return copy;
  }
}
