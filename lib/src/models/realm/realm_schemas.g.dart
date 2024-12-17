// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realm_schemas.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Project extends _Project with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  Project(
    ObjectId id, {
    String? name,
    String? projecttype,
    String? description,
    String? address,
    String? createdby,
    String? createdat,
    String? url,
    String? editedat,
    String? companyIdentifier,
    String? lasteditedby,
    bool iscomplete = false,
    bool isInvasive = false,
    double? latitude,
    double? longitude,
    ObjectId? formId,
    Iterable<Child> children = const [],
    Iterable<Section> sections = const [],
    Set<String> assignedto = const {},
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Project>({
        'iscomplete': false,
        'isInvasive': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'projecttype', projecttype);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'address', address);
    RealmObjectBase.set(this, 'createdby', createdby);
    RealmObjectBase.set(this, 'createdat', createdat);
    RealmObjectBase.set(this, 'url', url);
    RealmObjectBase.set(this, 'editedat', editedat);
    RealmObjectBase.set(this, 'companyIdentifier', companyIdentifier);
    RealmObjectBase.set(this, 'lasteditedby', lasteditedby);
    RealmObjectBase.set(this, 'iscomplete', iscomplete);
    RealmObjectBase.set(this, 'isInvasive', isInvasive);
    RealmObjectBase.set(this, 'latitude', latitude);
    RealmObjectBase.set(this, 'longitude', longitude);
    RealmObjectBase.set(this, 'formId', formId);
    RealmObjectBase.set<RealmList<Child>>(
        this, 'children', RealmList<Child>(children));
    RealmObjectBase.set<RealmList<Section>>(
        this, 'sections', RealmList<Section>(sections));
    RealmObjectBase.set<RealmSet<String>>(
        this, 'assignedto', RealmSet<String>(assignedto));
  }

  Project._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get projecttype =>
      RealmObjectBase.get<String>(this, 'projecttype') as String?;
  @override
  set projecttype(String? value) =>
      RealmObjectBase.set(this, 'projecttype', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get address =>
      RealmObjectBase.get<String>(this, 'address') as String?;
  @override
  set address(String? value) => RealmObjectBase.set(this, 'address', value);

  @override
  String? get createdby =>
      RealmObjectBase.get<String>(this, 'createdby') as String?;
  @override
  set createdby(String? value) => RealmObjectBase.set(this, 'createdby', value);

  @override
  String? get createdat =>
      RealmObjectBase.get<String>(this, 'createdat') as String?;
  @override
  set createdat(String? value) => RealmObjectBase.set(this, 'createdat', value);

  @override
  String? get url => RealmObjectBase.get<String>(this, 'url') as String?;
  @override
  set url(String? value) => RealmObjectBase.set(this, 'url', value);

  @override
  String? get editedat =>
      RealmObjectBase.get<String>(this, 'editedat') as String?;
  @override
  set editedat(String? value) => RealmObjectBase.set(this, 'editedat', value);

  @override
  String? get companyIdentifier =>
      RealmObjectBase.get<String>(this, 'companyIdentifier') as String?;
  @override
  set companyIdentifier(String? value) =>
      RealmObjectBase.set(this, 'companyIdentifier', value);

  @override
  String? get lasteditedby =>
      RealmObjectBase.get<String>(this, 'lasteditedby') as String?;
  @override
  set lasteditedby(String? value) =>
      RealmObjectBase.set(this, 'lasteditedby', value);

  @override
  RealmSet<String> get assignedto =>
      RealmObjectBase.get<String>(this, 'assignedto') as RealmSet<String>;
  @override
  set assignedto(covariant RealmSet<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<Child> get children =>
      RealmObjectBase.get<Child>(this, 'children') as RealmList<Child>;
  @override
  set children(covariant RealmList<Child> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get iscomplete => RealmObjectBase.get<bool>(this, 'iscomplete') as bool;
  @override
  set iscomplete(bool value) => RealmObjectBase.set(this, 'iscomplete', value);

  @override
  bool get isInvasive => RealmObjectBase.get<bool>(this, 'isInvasive') as bool;
  @override
  set isInvasive(bool value) => RealmObjectBase.set(this, 'isInvasive', value);

  @override
  RealmList<Section> get sections =>
      RealmObjectBase.get<Section>(this, 'sections') as RealmList<Section>;
  @override
  set sections(covariant RealmList<Section> value) =>
      throw RealmUnsupportedSetError();

  @override
  double? get latitude =>
      RealmObjectBase.get<double>(this, 'latitude') as double?;
  @override
  set latitude(double? value) => RealmObjectBase.set(this, 'latitude', value);

  @override
  double? get longitude =>
      RealmObjectBase.get<double>(this, 'longitude') as double?;
  @override
  set longitude(double? value) => RealmObjectBase.set(this, 'longitude', value);

  @override
  ObjectId? get formId =>
      RealmObjectBase.get<ObjectId>(this, 'formId') as ObjectId?;
  @override
  set formId(ObjectId? value) => RealmObjectBase.set(this, 'formId', value);

  @override
  Stream<RealmObjectChanges<Project>> get changes =>
      RealmObjectBase.getChanges<Project>(this);

  @override
  Project freeze() => RealmObjectBase.freezeObject<Project>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Project._);
    return const SchemaObject(ObjectType.realmObject, Project, 'Project', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('projecttype', RealmPropertyType.string, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('address', RealmPropertyType.string, optional: true),
      SchemaProperty('createdby', RealmPropertyType.string, optional: true),
      SchemaProperty('createdat', RealmPropertyType.string, optional: true),
      SchemaProperty('url', RealmPropertyType.string, optional: true),
      SchemaProperty('editedat', RealmPropertyType.string, optional: true),
      SchemaProperty('companyIdentifier', RealmPropertyType.string,
          optional: true),
      SchemaProperty('lasteditedby', RealmPropertyType.string, optional: true),
      SchemaProperty('assignedto', RealmPropertyType.string,
          collectionType: RealmCollectionType.set),
      SchemaProperty('children', RealmPropertyType.object,
          linkTarget: 'Child', collectionType: RealmCollectionType.list),
      SchemaProperty('iscomplete', RealmPropertyType.bool),
      SchemaProperty('isInvasive', RealmPropertyType.bool),
      SchemaProperty('sections', RealmPropertyType.object,
          linkTarget: 'Section', collectionType: RealmCollectionType.list),
      SchemaProperty('latitude', RealmPropertyType.double, optional: true),
      SchemaProperty('longitude', RealmPropertyType.double, optional: true),
      SchemaProperty('formId', RealmPropertyType.objectid, optional: true),
    ]);
  }
}

