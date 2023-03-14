[Version = "1.0.0"]
section PingCastleEnteprise;

DefaultOptions = [ 
    // The built-in credential handling for OpenApi.Document only works
    // with Basic (UsernamePassword) auth. All other types should be handled
    // explicitly using the ManualCredentials option.
    //
    // In the this sample, all of the calls we'll make will work anonymously.
    // We can force anonymous access by setting ManualCredentials to true, and then
    // not setting any additional request headers/parameters.
    //
    ManualCredentials = true,
    // The returned data will match the schema defined in the swagger file. 
    // This means that additional fields and object types that don't have explicit
    // properties defined will be ignored. To see all results, we set the IncludeMoreColumns
    // option to true. Any fields found in the response that aren't found in the schema will
    // be grouped under this column in a record value.
    //
    IncludeMoreColumns = true,
    // When IncludeExtensions is set to true, vendor extensions in the swagger ("x-*" fields)
    // will be included as meta values on the function.
    //
    IncludeExtensions = true
];


[DataSource.Kind="PingCastleEnteprise", Publish="PingCastleEnteprise.Publish"]
shared PingCastleEnteprise.Contents =  Value.ReplaceType(PingCastleEntepriseNavTable, PingCastleEntepriseType);
//shared PingCastleEnteprise.Contents =  Value.ReplaceType(Test, type function (url as Uri.Type) as any);

PingCastleEntepriseType = type function (
    url as (type text meta [
        Documentation.FieldCaption = "Url to PingCastle Enterprise",
        Documentation.FieldDescription = "This is the full url to access the PingCastle Enterprise application. It is the same parameter used for API call in the command line program",
        Documentation.SampleValues = {"https://pingcastleenterprise.company.com"}
    ]))
    as table meta [
        Documentation.Name = "PingCastle Enterprise data"
    ];

Test = (url as text)  => 
    let
        t = CallFunction(url, "GetReport", 26617)
        //t = GetEntity(url, "Report")
        //t=PingCastleEnteprise.CallAPIAllDomains(url, "Reports")
        in
            t;

ActionPlanType = type table [
    id = number, 
    domainID = number, 
    riskID = text, 
    creator = text, 
    creationDate = datetime, 
    updator = text, 
    updateDate = datetime, 
    expectedDate = datetime, 
    specificItem = text, 
    priority = text, 
    personInCharge = text, 
    comment = text, 
    flags = number, 
    isInUse = logical, 
    status = text
];

AADActionPlanType = type table [
    id = number, 
    aadid = number, 
    riskID = text, 
    creator = text, 
    creationDate = datetime, 
    updator = text, 
    updateDate = datetime, 
    expectedDate = datetime, 
    specificItem = text, 
    priority = text, 
    personInCharge = text, 
    comment = text, 
    flags = number, 
    isInUse = logical, 
    status = text
];

AzureADType = type table [
    id = number,
    ownerID = number, 
    name = text, 
    tenantID = text, 
    status = text, 
    lastReportID = number, 
    firstReportID = number, 
    numberOfReport = number, 
    comment = text, 
    creationDate = datetime, 
    discoveredDate = datetime, 
    flags = number
];

DomainType = type table [
    id = number,
    forestID = number, 
    isForestRoot = logical, 
    ownerID = number, 
    name = text, 
    sid = text, 
    status = text, 
    lastReportID = number, 
    firstReportID = number, 
    netBiosName = text, 
    numberOfReport = number, 
    comment = text, 
    creationDate = datetime, 
    discoveredDate = datetime, 
    flags = number
];

AnomalyExceptionType = type table [
    id = number,
    domainID = number,
    domain = text,
    riskID = text,
    creator = text,
    creationDate = datetime,
    updator = text,
    updateDate = datetime,
    specificItem = text,
    startDate = datetime,
    endDate = datetime,
    comment = text,
    flags = number,
    isInUse = logical,
    status = text
];

AADAnomalyExceptionType = type table [
    id = number,
    aadid = number,
    domain = text,
    riskID = text,
    creator = text,
    creationDate = datetime,
    updator = text,
    updateDate = datetime,
    specificItem = text,
    startDate = datetime,
    endDate = datetime,
    comment = text,
    flags = number,
    isInUse = logical,
    status = text
];

