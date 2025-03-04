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

import 'authentication_user_identifier.dart';

import 'authentication_data.dart';
import 'authentication_identifier.dart';
import 'authentication_phone_identifier.dart';
import 'authentication_third_party_identifier.dart';
import 'authentication_types.dart';

class AuthenticationPassword extends AuthenticationData {
  String user;
  String password;

  /// You may want to cast this as [AuthenticationUserIdentifier] or other
  /// Identifier classes extending AuthenticationIdentifier.
  AuthenticationIdentifier identifier;

  AuthenticationPassword(
      {String session, this.password, this.user, this.identifier})
      : super(
          type: AuthenticationTypes.password,
          session: session,
        );

  AuthenticationPassword.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    user = json['user'];
    password = json['password'];
    identifier = AuthenticationIdentifier.fromJson(json['identifier']);
    switch (identifier.type) {
      case AuthenticationIdentifierTypes.userId:
        identifier = AuthenticationUserIdentifier.fromJson(json['identifier']);
        break;
      case AuthenticationIdentifierTypes.phone:
        identifier = AuthenticationPhoneIdentifier.fromJson(json['identifier']);
        break;
      case AuthenticationIdentifierTypes.thirdParty:
        identifier =
            AuthenticationThirdPartyIdentifier.fromJson(json['identifier']);
        break;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    if (user != null) data['user'] = user;
    data['password'] = password;
    switch (identifier.type) {
      case AuthenticationIdentifierTypes.userId:
        data['identifier'] =
            (identifier as AuthenticationUserIdentifier).toJson();
        break;
      case AuthenticationIdentifierTypes.phone:
        data['identifier'] =
            (identifier as AuthenticationPhoneIdentifier).toJson();
        break;
      case AuthenticationIdentifierTypes.thirdParty:
        data['identifier'] =
            (identifier as AuthenticationThirdPartyIdentifier).toJson();
        break;
      default:
        data['identifier'] = identifier.toJson();
        break;
    }
    return data;
  }
}