// ignore_for_file: type=lint
class Child extends _Child with RealmEntity, RealmObjectBase, EmbeddedObject {
  Child(
    ObjectId id,
    bool isInvasive, {
    String? name,
    String? type,
    String? description,
    String? url,
    String? sequenceNo,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'url', url);
    RealmObjectBase.set(this, 'isInvasive', isInvasive);
    RealmObjectBase.set(this, 'sequenceNo', sequenceNo);
  }

  Child._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get type => RealmObjectBase.get<String>(this, 'type') as String?;
  @override
  set type(String? value) => RealmObjectBase.set(this, 'type', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String? get url => RealmObjectBase.get<String>(this, 'url') as String?;
  @override
  set url(String? value) => RealmObjectBase.set(this, 'url', value);

  @override
  bool get isInvasive => RealmObjectBase.get<bool>(this, 'isInvasive') as bool;
  @override
  set isInvasive(bool value) => RealmObjectBase.set(this, 'isInvasive', value);

  @override
  String? get sequenceNo =>
      RealmObjectBase.get<String>(this, 'sequenceNo') as String?;
  @override
  set sequenceNo(String? value) =>
      RealmObjectBase.set(this, 'sequenceNo', value);

  @override
  Stream<RealmObjectChanges<Child>> get changes =>
      RealmObjectBase.getChanges<Child>(this);

  @override
  Child freeze() => RealmObjectBase.freezeObject<Child>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Child._);
    return const SchemaObject(ObjectType.embeddedObject, Child, 'Child', [
      SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id'),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('url', RealmPropertyType.string, optional: true),
      SchemaProperty('isInvasive', RealmPropertyType.bool),
      SchemaProperty('sequenceNo', RealmPropertyType.string, optional: true),
    ]);
  }
}

