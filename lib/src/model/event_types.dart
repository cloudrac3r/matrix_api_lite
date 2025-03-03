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

abstract class EventTypes {
  // Room timeline and state event types
  static const String Message = 'm.room.message';
  static const String Sticker = 'm.sticker';
  static const String Reaction = 'm.reaction';
  static const String Redaction = 'm.room.redaction';
  static const String RoomAliases = 'm.room.aliases';
  static const String RoomCanonicalAlias = 'm.room.canonical_alias';
  static const String RoomCreate = 'm.room.create';
  static const String RoomJoinRules = 'm.room.join_rules';
  static const String RoomMember = 'm.room.member';
  static const String RoomPowerLevels = 'm.room.power_levels';
  static const String RoomName = 'm.room.name';
  static const String RoomPinnedEvents = 'm.room.pinned_events';
  static const String RoomTopic = 'm.room.topic';
  static const String RoomAvatar = 'm.room.avatar';
  static const String RoomTombstone = 'm.room.tombstone';
  static const String GuestAccess = 'm.room.guest_access';
  static const String HistoryVisibility = 'm.room.history_visibility';
  static const String Encryption = 'm.room.encryption';
  static const String Encrypted = 'm.room.encrypted';
  static const String CallInvite = 'm.call.invite';
  static const String CallAnswer = 'm.call.answer';
  static const String CallCandidates = 'm.call.candidates';
  static const String CallHangup = 'm.call.hangup';
  static const String Unknown = 'm.unknown';

  // To device event types
  static const String RoomKey = 'm.room_key';
  static const String ForwardedRoomKey = 'm.forwarded_room_key';
  static const String RoomKeyRequest = 'm.room_key_request';
  static const String KeyVerificationRequest = 'm.key.verification.request';
  static const String KeyVerificationStart = 'm.key.verification.start';
  static const String KeyVerificationDone = 'm.key.verification.done';
  static const String KeyVerificationCancel = 'm.key.verification.cancel';
  static const String KeyVerificationAccept = 'm.key.verification.accept';
  static const String SecretRequest = 'm.secret.request';
  static const String SecretSend = 'm.secret.send';
  static const String Dummy = 'm.dummy';

  // Account data event types
  static const String CrossSigningSelfSigning = 'm.cross_signing.self_signing';
  static const String CrossSigningUserSigning = 'm.cross_signing.user_signing';
  static const String CrossSigningMasterKey = 'm.cross_signing.master';
  static const String MegolmBackup = 'm.megolm_backup.v1';
  static const String SecretStorageDefaultKey = 'm.secret_storage.default_key';
  static String secretStorageKey(String keyId) => 'm.secret_storage.key.$keyId';

  // Spaces
  static const String spaceParent = 'm.space.parent';
  static const String spaceChild = 'm.space.child';
}
