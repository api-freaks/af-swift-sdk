import Foundation

public struct IpWhoisLookupResponseIrt: Codable, Hashable, Sendable {
    public let handle: String?
    public let address: [String]?
    public let street: String?
    public let city: String?
    public let district: String?
    public let state: String?
    public let zipCode: String?
    public let country: String?
    public let email: [String]?
    public let abuseMailbox: [String]?
    public let phone: [String]?
    public let faxNo: [String]?
    public let organizations: [String]?
    public let adminContacts: [String]?
    public let techContacts: [String]?
    public let remarks: [String]?
    public let signature: [String]?
    public let encryption: [String]?
    public let auth: [String]?
    public let notify: [String]?
    public let irtNfy: [String]?
    public let mntBy: [String]?
    public let mntRef: [String]?
    public let dateCreated: String?
    public let dateUpdated: String?
    public let source: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        handle: String? = nil,
        address: [String]? = nil,
        street: String? = nil,
        city: String? = nil,
        district: String? = nil,
        state: String? = nil,
        zipCode: String? = nil,
        country: String? = nil,
        email: [String]? = nil,
        abuseMailbox: [String]? = nil,
        phone: [String]? = nil,
        faxNo: [String]? = nil,
        organizations: [String]? = nil,
        adminContacts: [String]? = nil,
        techContacts: [String]? = nil,
        remarks: [String]? = nil,
        signature: [String]? = nil,
        encryption: [String]? = nil,
        auth: [String]? = nil,
        notify: [String]? = nil,
        irtNfy: [String]? = nil,
        mntBy: [String]? = nil,
        mntRef: [String]? = nil,
        dateCreated: String? = nil,
        dateUpdated: String? = nil,
        source: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.handle = handle
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
        self.signature = signature
        self.encryption = encryption
        self.auth = auth
        self.notify = notify
        self.irtNfy = irtNfy
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
        self.address = try container.decodeIfPresent([String].self, forKey: .address)
        self.street = try container.decodeIfPresent(String.self, forKey: .street)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.email = try container.decodeIfPresent([String].self, forKey: .email)
        self.abuseMailbox = try container.decodeIfPresent([String].self, forKey: .abuseMailbox)
        self.phone = try container.decodeIfPresent([String].self, forKey: .phone)
        self.faxNo = try container.decodeIfPresent([String].self, forKey: .faxNo)
        self.organizations = try container.decodeIfPresent([String].self, forKey: .organizations)
        self.adminContacts = try container.decodeIfPresent([String].self, forKey: .adminContacts)
        self.techContacts = try container.decodeIfPresent([String].self, forKey: .techContacts)
        self.remarks = try container.decodeIfPresent([String].self, forKey: .remarks)
        self.signature = try container.decodeIfPresent([String].self, forKey: .signature)
        self.encryption = try container.decodeIfPresent([String].self, forKey: .encryption)
        self.auth = try container.decodeIfPresent([String].self, forKey: .auth)
        self.notify = try container.decodeIfPresent([String].self, forKey: .notify)
        self.irtNfy = try container.decodeIfPresent([String].self, forKey: .irtNfy)
        self.mntBy = try container.decodeIfPresent([String].self, forKey: .mntBy)
        self.mntRef = try container.decodeIfPresent([String].self, forKey: .mntRef)
        self.dateCreated = try container.decodeIfPresent(String.self, forKey: .dateCreated)
        self.dateUpdated = try container.decodeIfPresent(String.self, forKey: .dateUpdated)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.handle, forKey: .handle)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.street, forKey: .street)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.zipCode, forKey: .zipCode)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.abuseMailbox, forKey: .abuseMailbox)
        try container.encodeIfPresent(self.phone, forKey: .phone)
        try container.encodeIfPresent(self.faxNo, forKey: .faxNo)
        try container.encodeIfPresent(self.organizations, forKey: .organizations)
        try container.encodeIfPresent(self.adminContacts, forKey: .adminContacts)
        try container.encodeIfPresent(self.techContacts, forKey: .techContacts)
        try container.encodeIfPresent(self.remarks, forKey: .remarks)
        try container.encodeIfPresent(self.signature, forKey: .signature)
        try container.encodeIfPresent(self.encryption, forKey: .encryption)
        try container.encodeIfPresent(self.auth, forKey: .auth)
        try container.encodeIfPresent(self.notify, forKey: .notify)
        try container.encodeIfPresent(self.irtNfy, forKey: .irtNfy)
        try container.encodeIfPresent(self.mntBy, forKey: .mntBy)
        try container.encodeIfPresent(self.mntRef, forKey: .mntRef)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.dateUpdated, forKey: .dateUpdated)
        try container.encodeIfPresent(self.source, forKey: .source)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case handle
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
        case signature
        case encryption
        case auth
        case notify
        case irtNfy = "irt_nfy"
        case mntBy = "mnt_by"
        case mntRef = "mnt_ref"
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case source
    }
}