// ignore_for_file: type=lint
class SubProject extends _SubProject
    with RealmEntity, RealmObjectBase, RealmObject {
  SubProject(
    ObjectId id,
    ObjectId parentid,
    bool isInvasive, {
    String? name,
    String? type,
    String? description,
    String? parenttype,
    String? createdby,
    String? createdat,
    String? url,
    String? editedat,
    String? lasteditedby,
    Iterable<Child> children = const [],
    Set<String> assignedto = const {},
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'parentid', parentid);
    RealmObjectBase.set(this, 'parenttype', parenttype);
    RealmObjectBase.set(this, 'createdby', createdby);
    RealmObjectBase.set(this, 'createdat', createdat);
    RealmObjectBase.set(this, 'url', url);
    RealmObjectBase.set(this, 'editedat', editedat);
    RealmObjectBase.set(this, 'lasteditedby', lasteditedby);
    RealmObjectBase.set(this, 'isInvasive', isInvasive);
    RealmObjectBase.set<RealmList<Child>>(
        this, 'children', RealmList<Child>(children));
    RealmObjectBase.set<RealmSet<String>>(
        this, 'assignedto', RealmSet<String>(assignedto));
  }

  SubProject._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get type => RealmObjectBase.get<String>(this, 'type') as String?;
  @override
  set type(String? value) => RealmObjectBase.set(this, 'type', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  ObjectId get parentid =>
      RealmObjectBase.get<ObjectId>(this, 'parentid') as ObjectId;
  @override
  set parentid(ObjectId value) => RealmObjectBase.set(this, 'parentid', value);

  @override
  String? get parenttype =>
      RealmObjectBase.get<String>(this, 'parenttype') as String?;
  @override
  set parenttype(String? value) =>
      RealmObjectBase.set(this, 'parenttype', value);

  @override
  String? get createdby =>
      RealmObjectBase.get<String>(this, 'createdby') as String?;
  @override
  set createdby(String? value) => RealmObjectBase.set(this, 'createdby', value);

  @override
  String? get createdat =>
      RealmObjectBase.get<String>(this, 'createdat') as String?;
  @override
  set createdat(String? value) => RealmObjectBase.set(this, 'createdat', value);

  @override
  String? get url => RealmObjectBase.get<String>(this, 'url') as String?;
  @override
  set url(String? value) => RealmObjectBase.set(this, 'url', value);

  @override
  RealmSet<String> get assignedto =>
      RealmObjectBase.get<String>(this, 'assignedto') as RealmSet<String>;
  @override
  set assignedto(covariant RealmSet<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get editedat =>
      RealmObjectBase.get<String>(this, 'editedat') as String?;
  @override
  set editedat(String? value) => RealmObjectBase.set(this, 'editedat', value);

  @override
  String? get lasteditedby =>
      RealmObjectBase.get<String>(this, 'lasteditedby') as String?;
  @override
  set lasteditedby(String? value) =>
      RealmObjectBase.set(this, 'lasteditedby', value);

  @override
  bool get isInvasive => RealmObjectBase.get<bool>(this, 'isInvasive') as bool;
  @override
  set isInvasive(bool value) => RealmObjectBase.set(this, 'isInvasive', value);

  @override
  RealmList<Child> get children =>
      RealmObjectBase.get<Child>(this, 'children') as RealmList<Child>;
  @override
  set children(covariant RealmList<Child> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<SubProject>> get changes =>
      RealmObjectBase.getChanges<SubProject>(this);

  @override
  SubProject freeze() => RealmObjectBase.freezeObject<SubProject>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(SubProject._);
    return const SchemaObject(
        ObjectType.realmObject, SubProject, 'SubProject', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('parentid', RealmPropertyType.objectid),
      SchemaProperty('parenttype', RealmPropertyType.string, optional: true),
      SchemaProperty('createdby', RealmPropertyType.string, optional: true),
      SchemaProperty('createdat', RealmPropertyType.string, optional: true),
      SchemaProperty('url', RealmPropertyType.string, optional: true),
      SchemaProperty('assignedto', RealmPropertyType.string,
          collectionType: RealmCollectionType.set),
      SchemaProperty('editedat', RealmPropertyType.string, optional: true),
      SchemaProperty('lasteditedby', RealmPropertyType.string, optional: true),
      SchemaProperty('isInvasive', RealmPropertyType.bool),
      SchemaProperty('children', RealmPropertyType.object,
          linkTarget: 'Child', collectionType: RealmCollectionType.list),
    ]);
  }
}

// ignore_for_file: type=lint
class Location extends _Location
    with RealmEntity, RealmObjectBase, RealmObject {
  Location(
    ObjectId id,
    ObjectId parentid,
    bool isInvasive, {
    String? name,
    String? type,
    String? description,
    String? parenttype,
    String? createdby,
    String? createdat,
    String? url,
    String? editedat,
    String? lasteditedby,
    Iterable<Section> sections = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'parentid', parentid);
    RealmObjectBase.set(this, 'parenttype', parenttype);
    RealmObjectBase.set(this, 'createdby', createdby);
    RealmObjectBase.set(this, 'createdat', createdat);
    RealmObjectBase.set(this, 'url', url);
    RealmObjectBase.set(this, 'editedat', editedat);
    RealmObjectBase.set(this, 'lasteditedby', lasteditedby);
    RealmObjectBase.set(this, 'isInvasive', isInvasive);
    RealmObjectBase.set<RealmList<Section>>(
        this, 'sections', RealmList<Section>(sections));
  }

  Location._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get type => RealmObjectBase.get<String>(this, 'type') as String?;
  @override
  set type(String? value) => RealmObjectBase.set(this, 'type', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  ObjectId get parentid =>
      RealmObjectBase.get<ObjectId>(this, 'parentid') as ObjectId;
  @override
  set parentid(ObjectId value) => RealmObjectBase.set(this, 'parentid', value);

  @override
  String? get parenttype =>
      RealmObjectBase.get<String>(this, 'parenttype') as String?;
  @override
  set parenttype(String? value) =>
      RealmObjectBase.set(this, 'parenttype', value);

  @override
  String? get createdby =>
      RealmObjectBase.get<String>(this, 'createdby') as String?;
  @override
  set createdby(String? value) => RealmObjectBase.set(this, 'createdby', value);

  @override
  String? get createdat =>
      RealmObjectBase.get<String>(this, 'createdat') as String?;
  @override
  set createdat(String? value) => RealmObjectBase.set(this, 'createdat', value);

  @override
  String? get url => RealmObjectBase.get<String>(this, 'url') as String?;
  @override
  set url(String? value) => RealmObjectBase.set(this, 'url', value);

  @override
  String? get editedat =>
      RealmObjectBase.get<String>(this, 'editedat') as String?;
  @override
  set editedat(String? value) => RealmObjectBase.set(this, 'editedat', value);

  @override
  String? get lasteditedby =>
      RealmObjectBase.get<String>(this, 'lasteditedby') as String?;
  @override
  set lasteditedby(String? value) =>
      RealmObjectBase.set(this, 'lasteditedby', value);

  @override
  bool get isInvasive => RealmObjectBase.get<bool>(this, 'isInvasive') as bool;
  @override
  set isInvasive(bool value) => RealmObjectBase.set(this, 'isInvasive', value);

  @override
  RealmList<Section> get sections =>
      RealmObjectBase.get<Section>(this, 'sections') as RealmList<Section>;
  @override
  set sections(covariant RealmList<Section> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Location>> get changes =>
      RealmObjectBase.getChanges<Location>(this);

  @override
  Location freeze() => RealmObjectBase.freezeObject<Location>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Location._);
    return const SchemaObject(ObjectType.realmObject, Location, 'Location', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('type', RealmPropertyType.string, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('parentid', RealmPropertyType.objectid),
      SchemaProperty('parenttype', RealmPropertyType.string, optional: true),
      SchemaProperty('createdby', RealmPropertyType.string, optional: true),
      SchemaProperty('createdat', RealmPropertyType.string, optional: true),
      SchemaProperty('url', RealmPropertyType.string, optional: true),
      SchemaProperty('editedat', RealmPropertyType.string, optional: true),
      SchemaProperty('lasteditedby', RealmPropertyType.string, optional: true),
      SchemaProperty('isInvasive', RealmPropertyType.bool),
      SchemaProperty('sections', RealmPropertyType.object,
          linkTarget: 'Section', collectionType: RealmCollectionType.list),
    ]);
  }
}

// ignore_for_file: type=lint
class Section extends _Section
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  Section(
    ObjectId id,
    bool isInvasive, {
    String? name,
    bool visualsignsofleak = false,
    bool furtherinvasivereviewrequired = false,
    String? conditionalassessment,
    String? visualreview,
    String? coverUrl,
    int count = 0,
    bool isuploading = false,
    String? sequenceNo,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Section>({
        'visualsignsofleak': false,
        'furtherinvasivereviewrequired': false,
        'count': 0,
        'isuploading': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'isInvasive', isInvasive);
    RealmObjectBase.set(this, 'visualsignsofleak', visualsignsofleak);
    RealmObjectBase.set(
        this, 'furtherinvasivereviewrequired', furtherinvasivereviewrequired);
    RealmObjectBase.set(this, 'conditionalassessment', conditionalassessment);
    RealmObjectBase.set(this, 'visualreview', visualreview);
    RealmObjectBase.set(this, 'coverUrl', coverUrl);
    RealmObjectBase.set(this, 'count', count);
    RealmObjectBase.set(this, 'isuploading', isuploading);
    RealmObjectBase.set(this, 'sequenceNo', sequenceNo);
  }

  Section._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  bool get isInvasive => RealmObjectBase.get<bool>(this, 'isInvasive') as bool;
  @override
  set isInvasive(bool value) => RealmObjectBase.set(this, 'isInvasive', value);

  @override
  bool get visualsignsofleak =>
      RealmObjectBase.get<bool>(this, 'visualsignsofleak') as bool;
  @override
  set visualsignsofleak(bool value) =>
      RealmObjectBase.set(this, 'visualsignsofleak', value);

  @override
  bool get furtherinvasivereviewrequired =>
      RealmObjectBase.get<bool>(this, 'furtherinvasivereviewrequired') as bool;
  @override
  set furtherinvasivereviewrequired(bool value) =>
      RealmObjectBase.set(this, 'furtherinvasivereviewrequired', value);

  @override
  String? get conditionalassessment =>
      RealmObjectBase.get<String>(this, 'conditionalassessment') as String?;
  @override
  set conditionalassessment(String? value) =>
      RealmObjectBase.set(this, 'conditionalassessment', value);

  @override
  String? get visualreview =>
      RealmObjectBase.get<String>(this, 'visualreview') as String?;
  @override
  set visualreview(String? value) =>
      RealmObjectBase.set(this, 'visualreview', value);

  @override
  String? get coverUrl =>
      RealmObjectBase.get<String>(this, 'coverUrl') as String?;
  @override
  set coverUrl(String? value) => RealmObjectBase.set(this, 'coverUrl', value);

  @override
  int get count => RealmObjectBase.get<int>(this, 'count') as int;
  @override
  set count(int value) => RealmObjectBase.set(this, 'count', value);

  @override
  bool get isuploading =>
      RealmObjectBase.get<bool>(this, 'isuploading') as bool;
  @override
  set isuploading(bool value) =>
      RealmObjectBase.set(this, 'isuploading', value);

  @override
  String? get sequenceNo =>
      RealmObjectBase.get<String>(this, 'sequenceNo') as String?;
  @override
  set sequenceNo(String? value) =>
      RealmObjectBase.set(this, 'sequenceNo', value);

  @override
  Stream<RealmObjectChanges<Section>> get changes =>
      RealmObjectBase.getChanges<Section>(this);

  @override
  Section freeze() => RealmObjectBase.freezeObject<Section>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Section._);
    return const SchemaObject(ObjectType.embeddedObject, Section, 'Section', [
      SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id'),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('isInvasive', RealmPropertyType.bool),
      SchemaProperty('visualsignsofleak', RealmPropertyType.bool),
      SchemaProperty('furtherinvasivereviewrequired', RealmPropertyType.bool),
      SchemaProperty('conditionalassessment', RealmPropertyType.string,
          optional: true),
      SchemaProperty('visualreview', RealmPropertyType.string, optional: true),
      SchemaProperty('coverUrl', RealmPropertyType.string, optional: true),
      SchemaProperty('count', RealmPropertyType.int),
      SchemaProperty('isuploading', RealmPropertyType.bool),
      SchemaProperty('sequenceNo', RealmPropertyType.string, optional: true),
    ]);
  }
}

