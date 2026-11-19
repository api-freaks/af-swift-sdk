import Foundation

/// Organization object containing the registrant's handle, name, address, contact details, and linked admin/tech/abuse contacts.
public struct IpWhoisLookupResponseIrtOrganization: Codable, Hashable, Sendable {
    /// Handle or unique identifier of this organization in WHOIS data.
    public let handle: String
    /// Name of the organization.
    public let name: String
    /// Type of the organization (e.g., BUSINESS, REGISTRY).
    public let type: Nullable<String>?
    /// Description values from the organization object.
    public let description: Nullable<[String]>?
    /// Full address lines of the organization.
    public let address: Nullable<[String]>?
    /// Parsed street address from the address field.
    public let street: Nullable<String>?
    /// Parsed city from the address field.
    public let city: Nullable<String>?
    /// Parsed district from the address field.
    public let district: Nullable<String>?
    /// Parsed state from the address field.
    public let state: Nullable<String>?
    /// Parsed ZIP code from the address field.
    public let zipCode: Nullable<String>?
    /// ISO 3166-1 alpha-2 country codes for the organization.
    public let country: Nullable<[String]>?
    /// Latitude parsed from the geoloc field.
    public let latitude: Nullable<Float>?
    /// Longitude parsed from the geoloc field.
    public let longitude: Nullable<Float>?
    /// Email addresses for the organization.
    public let email: Nullable<[String]>?
    /// Abuse mailbox email addresses for the organization.
    public let abuseMailbox: Nullable<[String]>?
    /// Phone numbers for the organization.
    public let phone: Nullable<[String]>?
    /// Fax numbers for the organization.
    public let faxNo: Nullable<[String]>?
    /// Handles of admin persons or roles linked to this organization.
    public let adminContacts: Nullable<[String]>?
    /// Handles of technical persons or roles linked to this organization.
    public let techContacts: Nullable<[String]>?
    /// Handles of abuse persons or roles linked to this organization.
    public let abuseContacts: Nullable<[String]>?
    /// Remarks for this organization object.
    public let remarks: Nullable<[String]>?
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
    public let source: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        handle: String,
        name: String,
        type: Nullable<String>? = nil,
        description: Nullable<[String]>? = nil,
        address: Nullable<[String]>? = nil,
        street: Nullable<String>? = nil,
        city: Nullable<String>? = nil,
        district: Nullable<String>? = nil,
        state: Nullable<String>? = nil,
        zipCode: Nullable<String>? = nil,
        country: Nullable<[String]>? = nil,
        latitude: Nullable<Float>? = nil,
        longitude: Nullable<Float>? = nil,
        email: Nullable<[String]>? = nil,
        abuseMailbox: Nullable<[String]>? = nil,
        phone: Nullable<[String]>? = nil,
        faxNo: Nullable<[String]>? = nil,
        adminContacts: Nullable<[String]>? = nil,
        techContacts: Nullable<[String]>? = nil,
        abuseContacts: Nullable<[String]>? = nil,
        remarks: Nullable<[String]>? = nil,
        notify: Nullable<[String]>? = nil,
        refNfy: Nullable<[String]>? = nil,
        mntBy: Nullable<[String]>? = nil,
        mntRef: Nullable<[String]>? = nil,
        dateCreated: Nullable<CalendarDate>? = nil,
        dateUpdated: Nullable<CalendarDate>? = nil,
        source: String,
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
        self.adminContacts = adminContacts
        self.techContacts = techContacts
        self.abuseContacts = abuseContacts
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
        self.handle = try container.decode(String.self, forKey: .handle)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decodeNullableIfPresent(String.self, forKey: .type)
        self.description = try container.decodeNullableIfPresent([String].self, forKey: .description)
        self.address = try container.decodeNullableIfPresent([String].self, forKey: .address)
        self.street = try container.decodeNullableIfPresent(String.self, forKey: .street)
        self.city = try container.decodeNullableIfPresent(String.self, forKey: .city)
        self.district = try container.decodeNullableIfPresent(String.self, forKey: .district)
        self.state = try container.decodeNullableIfPresent(String.self, forKey: .state)
        self.zipCode = try container.decodeNullableIfPresent(String.self, forKey: .zipCode)
        self.country = try container.decodeNullableIfPresent([String].self, forKey: .country)
        self.latitude = try container.decodeNullableIfPresent(Float.self, forKey: .latitude)
        self.longitude = try container.decodeNullableIfPresent(Float.self, forKey: .longitude)
        self.email = try container.decodeNullableIfPresent([String].self, forKey: .email)
        self.abuseMailbox = try container.decodeNullableIfPresent([String].self, forKey: .abuseMailbox)
        self.phone = try container.decodeNullableIfPresent([String].self, forKey: .phone)
        self.faxNo = try container.decodeNullableIfPresent([String].self, forKey: .faxNo)
        self.adminContacts = try container.decodeNullableIfPresent([String].self, forKey: .adminContacts)
        self.techContacts = try container.decodeNullableIfPresent([String].self, forKey: .techContacts)
        self.abuseContacts = try container.decodeNullableIfPresent([String].self, forKey: .abuseContacts)
        self.remarks = try container.decodeNullableIfPresent([String].self, forKey: .remarks)
        self.notify = try container.decodeNullableIfPresent([String].self, forKey: .notify)
        self.refNfy = try container.decodeNullableIfPresent([String].self, forKey: .refNfy)
        self.mntBy = try container.decodeNullableIfPresent([String].self, forKey: .mntBy)
        self.mntRef = try container.decodeNullableIfPresent([String].self, forKey: .mntRef)
        self.dateCreated = try container.decodeNullableIfPresent(CalendarDate.self, forKey: .dateCreated)
        self.dateUpdated = try container.decodeNullableIfPresent(CalendarDate.self, forKey: .dateUpdated)
        self.source = try container.decode(String.self, forKey: .source)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.handle, forKey: .handle)
        try container.encode(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.type, forKey: .type)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encodeNullableIfPresent(self.address, forKey: .address)
        try container.encodeNullableIfPresent(self.street, forKey: .street)
        try container.encodeNullableIfPresent(self.city, forKey: .city)
        try container.encodeNullableIfPresent(self.district, forKey: .district)
        try container.encodeNullableIfPresent(self.state, forKey: .state)
        try container.encodeNullableIfPresent(self.zipCode, forKey: .zipCode)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeNullableIfPresent(self.latitude, forKey: .latitude)
        try container.encodeNullableIfPresent(self.longitude, forKey: .longitude)
        try container.encodeNullableIfPresent(self.email, forKey: .email)
        try container.encodeNullableIfPresent(self.abuseMailbox, forKey: .abuseMailbox)
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encodeNullableIfPresent(self.faxNo, forKey: .faxNo)
        try container.encodeNullableIfPresent(self.adminContacts, forKey: .adminContacts)
        try container.encodeNullableIfPresent(self.techContacts, forKey: .techContacts)
        try container.encodeNullableIfPresent(self.abuseContacts, forKey: .abuseContacts)
        try container.encodeNullableIfPresent(self.remarks, forKey: .remarks)
        try container.encodeNullableIfPresent(self.notify, forKey: .notify)
        try container.encodeNullableIfPresent(self.refNfy, forKey: .refNfy)
        try container.encodeNullableIfPresent(self.mntBy, forKey: .mntBy)
        try container.encodeNullableIfPresent(self.mntRef, forKey: .mntRef)
        try container.encodeNullableIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeNullableIfPresent(self.dateUpdated, forKey: .dateUpdated)
        try container.encode(self.source, forKey: .source)
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
        case adminContacts = "admin_contacts"
        case techContacts = "tech_contacts"
        case abuseContacts = "abuse_contacts"
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