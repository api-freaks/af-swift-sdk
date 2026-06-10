import Foundation

public struct AsnWhoisLookupResponseParsedWhoisResponseAutNumsItem: Codable, Hashable, Sendable {
    public let autNum: String
    public let asHandle: String
    public let asName: String
    public let techContacts: [String]
    public let abuseContacts: [String]
    public let dateCreated: CalendarDate
    public let dateUpdated: CalendarDate
    public let source: String
    public let description: String?
    public let country: String?
    public let status: [String]?
    public let memberOf: [String]?
    public let importVia: [String]?
    public let `import`: [String]?
    public let mpImport: [String]?
    public let exportVia: [String]?
    public let export: [String]?
    public let mpExport: [String]?
    public let `default`: [String]?
    public let mpDefault: [String]?
    public let organization: String?
    public let sponsoringOrganization: String?
    public let adminContacts: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        autNum: String,
        asHandle: String,
        asName: String,
        techContacts: [String],
        abuseContacts: [String],
        dateCreated: CalendarDate,
        dateUpdated: CalendarDate,
        source: String,
        description: String? = nil,
        country: String? = nil,
        status: [String]? = nil,
        memberOf: [String]? = nil,
        importVia: [String]? = nil,
        import: [String]? = nil,
        mpImport: [String]? = nil,
        exportVia: [String]? = nil,
        export: [String]? = nil,
        mpExport: [String]? = nil,
        default: [String]? = nil,
        mpDefault: [String]? = nil,
        organization: String? = nil,
        sponsoringOrganization: String? = nil,
        adminContacts: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.autNum = autNum
        self.asHandle = asHandle
        self.asName = asName
        self.techContacts = techContacts
        self.abuseContacts = abuseContacts
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
        self.source = source
        self.description = description
        self.country = country
        self.status = status
        self.memberOf = memberOf
        self.importVia = importVia
        self.import = `import`
        self.mpImport = mpImport
        self.exportVia = exportVia
        self.export = export
        self.mpExport = mpExport
        self.default = `default`
        self.mpDefault = mpDefault
        self.organization = organization
        self.sponsoringOrganization = sponsoringOrganization
        self.adminContacts = adminContacts
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.autNum = try container.decode(String.self, forKey: .autNum)
        self.asHandle = try container.decode(String.self, forKey: .asHandle)
        self.asName = try container.decode(String.self, forKey: .asName)
        self.techContacts = try container.decode([String].self, forKey: .techContacts)
        self.abuseContacts = try container.decode([String].self, forKey: .abuseContacts)
        self.dateCreated = try container.decode(CalendarDate.self, forKey: .dateCreated)
        self.dateUpdated = try container.decode(CalendarDate.self, forKey: .dateUpdated)
        self.source = try container.decode(String.self, forKey: .source)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.status = try container.decodeIfPresent([String].self, forKey: .status)
        self.memberOf = try container.decodeIfPresent([String].self, forKey: .memberOf)
        self.importVia = try container.decodeIfPresent([String].self, forKey: .importVia)
        self.import = try container.decodeIfPresent([String].self, forKey: .import)
        self.mpImport = try container.decodeIfPresent([String].self, forKey: .mpImport)
        self.exportVia = try container.decodeIfPresent([String].self, forKey: .exportVia)
        self.export = try container.decodeIfPresent([String].self, forKey: .export)
        self.mpExport = try container.decodeIfPresent([String].self, forKey: .mpExport)
        self.default = try container.decodeIfPresent([String].self, forKey: .default)
        self.mpDefault = try container.decodeIfPresent([String].self, forKey: .mpDefault)
        self.organization = try container.decodeIfPresent(String.self, forKey: .organization)
        self.sponsoringOrganization = try container.decodeIfPresent(String.self, forKey: .sponsoringOrganization)
        self.adminContacts = try container.decodeIfPresent([String].self, forKey: .adminContacts)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.autNum, forKey: .autNum)
        try container.encode(self.asHandle, forKey: .asHandle)
        try container.encode(self.asName, forKey: .asName)
        try container.encode(self.techContacts, forKey: .techContacts)
        try container.encode(self.abuseContacts, forKey: .abuseContacts)
        try container.encode(self.dateCreated, forKey: .dateCreated)
        try container.encode(self.dateUpdated, forKey: .dateUpdated)
        try container.encode(self.source, forKey: .source)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.memberOf, forKey: .memberOf)
        try container.encodeIfPresent(self.importVia, forKey: .importVia)
        try container.encodeIfPresent(self.import, forKey: .import)
        try container.encodeIfPresent(self.mpImport, forKey: .mpImport)
        try container.encodeIfPresent(self.exportVia, forKey: .exportVia)
        try container.encodeIfPresent(self.export, forKey: .export)
        try container.encodeIfPresent(self.mpExport, forKey: .mpExport)
        try container.encodeIfPresent(self.default, forKey: .default)
        try container.encodeIfPresent(self.mpDefault, forKey: .mpDefault)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.sponsoringOrganization, forKey: .sponsoringOrganization)
        try container.encodeIfPresent(self.adminContacts, forKey: .adminContacts)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case autNum = "aut_num"
        case asHandle = "as_handle"
        case asName = "as_name"
        case techContacts = "tech_contacts"
        case abuseContacts = "abuse_contacts"
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case source
        case description
        case country
        case status
        case memberOf = "member_of"
        case importVia = "import_via"
        case `import`
        case mpImport = "mp_import"
        case exportVia = "export_via"
        case export
        case mpExport = "mp_export"
        case `default`
        case mpDefault = "mp_default"
        case organization
        case sponsoringOrganization = "sponsoring_organization"
        case adminContacts = "admin_contacts"
    }
}