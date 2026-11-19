import Foundation

public struct IpWhoisLookupResponseAdministrativeContactsItem: Codable, Hashable, Sendable {
    public let handle: String?
    public let name: String?
    public let email: [String]?
    public let phone: [String]?
    public let source: String?
    /// Abuse mailbox email addresses for this contact.
    public let abuseMailbox: Nullable<[String]>?
    /// Address lines for this contact.
    public let address: Nullable<[String]>?
    /// Handles of admin persons or roles linked to this contact.
    public let adminContacts: Nullable<[String]>?
    /// Parsed city from the address field.
    public let city: Nullable<String>?
    /// Parsed country from the address field.
    public let country: Nullable<String>?
    /// Registration date of this contact object (YYYY-MM-DD).
    public let dateCreated: Nullable<CalendarDate>?
    /// Last update date of this contact object (YYYY-MM-DD).
    public let dateUpdated: Nullable<CalendarDate>?
    /// Parsed district from the address field.
    public let district: Nullable<String>?
    /// Fax numbers for this contact.
    public let faxNo: Nullable<[String]>?
    /// Maintainer handles for this contact object.
    public let mntBy: Nullable<[String]>?
    /// Referenced maintainer handles for this contact object.
    public let mntRef: Nullable<[String]>?
    /// Notify email addresses for this contact object.
    public let notify: Nullable<[String]>?
    /// Handles of organization objects managing this contact.
    public let organizations: Nullable<[String]>?
    /// Remarks for this contact object.
    public let remarks: Nullable<[String]>?
    /// Parsed state from the address field.
    public let state: Nullable<String>?
    /// Parsed street address from the address field.
    public let street: Nullable<String>?
    /// Handles of technical persons or roles linked to this contact.
    public let techContacts: Nullable<[String]>?
    /// Parsed ZIP code from the address field.
    public let zipCode: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        handle: String? = nil,
        name: String? = nil,
        email: [String]? = nil,
        phone: [String]? = nil,
        source: String? = nil,
        abuseMailbox: Nullable<[String]>? = nil,
        address: Nullable<[String]>? = nil,
        adminContacts: Nullable<[String]>? = nil,
        city: Nullable<String>? = nil,
        country: Nullable<String>? = nil,
        dateCreated: Nullable<CalendarDate>? = nil,
        dateUpdated: Nullable<CalendarDate>? = nil,
        district: Nullable<String>? = nil,
        faxNo: Nullable<[String]>? = nil,
        mntBy: Nullable<[String]>? = nil,
        mntRef: Nullable<[String]>? = nil,
        notify: Nullable<[String]>? = nil,
        organizations: Nullable<[String]>? = nil,
        remarks: Nullable<[String]>? = nil,
        state: Nullable<String>? = nil,
        street: Nullable<String>? = nil,
        techContacts: Nullable<[String]>? = nil,
        zipCode: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.handle = handle
        self.name = name
        self.email = email
        self.phone = phone
        self.source = source
        self.abuseMailbox = abuseMailbox
        self.address = address
        self.adminContacts = adminContacts
        self.city = city
        self.country = country
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
        self.district = district
        self.faxNo = faxNo
        self.mntBy = mntBy
        self.mntRef = mntRef
        self.notify = notify
        self.organizations = organizations
        self.remarks = remarks
        self.state = state
        self.street = street
        self.techContacts = techContacts
        self.zipCode = zipCode
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.handle = try container.decodeIfPresent(String.self, forKey: .handle)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.email = try container.decodeIfPresent([String].self, forKey: .email)
        self.phone = try container.decodeIfPresent([String].self, forKey: .phone)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.abuseMailbox = try container.decodeNullableIfPresent([String].self, forKey: .abuseMailbox)
        self.address = try container.decodeNullableIfPresent([String].self, forKey: .address)
        self.adminContacts = try container.decodeNullableIfPresent([String].self, forKey: .adminContacts)
        self.city = try container.decodeNullableIfPresent(String.self, forKey: .city)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.dateCreated = try container.decodeNullableIfPresent(CalendarDate.self, forKey: .dateCreated)
        self.dateUpdated = try container.decodeNullableIfPresent(CalendarDate.self, forKey: .dateUpdated)
        self.district = try container.decodeNullableIfPresent(String.self, forKey: .district)
        self.faxNo = try container.decodeNullableIfPresent([String].self, forKey: .faxNo)
        self.mntBy = try container.decodeNullableIfPresent([String].self, forKey: .mntBy)
        self.mntRef = try container.decodeNullableIfPresent([String].self, forKey: .mntRef)
        self.notify = try container.decodeNullableIfPresent([String].self, forKey: .notify)
        self.organizations = try container.decodeNullableIfPresent([String].self, forKey: .organizations)
        self.remarks = try container.decodeNullableIfPresent([String].self, forKey: .remarks)
        self.state = try container.decodeNullableIfPresent(String.self, forKey: .state)
        self.street = try container.decodeNullableIfPresent(String.self, forKey: .street)
        self.techContacts = try container.decodeNullableIfPresent([String].self, forKey: .techContacts)
        self.zipCode = try container.decodeNullableIfPresent(String.self, forKey: .zipCode)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.handle, forKey: .handle)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeNullableIfPresent(self.abuseMailbox, forKey: .abuseMailbox)
        try container.encodeNullableIfPresent(self.address, forKey: .address)
        try container.encodeNullableIfPresent(self.adminContacts, forKey: .adminContacts)
        try container.encodeNullableIfPresent(self.city, forKey: .city)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeNullableIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeNullableIfPresent(self.dateUpdated, forKey: .dateUpdated)
        try container.encodeNullableIfPresent(self.district, forKey: .district)
        try container.encodeNullableIfPresent(self.faxNo, forKey: .faxNo)
        try container.encodeNullableIfPresent(self.mntBy, forKey: .mntBy)
        try container.encodeNullableIfPresent(self.mntRef, forKey: .mntRef)
        try container.encodeNullableIfPresent(self.notify, forKey: .notify)
        try container.encodeNullableIfPresent(self.organizations, forKey: .organizations)
        try container.encodeNullableIfPresent(self.remarks, forKey: .remarks)
        try container.encodeNullableIfPresent(self.state, forKey: .state)
        try container.encodeNullableIfPresent(self.street, forKey: .street)
        try container.encodeNullableIfPresent(self.techContacts, forKey: .techContacts)
        try container.encodeNullableIfPresent(self.zipCode, forKey: .zipCode)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case handle
        case name
        case email
        case phone
        case source
        case abuseMailbox = "abuse_mailbox"
        case address
        case adminContacts = "admin_contacts"
        case city
        case country
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case district
        case faxNo = "fax_no"
        case mntBy = "mnt_by"
        case mntRef = "mnt_ref"
        case notify
        case organizations
        case remarks
        case state
        case street
        case techContacts = "tech_contacts"
        case zipCode = "zip_code"
    }
}