OwnerType = type table [
    id = number,
    parentOwnerID = number,
    name = text,
    flags = number,
    fullName = text
];


TrustExceptionType = type table [
    id = number,
    domainFromID = number,
    domainToID = number,
    creator = text,
    creationDate = datetime,
    updator = text,
    updateDate = datetime,
    startDate = datetime,
    endDate = datetime,
    comment = text,
    status = text
];

RulesMatchedType = type table [
    id = number,
    domainID = number,
    riskID = text,
    points = number,
    category = text,
    model = text,
    rationale = text,
    flags = number,
    actionPlanStatus = text
];

RuleType = type table [
    riskId = text,
    title = text,
    description = text,
    technicalExplanation = text,
    solution = text,
    documentation = text,
    category = text,
    model = text,
    reportLocation = text,
    maturityLevel = number
];

ReportType = type table [
    id = number,
    domainID = number,
    agentID = number,
    generation = datetime,
    importedDate = datetime,
    importedBy = text,
    numberOfDC = number,
    schemaVersion = number,
    domainFunctionalLevel = number,
    forestFunctionalLevel = number,
    agentVersion = text,
    reportDetailLevel = text,
    globalScore = number,
    staleObjectsScore = number,
    privilegiedGroupScore = number,
    trustScore = number,
    anomalyScore = number,
    numberOfSafeTrusts = number,
    numberOfUnsafeTrusts = number,
    numberOfMigrationTrusts = number,
    hasNotAllowedSIDHistory = logical,
    maturityLevel = number,
    ruleML1 = number,
    ruleML2 = number,
    ruleML3 = number,
    ruleML4 = number,
    ruleML5 = number
    ];

AADReportType = type table [
    id = number,
    aadid = number,
    agentID = number,
    generation = datetime,
    importedDate = datetime,
    importedBy = text,
    agentVersion = text,
    reportDetailLevel = text,
    globalScore = number,
    staleObjectsScore = number,
    privilegiedGroupScore = number,
    trustScore = number,
    anomalyScore = number,
    maturityLevel = number,
    ruleML1 = number,
    ruleML2 = number,
    ruleML3 = number,
    ruleML4 = number,
    ruleML5 = number
    ];

EventType= type table [
    id = number,
    domainID = number,
    date = datetime,
    eventType = text,
    riskId = text,
    referenceDomainID = number,
    referenceAADID = number,
    identity = text
];

AADEventType= type table [
    id = number,
    aadid = number,
    date = datetime,
    eventType = text,
    riskId = text,
    referenceDomainID = number,
    referenceAADID = number,
    identity = text
];

SchemaTable = #table({"Entity", "Type", "ApiEndpoint"}, {
    {"Domains", DomainType , "Domains"},
    {"ActionPlans", ActionPlanType, "ActionPlan" },
    {"AnomalyExceptions", AnomalyExceptionType, "AnomalyException" },
    {"Owners", OwnerType, "Owners" },
    {"TrustExceptions", TrustExceptionType, "TrustException" },
    {"Rules", RuleType, "Rules" },
    {"RulesMatched", RulesMatchedType, "Rules/RulesMatched" },
    {"Events" , EventType, "Events"},
    {"Reports" , ReportType, "Reports"},
    {"LastReports" , ReportType, "Reports/OnlyLastReports"},

    {"AADActionPlans", AADActionPlanType , "AADActionPlan"},
    {"AADAnomalyExceptions", AADAnomalyExceptionType , "AADAnomalyException"},
    {"AADEvents", AADEventType , "AADEvents"},
    {"AADReports", AADReportType , "AADReports"},
    {"LastAADReports", AADReportType , "AADReports/OnlyLastReports"},
    {"AzureADs", AzureADType , "AzureADs"},

    {"GetReport", 0 , "Reports/{id}"},
    {"GetAADReport", 0 , "AADReports/{id}"}
});

GetSchemaForEntity = (entity as text) as type => try SchemaTable{[Entity=entity]}[Type] otherwise error "Couldn't find entity: '" & entity &"'";
GetEndPointForEntity = (entity as text) as text => try SchemaTable{[Entity=entity]}[ApiEndpoint] otherwise error "Couldn't find entity: '" & entity &"'";


