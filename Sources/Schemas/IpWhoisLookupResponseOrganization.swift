import Foundation

public struct IpWhoisLookupResponseOrganization: Codable, Hashable, Sendable {
    public let handle: String?
    public let name: String?
    public let type: String?
    public let description: [String]?
    public let address: [String]?
    public let street: String?
    public let city: String?
    public let district: String?
    public let state: String?
    public let zipCode: String?
    public let country: [String]?
    public let latitude: Double?
    public let longitude: Double?
    public let email: [String]?
    public let abuseMailbox: [String]?
    public let phone: [String]?
    public let faxNo: [String]?
    public let organizations: [String]?
    public let adminContacts: [String]?
    public let techContacts: [String]?
    public let abuseContacts: [String]?
    public let languages: [String]?
    public let remarks: [String]?
    /// Notify email addresses for this organization object.
    public let notify: Nullable<[String]>?
    /// Reference notification email addresses for this organization object.
    public let refNfy: Nullable<[String]>?
    /// Maintainer handles for this organization object.
    public let mntBy: Nullable<[String]>?
    /// Referenced maintainer handles for this organization object.
    public let mntRef: Nullable<[String]>?
    /// Registration date of this organization object (YYYY-MM-DD).
    public let dateCreated: Nullable<CalendarDate>?
    /// Last update date of this organization object (YYYY-MM-DD).
    public let dateUpdated: Nullable<CalendarDate>?
    /// WHOIS data source (RIR registry URL) for this object.
    public let source: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        handle: String? = nil,
        name: String? = nil,
        type: String? = nil,
        description: [String]? = nil,
        address: [String]? = nil,
        street: String? = nil,
        city: String? = nil,
        district: String? = nil,
        state: String? = nil,
        zipCode: String? = nil,
        country: [String]? = nil,
        latitude: Double? = nil,
        longitude: Double? = nil,
        email: [String]? = nil,
        abuseMailbox: [String]? = nil,
        phone: [String]? = nil,
        faxNo: [String]? = nil,
        organizations: [String]? = nil,
        adminContacts: [String]? = nil,
        techContacts: [String]? = nil,
        abuseContacts: [String]? = nil,
        languages: [String]? = nil,
        remarks: [String]? = nil,
        notify: Nullable<[String]>? = nil,
        refNfy: Nullable<[String]>? = nil,
        mntBy: Nullable<[String]>? = nil,
        mntRef: Nullable<[String]>? = nil,
        dateCreated: Nullable<CalendarDate>? = nil,
        dateUpdated: Nullable<CalendarDate>? = nil,
        source: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.handle = handle
        self.name = name
        self.type = type
        self.description = description
        self.address = address
        self.street = street
        self.city = city
        self.district = district
        self.state = state
        self.zipCode = zipCode
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
        self.email = email
        self.abuseMailbox = abuseMailbox
        self.phone = phone
        self.faxNo = faxNo
        self.organizations = organizations
        self.adminContacts = adminContacts
        self.techContacts = techContacts
        self.abuseContacts = abuseContacts
        self.languages = languages
        self.remarks = remarks
        self.notify = notify
        self.refNfy = refNfy
        self.mntBy = mntBy
        self.mntRef = mntRef
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
        self.source = source
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.handle = try container.decodeIfPresent(String.self, forKey: .handle)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.description = try container.decodeIfPresent([String].self, forKey: .description)
        self.address = try container.decodeIfPresent([String].self, forKey: .address)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode)
        self.country = try container.decodeIfPresent([String].self, forKey: .country)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.email = try container.decodeIfPresent([String].self, forKey: .email)
        self.abuseMailbox = try container.decodeIfPresent([String].self, forKey: .abuseMailbox)
        self.phone = try container.decodeIfPresent([String].self, forKey: .phone)
        self.faxNo = try container.decodeIfPresent([String].self, forKey: .faxNo)
        self.organizations = try container.decodeIfPresent([String].self, forKey: .organizations)
        self.adminContacts = try container.decodeIfPresent([String].self, forKey: .adminContacts)
        self.techContacts = try container.decodeIfPresent([String].self, forKey: .techContacts)
        self.abuseContacts = try container.decodeIfPresent([String].self, forKey: .abuseContacts)
        self.languages = try container.decodeIfPresent([String].self, forKey: .languages)
        self.remarks = try container.decodeIfPresent([String].self, forKey: .remarks)
        self.notify = try container.decodeNullableIfPresent([String].self, forKey: .notify)
        self.refNfy = try container.decodeNullableIfPresent([String].self, forKey: .refNfy)
        self.mntBy = try container.decodeNullableIfPresent([String].self, forKey: .mntBy)
        self.mntRef = try container.decodeNullableIfPresent([String].self, forKey: .mntRef)
        self.dateCreated = try container.decodeNullableIfPresent(CalendarDate.self, forKey: .dateCreated)
        self.dateUpdated = try container.decodeNullableIfPresent(CalendarDate.self, forKey: .dateUpdated)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.handle, forKey: .handle)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.street, forKey: .street)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.zipCode, forKey: .zipCode)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.abuseMailbox, forKey: .abuseMailbox)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.faxNo, forKey: .faxNo)
        try container.encodeIfPresent(self.organizations, forKey: .organizations)
        try container.encodeIfPresent(self.adminContacts, forKey: .adminContacts)
        try container.encodeIfPresent(self.techContacts, forKey: .techContacts)
        try container.encodeIfPresent(self.abuseContacts, forKey: .abuseContacts)
        try container.encodeIfPresent(self.languages, forKey: .languages)
        try container.encodeIfPresent(self.remarks, forKey: .remarks)
        try container.encodeNullableIfPresent(self.notify, forKey: .notify)
        try container.encodeNullableIfPresent(self.refNfy, forKey: .refNfy)
        try container.encodeNullableIfPresent(self.mntBy, forKey: .mntBy)
        try container.encodeNullableIfPresent(self.mntRef, forKey: .mntRef)
        try container.encodeNullableIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeNullableIfPresent(self.dateUpdated, forKey: .dateUpdated)
        try container.encodeIfPresent(self.source, forKey: .source)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case handle
        case name
        case type
        case description
        case address
        case street
        case city
        case district
        case state
        case zipCode = "zip_code"
        case country
        case latitude
        case longitude
        case email
        case abuseMailbox = "abuse_mailbox"
        case phone
        case faxNo = "fax_no"
        case organizations
        case adminContacts = "admin_contacts"
        case techContacts = "tech_contacts"
        case abuseContacts = "abuse_contacts"
        case languages
        case remarks
        case notify
        case refNfy = "ref_nfy"
        case mntBy = "mnt_by"
        case mntRef = "mnt_ref"
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case source
    }
}