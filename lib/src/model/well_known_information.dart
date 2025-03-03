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

import '../utils/try_get_map_extension.dart';

class WellKnownInformation {
  MHomeserver mHomeserver;
  MHomeserver mIdentityServer;
  Map<String, dynamic> content;

  WellKnownInformation.fromJson(Map<String, dynamic> json) {
    content = json;
    final mHomeserverMap = json.tryGetMap<String, dynamic>('m.homeserver');
    if (mHomeserverMap != null) {
      mHomeserver = MHomeserver.fromJson(mHomeserverMap);
    }
    final mIdentityServerMap =
        json.tryGetMap<String, dynamic>('m.identity_server');
    if (mIdentityServerMap != null) {
      mIdentityServer = MHomeserver.fromJson(mIdentityServerMap);
    }
  }

  Map<String, dynamic> toJson() {
    final data = content;
    if (mHomeserver != null) {
      data['m.homeserver'] = mHomeserver.toJson();
    }
    if (mIdentityServer != null) {
      data['m.identity_server'] = mIdentityServer.toJson();
    }
    return data;
  }
}

class MHomeserver {
  String baseUrl;

  MHomeserver.fromJson(Map<String, dynamic> json) {
    baseUrl = json.tryGet<String>('base_url');
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (baseUrl != null) data['base_url'] = baseUrl;
    return data;
  }
}
