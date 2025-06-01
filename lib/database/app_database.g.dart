// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _avatarUrlMeta =
      const VerificationMeta('avatarUrl');
  @override
  late final GeneratedColumn<String> avatarUrl = GeneratedColumn<String>(
      'avatar_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isBannedMeta =
      const VerificationMeta('isBanned');
  @override
  late final GeneratedColumn<bool> isBanned = GeneratedColumn<bool>(
      'is_banned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_banned" IN (0, 1))'));
  static const VerificationMeta _hasPasswordMeta =
      const VerificationMeta('hasPassword');
  @override
  late final GeneratedColumn<bool> hasPassword = GeneratedColumn<bool>(
      'has_password', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_password" IN (0, 1))'));
  static const VerificationMeta _hasTwitchAccountMeta =
      const VerificationMeta('hasTwitchAccount');
  @override
  late final GeneratedColumn<bool> hasTwitchAccount = GeneratedColumn<bool>(
      'has_twitch_account', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("has_twitch_account" IN (0, 1))'));
  static const VerificationMeta _emailVerifiedAtMeta =
      const VerificationMeta('emailVerifiedAt');
  @override
  late final GeneratedColumn<DateTime> emailVerifiedAt =
      GeneratedColumn<DateTime>('email_verified_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      permissions = GeneratedColumn<String>('permissions', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($UsersTable.$converterpermissions);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        email,
        avatarUrl,
        isBanned,
        hasPassword,
        hasTwitchAccount,
        emailVerifiedAt,
        createdAt,
        permissions
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('avatar_url')) {
      context.handle(_avatarUrlMeta,
          avatarUrl.isAcceptableOrUnknown(data['avatar_url']!, _avatarUrlMeta));
    } else if (isInserting) {
      context.missing(_avatarUrlMeta);
    }
    if (data.containsKey('is_banned')) {
      context.handle(_isBannedMeta,
          isBanned.isAcceptableOrUnknown(data['is_banned']!, _isBannedMeta));
    } else if (isInserting) {
      context.missing(_isBannedMeta);
    }
    if (data.containsKey('has_password')) {
      context.handle(
          _hasPasswordMeta,
          hasPassword.isAcceptableOrUnknown(
              data['has_password']!, _hasPasswordMeta));
    } else if (isInserting) {
      context.missing(_hasPasswordMeta);
    }
    if (data.containsKey('has_twitch_account')) {
      context.handle(
          _hasTwitchAccountMeta,
          hasTwitchAccount.isAcceptableOrUnknown(
              data['has_twitch_account']!, _hasTwitchAccountMeta));
    } else if (isInserting) {
      context.missing(_hasTwitchAccountMeta);
    }
    if (data.containsKey('email_verified_at')) {
      context.handle(
          _emailVerifiedAtMeta,
          emailVerifiedAt.isAcceptableOrUnknown(
              data['email_verified_at']!, _emailVerifiedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      avatarUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar_url'])!,
      isBanned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_banned'])!,
      hasPassword: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_password'])!,
      hasTwitchAccount: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}has_twitch_account'])!,
      emailVerifiedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}email_verified_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      permissions: $UsersTable.$converterpermissions.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}permissions'])!),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterpermissions =
      const StringListConverter();
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String email;
  final String avatarUrl;
  final bool isBanned;
  final bool hasPassword;
  final bool hasTwitchAccount;
  final DateTime? emailVerifiedAt;
  final DateTime createdAt;
  final List<String> permissions;
  const User(
      {required this.id,
      required this.name,
      required this.email,
      required this.avatarUrl,
      required this.isBanned,
      required this.hasPassword,
      required this.hasTwitchAccount,
      this.emailVerifiedAt,
      required this.createdAt,
      required this.permissions});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['avatar_url'] = Variable<String>(avatarUrl);
    map['is_banned'] = Variable<bool>(isBanned);
    map['has_password'] = Variable<bool>(hasPassword);
    map['has_twitch_account'] = Variable<bool>(hasTwitchAccount);
    if (!nullToAbsent || emailVerifiedAt != null) {
      map['email_verified_at'] = Variable<DateTime>(emailVerifiedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    {
      map['permissions'] = Variable<String>(
          $UsersTable.$converterpermissions.toSql(permissions));
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      avatarUrl: Value(avatarUrl),
      isBanned: Value(isBanned),
      hasPassword: Value(hasPassword),
      hasTwitchAccount: Value(hasTwitchAccount),
      emailVerifiedAt: emailVerifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(emailVerifiedAt),
      createdAt: Value(createdAt),
      permissions: Value(permissions),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      avatarUrl: serializer.fromJson<String>(json['avatarUrl']),
      isBanned: serializer.fromJson<bool>(json['isBanned']),
      hasPassword: serializer.fromJson<bool>(json['hasPassword']),
      hasTwitchAccount: serializer.fromJson<bool>(json['hasTwitchAccount']),
      emailVerifiedAt: serializer.fromJson<DateTime?>(json['emailVerifiedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      permissions: serializer.fromJson<List<String>>(json['permissions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'avatarUrl': serializer.toJson<String>(avatarUrl),
      'isBanned': serializer.toJson<bool>(isBanned),
      'hasPassword': serializer.toJson<bool>(hasPassword),
      'hasTwitchAccount': serializer.toJson<bool>(hasTwitchAccount),
      'emailVerifiedAt': serializer.toJson<DateTime?>(emailVerifiedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'permissions': serializer.toJson<List<String>>(permissions),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          String? email,
          String? avatarUrl,
          bool? isBanned,
          bool? hasPassword,
          bool? hasTwitchAccount,
          Value<DateTime?> emailVerifiedAt = const Value.absent(),
          DateTime? createdAt,
          List<String>? permissions}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        isBanned: isBanned ?? this.isBanned,
        hasPassword: hasPassword ?? this.hasPassword,
        hasTwitchAccount: hasTwitchAccount ?? this.hasTwitchAccount,
        emailVerifiedAt: emailVerifiedAt.present
            ? emailVerifiedAt.value
            : this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        permissions: permissions ?? this.permissions,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      avatarUrl: data.avatarUrl.present ? data.avatarUrl.value : this.avatarUrl,
      isBanned: data.isBanned.present ? data.isBanned.value : this.isBanned,
      hasPassword:
          data.hasPassword.present ? data.hasPassword.value : this.hasPassword,
      hasTwitchAccount: data.hasTwitchAccount.present
          ? data.hasTwitchAccount.value
          : this.hasTwitchAccount,
      emailVerifiedAt: data.emailVerifiedAt.present
          ? data.emailVerifiedAt.value
          : this.emailVerifiedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      permissions:
          data.permissions.present ? data.permissions.value : this.permissions,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('isBanned: $isBanned, ')
          ..write('hasPassword: $hasPassword, ')
          ..write('hasTwitchAccount: $hasTwitchAccount, ')
          ..write('emailVerifiedAt: $emailVerifiedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('permissions: $permissions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, avatarUrl, isBanned,
      hasPassword, hasTwitchAccount, emailVerifiedAt, createdAt, permissions);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.avatarUrl == this.avatarUrl &&
          other.isBanned == this.isBanned &&
          other.hasPassword == this.hasPassword &&
          other.hasTwitchAccount == this.hasTwitchAccount &&
          other.emailVerifiedAt == this.emailVerifiedAt &&
          other.createdAt == this.createdAt &&
          other.permissions == this.permissions);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> avatarUrl;
  final Value<bool> isBanned;
  final Value<bool> hasPassword;
  final Value<bool> hasTwitchAccount;
  final Value<DateTime?> emailVerifiedAt;
  final Value<DateTime> createdAt;
  final Value<List<String>> permissions;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.avatarUrl = const Value.absent(),
    this.isBanned = const Value.absent(),
    this.hasPassword = const Value.absent(),
    this.hasTwitchAccount = const Value.absent(),
    this.emailVerifiedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.permissions = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String avatarUrl,
    required bool isBanned,
    required bool hasPassword,
    required bool hasTwitchAccount,
    this.emailVerifiedAt = const Value.absent(),
    required DateTime createdAt,
    required List<String> permissions,
  })  : name = Value(name),
        email = Value(email),
        avatarUrl = Value(avatarUrl),
        isBanned = Value(isBanned),
        hasPassword = Value(hasPassword),
        hasTwitchAccount = Value(hasTwitchAccount),
        createdAt = Value(createdAt),
        permissions = Value(permissions);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? avatarUrl,
    Expression<bool>? isBanned,
    Expression<bool>? hasPassword,
    Expression<bool>? hasTwitchAccount,
    Expression<DateTime>? emailVerifiedAt,
    Expression<DateTime>? createdAt,
    Expression<String>? permissions,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (isBanned != null) 'is_banned': isBanned,
      if (hasPassword != null) 'has_password': hasPassword,
      if (hasTwitchAccount != null) 'has_twitch_account': hasTwitchAccount,
      if (emailVerifiedAt != null) 'email_verified_at': emailVerifiedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (permissions != null) 'permissions': permissions,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? avatarUrl,
      Value<bool>? isBanned,
      Value<bool>? hasPassword,
      Value<bool>? hasTwitchAccount,
      Value<DateTime?>? emailVerifiedAt,
      Value<DateTime>? createdAt,
      Value<List<String>>? permissions}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isBanned: isBanned ?? this.isBanned,
      hasPassword: hasPassword ?? this.hasPassword,
      hasTwitchAccount: hasTwitchAccount ?? this.hasTwitchAccount,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      permissions: permissions ?? this.permissions,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (avatarUrl.present) {
      map['avatar_url'] = Variable<String>(avatarUrl.value);
    }
    if (isBanned.present) {
      map['is_banned'] = Variable<bool>(isBanned.value);
    }
    if (hasPassword.present) {
      map['has_password'] = Variable<bool>(hasPassword.value);
    }
    if (hasTwitchAccount.present) {
      map['has_twitch_account'] = Variable<bool>(hasTwitchAccount.value);
    }
    if (emailVerifiedAt.present) {
      map['email_verified_at'] = Variable<DateTime>(emailVerifiedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (permissions.present) {
      map['permissions'] = Variable<String>(
          $UsersTable.$converterpermissions.toSql(permissions.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('avatarUrl: $avatarUrl, ')
          ..write('isBanned: $isBanned, ')
          ..write('hasPassword: $hasPassword, ')
          ..write('hasTwitchAccount: $hasTwitchAccount, ')
          ..write('emailVerifiedAt: $emailVerifiedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('permissions: $permissions')
          ..write(')'))
        .toString();
  }
}

class $HardwareTableTable extends HardwareTable
    with TableInfo<$HardwareTableTable, HardwareTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HardwareTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, title, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hardware_table';
  @override
  VerificationContext validateIntegrity(Insertable<HardwareTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HardwareTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HardwareTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $HardwareTableTable createAlias(String alias) {
    return $HardwareTableTable(attachedDatabase, alias);
  }
}

class HardwareTableData extends DataClass
    implements Insertable<HardwareTableData> {
  final int id;
  final int userId;
  final String title;
  final String value;
  const HardwareTableData(
      {required this.id,
      required this.userId,
      required this.title,
      required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['title'] = Variable<String>(title);
    map['value'] = Variable<String>(value);
    return map;
  }

  HardwareTableCompanion toCompanion(bool nullToAbsent) {
    return HardwareTableCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      value: Value(value),
    );
  }

  factory HardwareTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HardwareTableData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'title': serializer.toJson<String>(title),
      'value': serializer.toJson<String>(value),
    };
  }

  HardwareTableData copyWith(
          {int? id, int? userId, String? title, String? value}) =>
      HardwareTableData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        value: value ?? this.value,
      );
  HardwareTableData copyWithCompanion(HardwareTableCompanion data) {
    return HardwareTableData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      title: data.title.present ? data.title.value : this.title,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HardwareTableData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, title, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HardwareTableData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.value == this.value);
}

class HardwareTableCompanion extends UpdateCompanion<HardwareTableData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> title;
  final Value<String> value;
  const HardwareTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.value = const Value.absent(),
  });
  HardwareTableCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String title,
    required String value,
  })  : userId = Value(userId),
        title = Value(title),
        value = Value(value);
  static Insertable<HardwareTableData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? title,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (title != null) 'title': title,
      if (value != null) 'value': value,
    });
  }

  HardwareTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? title,
      Value<String>? value}) {
    return HardwareTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HardwareTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $HardwareTableTable hardwareTable = $HardwareTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, hardwareTable];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String name,
  required String email,
  required String avatarUrl,
  required bool isBanned,
  required bool hasPassword,
  required bool hasTwitchAccount,
  Value<DateTime?> emailVerifiedAt,
  required DateTime createdAt,
  required List<String> permissions,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> email,
  Value<String> avatarUrl,
  Value<bool> isBanned,
  Value<bool> hasPassword,
  Value<bool> hasTwitchAccount,
  Value<DateTime?> emailVerifiedAt,
  Value<DateTime> createdAt,
  Value<List<String>> permissions,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatarUrl => $composableBuilder(
      column: $table.avatarUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBanned => $composableBuilder(
      column: $table.isBanned, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasPassword => $composableBuilder(
      column: $table.hasPassword, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasTwitchAccount => $composableBuilder(
      column: $table.hasTwitchAccount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get emailVerifiedAt => $composableBuilder(
      column: $table.emailVerifiedAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get permissions => $composableBuilder(
          column: $table.permissions,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatarUrl => $composableBuilder(
      column: $table.avatarUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBanned => $composableBuilder(
      column: $table.isBanned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasPassword => $composableBuilder(
      column: $table.hasPassword, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasTwitchAccount => $composableBuilder(
      column: $table.hasTwitchAccount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get emailVerifiedAt => $composableBuilder(
      column: $table.emailVerifiedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get permissions => $composableBuilder(
      column: $table.permissions, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get avatarUrl =>
      $composableBuilder(column: $table.avatarUrl, builder: (column) => column);

  GeneratedColumn<bool> get isBanned =>
      $composableBuilder(column: $table.isBanned, builder: (column) => column);

  GeneratedColumn<bool> get hasPassword => $composableBuilder(
      column: $table.hasPassword, builder: (column) => column);

  GeneratedColumn<bool> get hasTwitchAccount => $composableBuilder(
      column: $table.hasTwitchAccount, builder: (column) => column);

  GeneratedColumn<DateTime> get emailVerifiedAt => $composableBuilder(
      column: $table.emailVerifiedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get permissions =>
      $composableBuilder(
          column: $table.permissions, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> avatarUrl = const Value.absent(),
            Value<bool> isBanned = const Value.absent(),
            Value<bool> hasPassword = const Value.absent(),
            Value<bool> hasTwitchAccount = const Value.absent(),
            Value<DateTime?> emailVerifiedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<List<String>> permissions = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            email: email,
            avatarUrl: avatarUrl,
            isBanned: isBanned,
            hasPassword: hasPassword,
            hasTwitchAccount: hasTwitchAccount,
            emailVerifiedAt: emailVerifiedAt,
            createdAt: createdAt,
            permissions: permissions,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String email,
            required String avatarUrl,
            required bool isBanned,
            required bool hasPassword,
            required bool hasTwitchAccount,
            Value<DateTime?> emailVerifiedAt = const Value.absent(),
            required DateTime createdAt,
            required List<String> permissions,
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            email: email,
            avatarUrl: avatarUrl,
            isBanned: isBanned,
            hasPassword: hasPassword,
            hasTwitchAccount: hasTwitchAccount,
            emailVerifiedAt: emailVerifiedAt,
            createdAt: createdAt,
            permissions: permissions,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$HardwareTableTableCreateCompanionBuilder = HardwareTableCompanion
    Function({
  Value<int> id,
  required int userId,
  required String title,
  required String value,
});
typedef $$HardwareTableTableUpdateCompanionBuilder = HardwareTableCompanion
    Function({
  Value<int> id,
  Value<int> userId,
  Value<String> title,
  Value<String> value,
});

class $$HardwareTableTableFilterComposer
    extends Composer<_$AppDatabase, $HardwareTableTable> {
  $$HardwareTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$HardwareTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HardwareTableTable> {
  $$HardwareTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$HardwareTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HardwareTableTable> {
  $$HardwareTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$HardwareTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HardwareTableTable,
    HardwareTableData,
    $$HardwareTableTableFilterComposer,
    $$HardwareTableTableOrderingComposer,
    $$HardwareTableTableAnnotationComposer,
    $$HardwareTableTableCreateCompanionBuilder,
    $$HardwareTableTableUpdateCompanionBuilder,
    (
      HardwareTableData,
      BaseReferences<_$AppDatabase, $HardwareTableTable, HardwareTableData>
    ),
    HardwareTableData,
    PrefetchHooks Function()> {
  $$HardwareTableTableTableManager(_$AppDatabase db, $HardwareTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HardwareTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HardwareTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HardwareTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> userId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> value = const Value.absent(),
          }) =>
              HardwareTableCompanion(
            id: id,
            userId: userId,
            title: title,
            value: value,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int userId,
            required String title,
            required String value,
          }) =>
              HardwareTableCompanion.insert(
            id: id,
            userId: userId,
            title: title,
            value: value,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HardwareTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HardwareTableTable,
    HardwareTableData,
    $$HardwareTableTableFilterComposer,
    $$HardwareTableTableOrderingComposer,
    $$HardwareTableTableAnnotationComposer,
    $$HardwareTableTableCreateCompanionBuilder,
    $$HardwareTableTableUpdateCompanionBuilder,
    (
      HardwareTableData,
      BaseReferences<_$AppDatabase, $HardwareTableTable, HardwareTableData>
    ),
    HardwareTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$HardwareTableTableTableManager get hardwareTable =>
      $$HardwareTableTableTableManager(_db, _db.hardwareTable);
}
