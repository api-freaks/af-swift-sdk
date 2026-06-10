import Foundation

public struct IpWhoisLookupResponseInetNumsItem: Codable, Hashable, Sendable {
    public let startIp: String?
    public let endIp: String?
    public let cidr: [String]?
    public let netName: String?
    public let netHandle: String?
    public let description: [String]?
    public let countries: [String]?
    public let geofeed: String?
    public let latitude: Double?
    public let longitude: Double?
    public let city: String?
    public let languages: [String]?
    public let status: String?
    public let organization: String?
    public let sponsoringOrganization: String?
    public let adminContacts: [String]?
    public let techContacts: [String]?
    public let abuseContacts: [String]?
    public let remarks: [String]?
    public let assignmentSize: String?
    public let notify: [String]?
    public let mntBy: [String]?
    public let mntLower: [String]?
    public let mntDomains: [String]?
    public let mntRoutes: [String]?
    public let mntIrt: [String]?
    public let dateCreated: String?
    public let dateUpdated: String?
    public let source: String?
    public let parents: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        startIp: String? = nil,
        endIp: String? = nil,
        cidr: [String]? = nil,
        netName: String? = nil,
        netHandle: String? = nil,
        description: [String]? = nil,
        countries: [String]? = nil,
        geofeed: String? = nil,
        latitude: Double? = nil,
        longitude: Double? = nil,
        city: String? = nil,
        languages: [String]? = nil,
        status: String? = nil,
        organization: String? = nil,
        sponsoringOrganization: String? = nil,
        adminContacts: [String]? = nil,
        techContacts: [String]? = nil,
        abuseContacts: [String]? = nil,
        remarks: [String]? = nil,
        assignmentSize: String? = nil,
        notify: [String]? = nil,
        mntBy: [String]? = nil,
        mntLower: [String]? = nil,
        mntDomains: [String]? = nil,
        mntRoutes: [String]? = nil,
        mntIrt: [String]? = nil,
        dateCreated: String? = nil,
        dateUpdated: String? = nil,
        source: String? = nil,
        parents: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.startIp = startIp
        self.endIp = endIp
        self.cidr = cidr
        self.netName = netName
        self.netHandle = netHandle
        self.description = description
        self.countries = countries
        self.geofeed = geofeed
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
        self.languages = languages
        self.status = status
        self.organization = organization
        self.sponsoringOrganization = sponsoringOrganization
        self.adminContacts = adminContacts
        self.techContacts = techContacts
        self.abuseContacts = abuseContacts
        self.remarks = remarks
        self.assignmentSize = assignmentSize
        self.notify = notify
        self.mntBy = mntBy
        self.mntLower = mntLower
        self.mntDomains = mntDomains
        self.mntRoutes = mntRoutes
        self.mntIrt = mntIrt
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
        self.source = source
        self.parents = parents
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.startIp = try container.decodeIfPresent(String.self, forKey: .startIp)
        self.endIp = try container.decodeIfPresent(String.self, forKey: .endIp)
        self.cidr = try container.decodeIfPresent([String].self, forKey: .cidr)
        self.netName = try container.decodeIfPresent(String.self, forKey: .netName)
        self.netHandle = try container.decodeIfPresent(String.self, forKey: .netHandle)
        self.description = try container.decodeIfPresent([String].self, forKey: .description)
        self.countries = try container.decodeIfPresent([String].self, forKey: .countries)
        self.geofeed = try container.decodeIfPresent(String.self, forKey: .geofeed)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.languages = try container.decodeIfPresent([String].self, forKey: .languages)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.organization = try container.decodeIfPresent(String.self, forKey: .organization)
        self.sponsoringOrganization = try container.decodeIfPresent(String.self, forKey: .sponsoringOrganization)
        self.adminContacts = try container.decodeIfPresent([String].self, forKey: .adminContacts)
        self.techContacts = try container.decodeIfPresent([String].self, forKey: .techContacts)
        self.abuseContacts = try container.decodeIfPresent([String].self, forKey: .abuseContacts)
        self.remarks = try container.decodeIfPresent([String].self, forKey: .remarks)
        self.assignmentSize = try container.decodeIfPresent(String.self, forKey: .assignmentSize)
        self.notify = try container.decodeIfPresent([String].self, forKey: .notify)
        self.mntBy = try container.decodeIfPresent([String].self, forKey: .mntBy)
        self.mntLower = try container.decodeIfPresent([String].self, forKey: .mntLower)
        self.mntDomains = try container.decodeIfPresent([String].self, forKey: .mntDomains)
        self.mntRoutes = try container.decodeIfPresent([String].self, forKey: .mntRoutes)
        self.mntIrt = try container.decodeIfPresent([String].self, forKey: .mntIrt)
        self.dateCreated = try container.decodeIfPresent(String.self, forKey: .dateCreated)
        self.dateUpdated = try container.decodeIfPresent(String.self, forKey: .dateUpdated)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.parents = try container.decodeIfPresent([String].self, forKey: .parents)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.startIp, forKey: .startIp)
        try container.encodeIfPresent(self.endIp, forKey: .endIp)
        try container.encodeIfPresent(self.cidr, forKey: .cidr)
        try container.encodeIfPresent(self.netName, forKey: .netName)
        try container.encodeIfPresent(self.netHandle, forKey: .netHandle)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.countries, forKey: .countries)
        try container.encodeIfPresent(self.geofeed, forKey: .geofeed)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.languages, forKey: .languages)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.sponsoringOrganization, forKey: .sponsoringOrganization)
        try container.encodeIfPresent(self.adminContacts, forKey: .adminContacts)
        try container.encodeIfPresent(self.techContacts, forKey: .techContacts)
        try container.encodeIfPresent(self.abuseContacts, forKey: .abuseContacts)
        try container.encodeIfPresent(self.remarks, forKey: .remarks)
        try container.encodeIfPresent(self.assignmentSize, forKey: .assignmentSize)
        try container.encodeIfPresent(self.notify, forKey: .notify)
        try container.encodeIfPresent(self.mntBy, forKey: .mntBy)
        try container.encodeIfPresent(self.mntLower, forKey: .mntLower)
        try container.encodeIfPresent(self.mntDomains, forKey: .mntDomains)
        try container.encodeIfPresent(self.mntRoutes, forKey: .mntRoutes)
        try container.encodeIfPresent(self.mntIrt, forKey: .mntIrt)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.dateUpdated, forKey: .dateUpdated)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.parents, forKey: .parents)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case startIp = "start_ip"
        case endIp = "end_ip"
        case cidr
        case netName = "net_name"
        case netHandle = "net_handle"
        case description
        case countries
        case geofeed
        case latitude
        case longitude
        case city
        case languages
        case status
        case organization
        case sponsoringOrganization = "sponsoring_organization"
        case adminContacts = "admin_contacts"
        case techContacts = "tech_contacts"
        case abuseContacts = "abuse_contacts"
        case remarks
        case assignmentSize = "assignment_size"
        case notify
        case mntBy = "mnt_by"
        case mntLower = "mnt_lower"
        case mntDomains = "mnt_domains"
        case mntRoutes = "mnt_routes"
        case mntIrt = "mnt_irt"
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case source
        case parents
    }
}