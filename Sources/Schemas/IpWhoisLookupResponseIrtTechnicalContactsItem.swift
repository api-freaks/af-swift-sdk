import Foundation

/// Contact person or role object with handle, name, email, phone, and source reference.
public struct IpWhoisLookupResponseIrtTechnicalContactsItem: Codable, Hashable, Sendable {
    /// Handle or unique identifier of this contact in WHOIS data.
    public let handle: String
    /// Name of the contact person or role.
    public let name: Nullable<String>?
    /// Address lines for this contact.
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
    /// Parsed country from the address field.
    public let country: Nullable<String>?
    /// Email addresses for this contact.
    public let email: Nullable<[String]>?
    /// Abuse mailbox email addresses for this contact.
    public let abuseMailbox: Nullable<[String]>?
    /// Phone numbers for this contact.
    public let phone: Nullable<[String]>?
    /// Fax numbers for this contact.
    public let faxNo: Nullable<[String]>?
    /// Handles of organization objects managing this contact.
    public let organizations: Nullable<[String]>?
    /// Handles of admin persons or roles linked to this contact.
    public let adminContacts: Nullable<[String]>?
    /// Handles of technical persons or roles linked to this contact.
    public let techContacts: Nullable<[String]>?
    /// Remarks for this contact object.
    public let remarks: Nullable<[String]>?
    /// Notify email addresses for this contact object.
    public let notify: Nullable<[String]>?
    /// Maintainer handles for this contact object.
    public let mntBy: Nullable<[String]>?
    /// Referenced maintainer handles for this contact object.
    public let mntRef: Nullable<[String]>?
    /// Registration date of this contact object (YYYY-MM-DD).
    public let dateCreated: Nullable<CalendarDate>?
    /// Last update date of this contact object (YYYY-MM-DD).
    public let dateUpdated: Nullable<CalendarDate>?
    /// WHOIS data source (RIR registry URL) for this object.
    public let source: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        handle: String,
        name: Nullable<String>? = nil,
        address: Nullable<[String]>? = nil,
        street: Nullable<String>? = nil,
        city: Nullable<String>? = nil,
        district: Nullable<String>? = nil,
        state: Nullable<String>? = nil,
        zipCode: Nullable<String>? = nil,
        country: Nullable<String>? = nil,
        email: Nullable<[String]>? = nil,
        abuseMailbox: Nullable<[String]>? = nil,
        phone: Nullable<[String]>? = nil,
        faxNo: Nullable<[String]>? = nil,
        organizations: Nullable<[String]>? = nil,
        adminContacts: Nullable<[String]>? = nil,
        techContacts: Nullable<[String]>? = nil,
        remarks: Nullable<[String]>? = nil,
        notify: Nullable<[String]>? = nil,
        mntBy: Nullable<[String]>? = nil,
        mntRef: Nullable<[String]>? = nil,
        dateCreated: Nullable<CalendarDate>? = nil,
        dateUpdated: Nullable<CalendarDate>? = nil,
        source: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.handle = handle
        self.name = name
        self.address = address
        self.street = street
        self.city = city
        self.district = district
        self.state = state
        self.zipCode = zipCode
        self.country = country
        self.email = email
        self.abuseMailbox = abuseMailbox
        self.phone = phone
        self.faxNo = faxNo
        self.organizations = organizations
        self.adminContacts = adminContacts
        self.techContacts = techContacts
        self.remarks = remarks
        self.notify = notify
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
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.address = try container.decodeNullableIfPresent([String].self, forKey: .address)
        self.street = try container.decodeNullableIfPresent(String.self, forKey: .street)
        self.city = try container.decodeNullableIfPresent(String.self, forKey: .city)
        self.district = try container.decodeNullableIfPresent(String.self, forKey: .district)
        self.state = try container.decodeNullableIfPresent(String.self, forKey: .state)
        self.zipCode = try container.decodeNullableIfPresent(String.self, forKey: .zipCode)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.email = try container.decodeNullableIfPresent([String].self, forKey: .email)
        self.abuseMailbox = try container.decodeNullableIfPresent([String].self, forKey: .abuseMailbox)
        self.phone = try container.decodeNullableIfPresent([String].self, forKey: .phone)
        self.faxNo = try container.decodeNullableIfPresent([String].self, forKey: .faxNo)
        self.organizations = try container.decodeNullableIfPresent([String].self, forKey: .organizations)
        self.adminContacts = try container.decodeNullableIfPresent([String].self, forKey: .adminContacts)
        self.techContacts = try container.decodeNullableIfPresent([String].self, forKey: .techContacts)
        self.remarks = try container.decodeNullableIfPresent([String].self, forKey: .remarks)
        self.notify = try container.decodeNullableIfPresent([String].self, forKey: .notify)
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
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.address, forKey: .address)
        try container.encodeNullableIfPresent(self.street, forKey: .street)
        try container.encodeNullableIfPresent(self.city, forKey: .city)
        try container.encodeNullableIfPresent(self.district, forKey: .district)
        try container.encodeNullableIfPresent(self.state, forKey: .state)
        try container.encodeNullableIfPresent(self.zipCode, forKey: .zipCode)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeNullableIfPresent(self.email, forKey: .email)
        try container.encodeNullableIfPresent(self.abuseMailbox, forKey: .abuseMailbox)
        try container.encodeNullableIfPresent(self.phone, forKey: .phone)
        try container.encodeNullableIfPresent(self.faxNo, forKey: .faxNo)
        try container.encodeNullableIfPresent(self.organizations, forKey: .organizations)
        try container.encodeNullableIfPresent(self.adminContacts, forKey: .adminContacts)
        try container.encodeNullableIfPresent(self.techContacts, forKey: .techContacts)
        try container.encodeNullableIfPresent(self.remarks, forKey: .remarks)
        try container.encodeNullableIfPresent(self.notify, forKey: .notify)
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
        case address
        case street
        case city
        case district
        case state
        case zipCode = "zip_code"
        case country
        case email
        case abuseMailbox = "abuse_mailbox"
        case phone
        case faxNo = "fax_no"
        case organizations
        case adminContacts = "admin_contacts"
        case techContacts = "tech_contacts"
        case remarks
        case notify
        case mntBy = "mnt_by"
        case mntRef = "mnt_ref"
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case source
    }
}