// ignore_for_file: type=lint
class VisualSection extends _VisualSection
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  VisualSection(
    ObjectId id,
    String eee,
    String lbc,
    String awe,
    ObjectId parentid,
    bool unitUnavailable, {
    String? name,
    String? additionalconsiderations,
    String? visualreview,
    bool visualsignsofleak = false,
    bool furtherinvasivereviewrequired = true,
    String? conditionalassessment,
    String? createdby,
    String? createdat,
    String parenttype = '',
    String? editedat,
    String? lasteditedby,
    Iterable<String> images = const [],
    Iterable<String> exteriorelements = const [],
    Iterable<String> waterproofingelements = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<VisualSection>({
        'visualsignsofleak': false,
        'furtherinvasivereviewrequired': true,
        'parenttype': '',
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(
        this, 'additionalconsiderations', additionalconsiderations);
    RealmObjectBase.set(this, 'visualreview', visualreview);
    RealmObjectBase.set(this, 'visualsignsofleak', visualsignsofleak);
    RealmObjectBase.set(
        this, 'furtherinvasivereviewrequired', furtherinvasivereviewrequired);
    RealmObjectBase.set(this, 'conditionalassessment', conditionalassessment);
    RealmObjectBase.set(this, 'eee', eee);
    RealmObjectBase.set(this, 'lbc', lbc);
    RealmObjectBase.set(this, 'awe', awe);
    RealmObjectBase.set(this, 'parentid', parentid);
    RealmObjectBase.set(this, 'createdby', createdby);
    RealmObjectBase.set(this, 'createdat', createdat);
    RealmObjectBase.set(this, 'parenttype', parenttype);
    RealmObjectBase.set(this, 'unitUnavailable', unitUnavailable);
    RealmObjectBase.set(this, 'editedat', editedat);
    RealmObjectBase.set(this, 'lasteditedby', lasteditedby);
    RealmObjectBase.set<RealmList<String>>(
        this, 'images', RealmList<String>(images));
    RealmObjectBase.set<RealmList<String>>(
        this, 'exteriorelements', RealmList<String>(exteriorelements));
    RealmObjectBase.set<RealmList<String>>(this, 'waterproofingelements',
        RealmList<String>(waterproofingelements));
  }

  VisualSection._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  RealmList<String> get images =>
      RealmObjectBase.get<String>(this, 'images') as RealmList<String>;
  @override
  set images(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get exteriorelements =>
      RealmObjectBase.get<String>(this, 'exteriorelements')
          as RealmList<String>;
  @override
  set exteriorelements(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get waterproofingelements =>
      RealmObjectBase.get<String>(this, 'waterproofingelements')
          as RealmList<String>;
  @override
  set waterproofingelements(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get additionalconsiderations =>
      RealmObjectBase.get<String>(this, 'additionalconsiderations') as String?;
  @override
  set additionalconsiderations(String? value) =>
      RealmObjectBase.set(this, 'additionalconsiderations', value);

  @override
  String? get visualreview =>
      RealmObjectBase.get<String>(this, 'visualreview') as String?;
  @override
  set visualreview(String? value) =>
      RealmObjectBase.set(this, 'visualreview', value);

  @override
  bool get visualsignsofleak =>
      RealmObjectBase.get<bool>(this, 'visualsignsofleak') as bool;
  @override
  set visualsignsofleak(bool value) =>
      RealmObjectBase.set(this, 'visualsignsofleak', value);

  @override
  bool get furtherinvasivereviewrequired =>
      RealmObjectBase.get<bool>(this, 'furtherinvasivereviewrequired') as bool;
  @override
  set furtherinvasivereviewrequired(bool value) =>
      RealmObjectBase.set(this, 'furtherinvasivereviewrequired', value);

  @override
  String? get conditionalassessment =>
      RealmObjectBase.get<String>(this, 'conditionalassessment') as String?;
  @override
  set conditionalassessment(String? value) =>
      RealmObjectBase.set(this, 'conditionalassessment', value);

  @override
  String get eee => RealmObjectBase.get<String>(this, 'eee') as String;
  @override
  set eee(String value) => RealmObjectBase.set(this, 'eee', value);

  @override
  String get lbc => RealmObjectBase.get<String>(this, 'lbc') as String;
  @override
  set lbc(String value) => RealmObjectBase.set(this, 'lbc', value);

  @override
  String get awe => RealmObjectBase.get<String>(this, 'awe') as String;
  @override
  set awe(String value) => RealmObjectBase.set(this, 'awe', value);

  @override
  ObjectId get parentid =>
      RealmObjectBase.get<ObjectId>(this, 'parentid') as ObjectId;
  @override
  set parentid(ObjectId value) => RealmObjectBase.set(this, 'parentid', value);

  @override
  String? get createdby =>
      RealmObjectBase.get<String>(this, 'createdby') as String?;
  @override
  set createdby(String? value) => RealmObjectBase.set(this, 'createdby', value);

  @override
  String? get createdat =>
      RealmObjectBase.get<String>(this, 'createdat') as String?;
  @override
  set createdat(String? value) => RealmObjectBase.set(this, 'createdat', value);

  @override
  String get parenttype =>
      RealmObjectBase.get<String>(this, 'parenttype') as String;
  @override
  set parenttype(String value) =>
      RealmObjectBase.set(this, 'parenttype', value);

  @override
  bool get unitUnavailable =>
      RealmObjectBase.get<bool>(this, 'unitUnavailable') as bool;
  @override
  set unitUnavailable(bool value) =>
      RealmObjectBase.set(this, 'unitUnavailable', value);

  @override
  String? get editedat =>
      RealmObjectBase.get<String>(this, 'editedat') as String?;
  @override
  set editedat(String? value) => RealmObjectBase.set(this, 'editedat', value);

  @override
  String? get lasteditedby =>
      RealmObjectBase.get<String>(this, 'lasteditedby') as String?;
  @override
  set lasteditedby(String? value) =>
      RealmObjectBase.set(this, 'lasteditedby', value);

  @override
  Stream<RealmObjectChanges<VisualSection>> get changes =>
      RealmObjectBase.getChanges<VisualSection>(this);

  @override
  VisualSection freeze() => RealmObjectBase.freezeObject<VisualSection>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(VisualSection._);
    return const SchemaObject(
        ObjectType.realmObject, VisualSection, 'VisualSection', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('images', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('exteriorelements', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('waterproofingelements', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('additionalconsiderations', RealmPropertyType.string,
          optional: true),
      SchemaProperty('visualreview', RealmPropertyType.string, optional: true),
      SchemaProperty('visualsignsofleak', RealmPropertyType.bool),
      SchemaProperty('furtherinvasivereviewrequired', RealmPropertyType.bool),
      SchemaProperty('conditionalassessment', RealmPropertyType.string,
          optional: true),
      SchemaProperty('eee', RealmPropertyType.string),
      SchemaProperty('lbc', RealmPropertyType.string),
      SchemaProperty('awe', RealmPropertyType.string),
      SchemaProperty('parentid', RealmPropertyType.objectid),
      SchemaProperty('createdby', RealmPropertyType.string, optional: true),
      SchemaProperty('createdat', RealmPropertyType.string, optional: true),
      SchemaProperty('parenttype', RealmPropertyType.string),
      SchemaProperty('unitUnavailable', RealmPropertyType.bool),
      SchemaProperty('editedat', RealmPropertyType.string, optional: true),
      SchemaProperty('lasteditedby', RealmPropertyType.string, optional: true),
    ]);
  }
}

// ignore_for_file: type=lint
class InvasiveSection extends _InvasiveSection
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  InvasiveSection(
    ObjectId id,
    ObjectId parentid,
    String invasiveDescription, {
    bool postinvasiverepairsrequired = false,
    Iterable<String> invasiveimages = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<InvasiveSection>({
        'postinvasiverepairsrequired': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'parentid', parentid);
    RealmObjectBase.set(
        this, 'postinvasiverepairsrequired', postinvasiverepairsrequired);
    RealmObjectBase.set(this, 'invasiveDescription', invasiveDescription);
    RealmObjectBase.set<RealmList<String>>(
        this, 'invasiveimages', RealmList<String>(invasiveimages));
  }

  InvasiveSection._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  ObjectId get parentid =>
      RealmObjectBase.get<ObjectId>(this, 'parentid') as ObjectId;
  @override
  set parentid(ObjectId value) => RealmObjectBase.set(this, 'parentid', value);

  @override
  bool get postinvasiverepairsrequired =>
      RealmObjectBase.get<bool>(this, 'postinvasiverepairsrequired') as bool;
  @override
  set postinvasiverepairsrequired(bool value) =>
      RealmObjectBase.set(this, 'postinvasiverepairsrequired', value);

  @override
  String get invasiveDescription =>
      RealmObjectBase.get<String>(this, 'invasiveDescription') as String;
  @override
  set invasiveDescription(String value) =>
      RealmObjectBase.set(this, 'invasiveDescription', value);

  @override
  RealmList<String> get invasiveimages =>
      RealmObjectBase.get<String>(this, 'invasiveimages') as RealmList<String>;
  @override
  set invasiveimages(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<InvasiveSection>> get changes =>
      RealmObjectBase.getChanges<InvasiveSection>(this);

  @override
  InvasiveSection freeze() =>
      RealmObjectBase.freezeObject<InvasiveSection>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(InvasiveSection._);
    return const SchemaObject(
        ObjectType.realmObject, InvasiveSection, 'InvasiveSection', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('parentid', RealmPropertyType.objectid),
      SchemaProperty('postinvasiverepairsrequired', RealmPropertyType.bool),
      SchemaProperty('invasiveDescription', RealmPropertyType.string),
      SchemaProperty('invasiveimages', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}

// ignore_for_file: type=lint
class ConclusiveSection extends _ConclusiveSection
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  ConclusiveSection(
    ObjectId id,
    ObjectId parentid,
    String conclusiveconsiderations,
    String eeeconclusive,
    String lbcconclusive,
    String aweconclusive, {
    bool propowneragreed = false,
    bool invasiverepairsinspectedandcompleted = false,
    Iterable<String> conclusiveimages = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<ConclusiveSection>({
        'propowneragreed': false,
        'invasiverepairsinspectedandcompleted': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'parentid', parentid);
    RealmObjectBase.set(this, 'propowneragreed', propowneragreed);
    RealmObjectBase.set(this, 'invasiverepairsinspectedandcompleted',
        invasiverepairsinspectedandcompleted);
    RealmObjectBase.set(
        this, 'conclusiveconsiderations', conclusiveconsiderations);
    RealmObjectBase.set(this, 'eeeconclusive', eeeconclusive);
    RealmObjectBase.set(this, 'lbcconclusive', lbcconclusive);
    RealmObjectBase.set(this, 'aweconclusive', aweconclusive);
    RealmObjectBase.set<RealmList<String>>(
        this, 'conclusiveimages', RealmList<String>(conclusiveimages));
  }

  ConclusiveSection._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  ObjectId get parentid =>
      RealmObjectBase.get<ObjectId>(this, 'parentid') as ObjectId;
  @override
  set parentid(ObjectId value) => RealmObjectBase.set(this, 'parentid', value);

  @override
  bool get propowneragreed =>
      RealmObjectBase.get<bool>(this, 'propowneragreed') as bool;
  @override
  set propowneragreed(bool value) =>
      RealmObjectBase.set(this, 'propowneragreed', value);

  @override
  bool get invasiverepairsinspectedandcompleted =>
      RealmObjectBase.get<bool>(this, 'invasiverepairsinspectedandcompleted')
          as bool;
  @override
  set invasiverepairsinspectedandcompleted(bool value) =>
      RealmObjectBase.set(this, 'invasiverepairsinspectedandcompleted', value);

  @override
  String get conclusiveconsiderations =>
      RealmObjectBase.get<String>(this, 'conclusiveconsiderations') as String;
  @override
  set conclusiveconsiderations(String value) =>
      RealmObjectBase.set(this, 'conclusiveconsiderations', value);

  @override
  String get eeeconclusive =>
      RealmObjectBase.get<String>(this, 'eeeconclusive') as String;
  @override
  set eeeconclusive(String value) =>
      RealmObjectBase.set(this, 'eeeconclusive', value);

  @override
  String get lbcconclusive =>
      RealmObjectBase.get<String>(this, 'lbcconclusive') as String;
  @override
  set lbcconclusive(String value) =>
      RealmObjectBase.set(this, 'lbcconclusive', value);

  @override
  String get aweconclusive =>
      RealmObjectBase.get<String>(this, 'aweconclusive') as String;
  @override
  set aweconclusive(String value) =>
      RealmObjectBase.set(this, 'aweconclusive', value);

  @override
  RealmList<String> get conclusiveimages =>
      RealmObjectBase.get<String>(this, 'conclusiveimages')
          as RealmList<String>;
  @override
  set conclusiveimages(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<ConclusiveSection>> get changes =>
      RealmObjectBase.getChanges<ConclusiveSection>(this);

  @override
  ConclusiveSection freeze() =>
      RealmObjectBase.freezeObject<ConclusiveSection>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ConclusiveSection._);
    return const SchemaObject(
        ObjectType.realmObject, ConclusiveSection, 'ConclusiveSection', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('parentid', RealmPropertyType.objectid),
      SchemaProperty('propowneragreed', RealmPropertyType.bool),
      SchemaProperty(
          'invasiverepairsinspectedandcompleted', RealmPropertyType.bool),
      SchemaProperty('conclusiveconsiderations', RealmPropertyType.string),
      SchemaProperty('eeeconclusive', RealmPropertyType.string),
      SchemaProperty('lbcconclusive', RealmPropertyType.string),
      SchemaProperty('aweconclusive', RealmPropertyType.string),
      SchemaProperty('conclusiveimages', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
    ]);
  }
}

// ignore_for_file: type=lint
class DeckImage extends _DeckImage
    with RealmEntity, RealmObjectBase, RealmObject {
  DeckImage(
    ObjectId id,
    String imageLocalPath,
    String onlinePath,
    bool isUploaded,
    ObjectId parentId,
    String parentType,
    String entityName,
    String containerName,
    String uploadedBy,
  ) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'imageLocalPath', imageLocalPath);
    RealmObjectBase.set(this, 'onlinePath', onlinePath);
    RealmObjectBase.set(this, 'isUploaded', isUploaded);
    RealmObjectBase.set(this, 'parentId', parentId);
    RealmObjectBase.set(this, 'parentType', parentType);
    RealmObjectBase.set(this, 'entityName', entityName);
    RealmObjectBase.set(this, 'containerName', containerName);
    RealmObjectBase.set(this, 'uploadedBy', uploadedBy);
  }

  DeckImage._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get imageLocalPath =>
      RealmObjectBase.get<String>(this, 'imageLocalPath') as String;
  @override
  set imageLocalPath(String value) =>
      RealmObjectBase.set(this, 'imageLocalPath', value);

  @override
  String get onlinePath =>
      RealmObjectBase.get<String>(this, 'onlinePath') as String;
  @override
  set onlinePath(String value) =>
      RealmObjectBase.set(this, 'onlinePath', value);

  @override
  bool get isUploaded => RealmObjectBase.get<bool>(this, 'isUploaded') as bool;
  @override
  set isUploaded(bool value) => RealmObjectBase.set(this, 'isUploaded', value);

  @override
  ObjectId get parentId =>
      RealmObjectBase.get<ObjectId>(this, 'parentId') as ObjectId;
  @override
  set parentId(ObjectId value) => RealmObjectBase.set(this, 'parentId', value);

  @override
  String get parentType =>
      RealmObjectBase.get<String>(this, 'parentType') as String;
  @override
  set parentType(String value) =>
      RealmObjectBase.set(this, 'parentType', value);

  @override
  String get entityName =>
      RealmObjectBase.get<String>(this, 'entityName') as String;
  @override
  set entityName(String value) =>
      RealmObjectBase.set(this, 'entityName', value);

  @override
  String get containerName =>
      RealmObjectBase.get<String>(this, 'containerName') as String;
  @override
  set containerName(String value) =>
      RealmObjectBase.set(this, 'containerName', value);

  @override
  String get uploadedBy =>
      RealmObjectBase.get<String>(this, 'uploadedBy') as String;
  @override
  set uploadedBy(String value) =>
      RealmObjectBase.set(this, 'uploadedBy', value);

  @override
  Stream<RealmObjectChanges<DeckImage>> get changes =>
      RealmObjectBase.getChanges<DeckImage>(this);

  @override
  DeckImage freeze() => RealmObjectBase.freezeObject<DeckImage>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DeckImage._);
    return const SchemaObject(ObjectType.realmObject, DeckImage, 'DeckImage', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('imageLocalPath', RealmPropertyType.string),
      SchemaProperty('onlinePath', RealmPropertyType.string),
      SchemaProperty('isUploaded', RealmPropertyType.bool),
      SchemaProperty('parentId', RealmPropertyType.objectid),
      SchemaProperty('parentType', RealmPropertyType.string),
      SchemaProperty('entityName', RealmPropertyType.string),
      SchemaProperty('containerName', RealmPropertyType.string),
      SchemaProperty('uploadedBy', RealmPropertyType.string),
    ]);
  }
}

// ignore_for_file: type=lint
class Question extends _Question
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  static var _defaultsSet = false;

  Question(
    ObjectId id,
    String type,
    String name,
    String answer, {
    bool isMandatory = false,
    Iterable<String> multipleAnswers = const [],
    Iterable<String> allowedValues = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<Question>({
        'isMandatory': false,
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'answer', answer);
    RealmObjectBase.set(this, 'isMandatory', isMandatory);
    RealmObjectBase.set<RealmList<String>>(
        this, 'multipleAnswers', RealmList<String>(multipleAnswers));
    RealmObjectBase.set<RealmList<String>>(
        this, 'allowedValues', RealmList<String>(allowedValues));
  }

  Question._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get answer => RealmObjectBase.get<String>(this, 'answer') as String;
  @override
  set answer(String value) => RealmObjectBase.set(this, 'answer', value);

  @override
  RealmList<String> get multipleAnswers =>
      RealmObjectBase.get<String>(this, 'multipleAnswers') as RealmList<String>;
  @override
  set multipleAnswers(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<String> get allowedValues =>
      RealmObjectBase.get<String>(this, 'allowedValues') as RealmList<String>;
  @override
  set allowedValues(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get isMandatory =>
      RealmObjectBase.get<bool>(this, 'isMandatory') as bool;
  @override
  set isMandatory(bool value) =>
      RealmObjectBase.set(this, 'isMandatory', value);

  @override
  Stream<RealmObjectChanges<Question>> get changes =>
      RealmObjectBase.getChanges<Question>(this);

  @override
  Question freeze() => RealmObjectBase.freezeObject<Question>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Question._);
    return const SchemaObject(ObjectType.embeddedObject, Question, 'Question', [
      SchemaProperty('id', RealmPropertyType.objectid, mapTo: '_id'),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('answer', RealmPropertyType.string),
      SchemaProperty('multipleAnswers', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('allowedValues', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('isMandatory', RealmPropertyType.bool),
    ]);
  }
}

// ignore_for_file: type=lint
class DynamicVisualSection extends _DynamicVisualSection
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  DynamicVisualSection(
    ObjectId id,
    ObjectId parentid,
    bool unitUnavailable, {
    String? companyIdentifier,
    String? name,
    bool furtherinvasivereviewrequired = true,
    String? createdby,
    String? createdat,
    String parenttype = '',
    String? editedat,
    String? lasteditedby,
    String? additionalconsiderations,
    Iterable<String> images = const [],
    Iterable<Question> questions = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<DynamicVisualSection>({
        'furtherinvasivereviewrequired': true,
        'parenttype': '',
      });
    }
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'companyIdentifier', companyIdentifier);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(
        this, 'furtherinvasivereviewrequired', furtherinvasivereviewrequired);
    RealmObjectBase.set(this, 'parentid', parentid);
    RealmObjectBase.set(this, 'createdby', createdby);
    RealmObjectBase.set(this, 'createdat', createdat);
    RealmObjectBase.set(this, 'parenttype', parenttype);
    RealmObjectBase.set(this, 'unitUnavailable', unitUnavailable);
    RealmObjectBase.set(this, 'editedat', editedat);
    RealmObjectBase.set(this, 'lasteditedby', lasteditedby);
    RealmObjectBase.set(
        this, 'additionalconsiderations', additionalconsiderations);
    RealmObjectBase.set<RealmList<String>>(
        this, 'images', RealmList<String>(images));
    RealmObjectBase.set<RealmList<Question>>(
        this, 'questions', RealmList<Question>(questions));
  }

  DynamicVisualSection._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String? get companyIdentifier =>
      RealmObjectBase.get<String>(this, 'companyIdentifier') as String?;
  @override
  set companyIdentifier(String? value) =>
      RealmObjectBase.set(this, 'companyIdentifier', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  RealmList<String> get images =>
      RealmObjectBase.get<String>(this, 'images') as RealmList<String>;
  @override
  set images(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  RealmList<Question> get questions =>
      RealmObjectBase.get<Question>(this, 'questions') as RealmList<Question>;
  @override
  set questions(covariant RealmList<Question> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get furtherinvasivereviewrequired =>
      RealmObjectBase.get<bool>(this, 'furtherinvasivereviewrequired') as bool;
  @override
  set furtherinvasivereviewrequired(bool value) =>
      RealmObjectBase.set(this, 'furtherinvasivereviewrequired', value);

  @override
  ObjectId get parentid =>
      RealmObjectBase.get<ObjectId>(this, 'parentid') as ObjectId;
  @override
  set parentid(ObjectId value) => RealmObjectBase.set(this, 'parentid', value);

  @override
  String? get createdby =>
      RealmObjectBase.get<String>(this, 'createdby') as String?;
  @override
  set createdby(String? value) => RealmObjectBase.set(this, 'createdby', value);

  @override
  String? get createdat =>
      RealmObjectBase.get<String>(this, 'createdat') as String?;
  @override
  set createdat(String? value) => RealmObjectBase.set(this, 'createdat', value);

  @override
  String get parenttype =>
      RealmObjectBase.get<String>(this, 'parenttype') as String;
  @override
  set parenttype(String value) =>
      RealmObjectBase.set(this, 'parenttype', value);

  @override
  bool get unitUnavailable =>
      RealmObjectBase.get<bool>(this, 'unitUnavailable') as bool;
  @override
  set unitUnavailable(bool value) =>
      RealmObjectBase.set(this, 'unitUnavailable', value);

  @override
  String? get editedat =>
      RealmObjectBase.get<String>(this, 'editedat') as String?;
  @override
  set editedat(String? value) => RealmObjectBase.set(this, 'editedat', value);

  @override
  String? get lasteditedby =>
      RealmObjectBase.get<String>(this, 'lasteditedby') as String?;
  @override
  set lasteditedby(String? value) =>
      RealmObjectBase.set(this, 'lasteditedby', value);

  @override
  String? get additionalconsiderations =>
      RealmObjectBase.get<String>(this, 'additionalconsiderations') as String?;
  @override
  set additionalconsiderations(String? value) =>
      RealmObjectBase.set(this, 'additionalconsiderations', value);

  @override
  Stream<RealmObjectChanges<DynamicVisualSection>> get changes =>
      RealmObjectBase.getChanges<DynamicVisualSection>(this);

  @override
  DynamicVisualSection freeze() =>
      RealmObjectBase.freezeObject<DynamicVisualSection>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DynamicVisualSection._);
    return const SchemaObject(
        ObjectType.realmObject, DynamicVisualSection, 'DynamicVisualSection', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('companyIdentifier', RealmPropertyType.string,
          optional: true),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('images', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('questions', RealmPropertyType.object,
          linkTarget: 'Question', collectionType: RealmCollectionType.list),
      SchemaProperty('furtherinvasivereviewrequired', RealmPropertyType.bool),
      SchemaProperty('parentid', RealmPropertyType.objectid),
      SchemaProperty('createdby', RealmPropertyType.string, optional: true),
      SchemaProperty('createdat', RealmPropertyType.string, optional: true),
      SchemaProperty('parenttype', RealmPropertyType.string),
      SchemaProperty('unitUnavailable', RealmPropertyType.bool),
      SchemaProperty('editedat', RealmPropertyType.string, optional: true),
      SchemaProperty('lasteditedby', RealmPropertyType.string, optional: true),
      SchemaProperty('additionalconsiderations', RealmPropertyType.string,
          optional: true),
    ]);
  }
}

// ignore_for_file: type=lint
class LocationForm extends _LocationForm
    with RealmEntity, RealmObjectBase, RealmObject {
  LocationForm(
    ObjectId id,
    String name,
    String companyIdentifier, {
    Iterable<Question> questions = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'companyIdentifier', companyIdentifier);
    RealmObjectBase.set<RealmList<Question>>(
        this, 'questions', RealmList<Question>(questions));
  }

  LocationForm._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get companyIdentifier =>
      RealmObjectBase.get<String>(this, 'companyIdentifier') as String;
  @override
  set companyIdentifier(String value) =>
      RealmObjectBase.set(this, 'companyIdentifier', value);

  @override
  RealmList<Question> get questions =>
      RealmObjectBase.get<Question>(this, 'questions') as RealmList<Question>;
  @override
  set questions(covariant RealmList<Question> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<LocationForm>> get changes =>
      RealmObjectBase.getChanges<LocationForm>(this);

  @override
  LocationForm freeze() => RealmObjectBase.freezeObject<LocationForm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(LocationForm._);
    return const SchemaObject(
        ObjectType.realmObject, LocationForm, 'LocationForm', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('companyIdentifier', RealmPropertyType.string),
      SchemaProperty('questions', RealmPropertyType.object,
          linkTarget: 'Question', collectionType: RealmCollectionType.list),
    ]);
  }
}