PingCastleEntepriseNavTable = (url as text) as table =>
    let
        // Use our schema table as the source of top level items in the navigation tree
        entities = Table.SelectColumns(SchemaTable, {"Entity"}),
        rename = Table.RenameColumns(entities, {{"Entity", "Name"}}),
        // Add Data as a calculated column
        withData = Table.AddColumn(rename, "Data", 
                        each if not Text.Contains(GetEndPointForEntity([Name]), "{id}") then GetEntity(url, [Name]) else (id as number) => CallFunction(url, [Name], id), 
                        type table),
        // Add ItemKind and ItemName as fixed text values
        withItemKind = Table.AddColumn(withData, "ItemKind", each if not Text.Contains(GetEndPointForEntity([Name]), "{id}") then "Table" else "Function", type text),
        withItemName = Table.AddColumn(withItemKind, "ItemName", each if not Text.Contains(GetEndPointForEntity([Name]), "{id}") then "Table" else "Function", type text),
        // Indicate that the node should not be expandable
        withIsLeaf = Table.AddColumn(withItemName, "IsLeaf", each true, type logical),
        // Generate the nav table
        navTable = Table.ToNavigationTable(withIsLeaf, {"Name"}, "Name", "Data", "ItemKind", "ItemName", "IsLeaf")
    in
        navTable;


GetEntity = (url as text, entity as text) as table => 
    let
        endpoint = GetEndPointForEntity(entity),
        result = PingCastleEnteprise.CallAPI(url, endpoint),
        schema = GetSchemaForEntity(entity),
        appliedSchema = Table.ChangeType(result, schema)
    in
        appliedSchema;

CallFunction = (url as text, entity as text, id as number) => //as table => 
    let
        endpoint = GetEndPointForEntity(entity),
        result = PingCastleEnteprise.CallAPI(url, Text.Replace(endpoint,"{id}",  Text.From(id )))
    in
        result;

PingCastleEnteprise.CallAPI = (url  as text, endpoint as text, optional headers) =>
    let
        Response = Web.Contents(url & "/api/" & endpoint, [
            Headers = if headers is null then PingCastleEnteprise.Login(url) else headers
            ]
        ),
        nav = Json.Document(Response)
    in
        nav;

PingCastleEnteprise.Login = (url  as text) =>
    let
        credential = Extension.CurrentCredential(),

        Response = Web.Contents(url & "/api/Agent/Login", [
            Content = Json.FromValue([apikey = credential[Key], location = "PowerBI"]),
            Headers=[#"Content-type" = "application/json",#"Accept" = "application/json"],
            IsRetry = true
              ]),
        bearer = Json.Document(Response),
        bearer2 = if (Text.StartsWith(bearer, "Bearer ")) then bearer else error "Authentication error",
        headers = [ Authorization = bearer2]
    in
        headers;

shared TestConnection = PingCastleEnteprise.Login;

// Data Source Kind description
PingCastleEnteprise = [
    TestConnection = (dataSourcePath) => {"TestConnection", dataSourcePath},
    Authentication = [
        Key = [
        ]
    ],
    Label = Extension.LoadString("DataSourceLabel")
];

// Data Source UI publishing description
PingCastleEnteprise.Publish = [
    Beta = true,
    Category = "Other",
    ButtonText = { "PingCastle Enterprise", "PingCastle Enterprise Connector" },
    LearnMoreUrl = "https://www.pingcastle.com/",
        SourceImage = PingCastleEnteprise.Icons,
    SourceTypeImage = PingCastleEnteprise.Icons
];


PingCastleEnteprise.Icons = [
    Icon16 = { Extension.Contents("PingCastlePowerBIConnector16.png"), Extension.Contents("PingCastlePowerBIConnector20.png"), Extension.Contents("PingCastlePowerBIConnector24.png"), Extension.Contents("PingCastlePowerBIConnector32.png") },
    Icon32 = { Extension.Contents("PingCastlePowerBIConnector32.png"), Extension.Contents("PingCastlePowerBIConnector40.png"), Extension.Contents("PingCastlePowerBIConnector48.png"), Extension.Contents("PingCastlePowerBIConnector64.png")}
];


//
// Common functions
//
Table.ToNavigationTable = (
    table as table,
    keyColumns as list,
    nameColumn as text,
    dataColumn as text,
    itemKindColumn as text,
    itemNameColumn as text,
    isLeafColumn as text
) as table =>
    let
        tableType = Value.Type(table),
        newTableType = Type.AddTableKey(tableType, keyColumns, true) meta 
        [
            NavigationTable.NameColumn = nameColumn, 
            NavigationTable.DataColumn = dataColumn,
            NavigationTable.ItemKindColumn = itemKindColumn, 
            Preview.DelayColumn = itemNameColumn, 
            NavigationTable.IsLeafColumn = isLeafColumn
        ],
        navigationTable = Value.ReplaceType(table, newTableType)
    in
        navigationTable;


// source: https://github.com/microsoft/DataConnectors/tree/master/samples/TripPin/7-AdvancedSchema

// table should be an actual Table.Type, or a List.Type of Records
Table.ChangeType = (table, tableType as type) as nullable table =>
    // we only operate on table types
    if (not Type.Is(tableType, type table)) then error "type argument should be a table type" else
    // if we have a null value, just return it
    if (table = null) then table else
    let
        columnsForType = Type.RecordFields(Type.TableRow(tableType)),
        columnsAsTable = Record.ToTable(columnsForType),
        schema = Table.ExpandRecordColumn(columnsAsTable, "Value", {"Type"}, {"Type"}),
        previousMeta = Value.Metadata(tableType),

        // make sure we have a table
        parameterType = Value.Type(table),
        _table =
            if (Type.Is(parameterType, type table)) then table
            else if (Type.Is(parameterType, type list)) then
                let
                    asTable = Table.FromList(table, Splitter.SplitByNothing(), {"Column1"}),
                    firstValueType = Value.Type(Table.FirstValue(asTable, null)),
                    result =
                        // if the member is a record (as expected), then expand it. 
                        if (Type.Is(firstValueType, type record)) then
                            Table.ExpandRecordColumn(asTable, "Column1", schema[Name])
                        else
                            error Error.Record("Error.Parameter", "table argument is a list, but not a list of records", [ ValueType = firstValueType ])
                in
                    if (List.IsEmpty(table)) then
                        #table({"a"}, {})
                    else result
            else
                error Error.Record("Error.Parameter", "table argument should be a table or list of records", [ValueType = parameterType]),

        reordered = Table.SelectColumns(_table, schema[Name], MissingField.UseNull),

        // process primitive values - this will call Table.TransformColumnTypes
        map = (t) => if Type.Is(t, type table) or Type.Is(t, type list) or Type.Is(t, type record) or t = type any then null else t,        
        mapped = Table.TransformColumns(schema, {"Type", map}),
        omitted = Table.SelectRows(mapped, each [Type] <> null),
        existingColumns = Table.ColumnNames(reordered),
        removeMissing = Table.SelectRows(omitted, each List.Contains(existingColumns, [Name])),
        primitiveTransforms = Table.ToRows(removeMissing),
        changedPrimitives = Table.TransformColumnTypes(reordered, primitiveTransforms),
        
        // Get the list of transforms we'll use for Record types
        recordColumns = Table.SelectRows(schema, each Type.Is([Type], type record)),
        recordTypeTransformations = Table.AddColumn(recordColumns, "RecordTransformations", each (r) => Record.ChangeType(r, [Type]), type function),
        recordChanges = Table.ToRows(Table.SelectColumns(recordTypeTransformations, {"Name", "RecordTransformations"})),

        // Get the list of transforms we'll use for List types
        listColumns = Table.SelectRows(schema, each Type.Is([Type], type list)),
        listTransforms = Table.AddColumn(listColumns, "ListTransformations", each (t) => List.ChangeType(t, [Type]), Function.Type),
        listChanges = Table.ToRows(Table.SelectColumns(listTransforms, {"Name", "ListTransformations"})),

        // Get the list of transforms we'll use for Table types
        tableColumns = Table.SelectRows(schema, each Type.Is([Type], type table)),
        tableTransforms = Table.AddColumn(tableColumns, "TableTransformations", each (t) => @Table.ChangeType(t, [Type]), Function.Type),
        tableChanges = Table.ToRows(Table.SelectColumns(tableTransforms, {"Name", "TableTransformations"})),

        // Perform all of our transformations
        allColumnTransforms = recordChanges & listChanges & tableChanges,
        changedRecordTypes = if (List.IsEmpty(allColumnTransforms)) then changedPrimitives else Table.TransformColumns(changedPrimitives, allColumnTransforms, null, MissingField.Ignore),

        // set final type
        withType = Value.ReplaceType(changedRecordTypes, tableType)
    in
        if (List.IsEmpty(Record.FieldNames(columnsForType))) then table else withType meta previousMeta;

// If given a generic record type (no predefined fields), the original record is returned
Record.ChangeType = (record as record, recordType as type) =>
    let
        // record field format is [ fieldName = [ Type = type, Optional = logical], ... ]
        fields = try Type.RecordFields(recordType) otherwise error "Record.ChangeType: failed to get record fields. Is this a record type?",
        fieldNames = Record.FieldNames(fields),
        fieldTable = Record.ToTable(fields),
        optionalFields = Table.SelectRows(fieldTable, each [Value][Optional])[Name],
        requiredFields = List.Difference(fieldNames, optionalFields),
        // make sure all required fields exist
        withRequired = Record.SelectFields(record, requiredFields, MissingField.UseNull),
        // append optional fields
        withOptional = withRequired & Record.SelectFields(record, optionalFields, MissingField.Ignore),
        // set types
        transforms = GetTransformsForType(recordType),
        withTypes = Record.TransformFields(withOptional, transforms, MissingField.Ignore),
        // order the same as the record type
        reorder = Record.ReorderFields(withTypes, fieldNames, MissingField.Ignore)
    in
        if (List.IsEmpty(fieldNames)) then record else reorder;

List.ChangeType = (list as list, listType as type) =>
    if (not Type.Is(listType, type list)) then error "type argument should be a list type" else
    let
        listItemType = Type.ListItem(listType),
        transform = GetTransformByType(listItemType),
        modifiedValues = List.Transform(list, transform),
        typed = Value.ReplaceType(modifiedValues, listType)
    in
        typed;

// Returns a table type for the provided schema table
Schema.ToTableType = (schema as table) as type =>
    let
        toList = List.Transform(schema[Type], (t) => [Type=t, Optional=false]),
        toRecord = Record.FromList(toList, schema[Name]),
        toType = Type.ForRecord(toRecord, false),
        previousMeta = Value.Metadata(schema)
    in
        type table (toType) meta previousMeta;

// Returns a list of transformations that can be passed to Table.TransformColumns, or Record.TransformFields
// Format: {"Column", (f) => ...) .... ex: {"A", Number.From}
GetTransformsForType = (_type as type) as list =>
    let
        fieldsOrColumns = if (Type.Is(_type, type record)) then Type.RecordFields(_type)
                        else if (Type.Is(_type, type table)) then Type.RecordFields(Type.TableRow(_type))
                        else error "GetTransformsForType: record or table type expected",
        toTable = Record.ToTable(fieldsOrColumns),
        transformColumn = Table.AddColumn(toTable, "Transform", each GetTransformByType([Value][Type]), Function.Type),
        transformMap = Table.ToRows(Table.SelectColumns(transformColumn, {"Name", "Transform"}))
    in
        transformMap;

GetTransformByType = (type_in as type) as function =>
    let 
        _type = Type.NonNullable(type_in) 
        in
    if (Type.Is(_type, type number)) then Number.From
    else if (Type.Is(_type, type text)) then Text.From
    else if (Type.Is(_type, type date)) then Date.From
    else if (Type.Is(_type, type datetime)) then DateTime.From
    else if (Type.Is(_type, type duration)) then Duration.From
    else if (Type.Is(_type, type datetimezone)) then DateTimeZone.From
    else if (Type.Is(_type, type logical)) then Logical.From
    else if (Type.Is(_type, type time)) then Time.From
    else if (Type.Is(_type, type record)) then (t) => if (t <> null) then @Record.ChangeType(t, _type) else t
    else if (Type.Is(_type, type table)) then (t) => if (t <> null) then @Table.ChangeType(t, _type) else t
    else if (Type.Is(_type, type list)) then (t) => if (t <> null) then @List.ChangeType(t, _type) else t
    else (t) => t;
