import Foundation

/// BGP route object containing the route prefix, origin AS, and related metadata.
public struct IpWhoisLookupResponseRoutesItem: Codable, Hashable, Sendable {
    /// BGP route prefix (e.g., 8.8.8.0/24).
    public let route: Nullable<String>?
    /// Origin AS number for this route.
    public let origin: Nullable<String>?
    /// Description values for this route object.
    public let description: Nullable<[String]>?
    /// Country of the organization managing this route.
    public let country: Nullable<String>?
    /// Pingable IP addresses in this route.
    public let pingable: Nullable<[String]>?
    /// Handles of pingable contacts for this route.
    public let pingHdl: Nullable<[String]>?
    /// Sub-allocation holes (more specific routes) within this route.
    public let holes: Nullable<[String]>?
    /// Route sets this route is a member of.
    public let memberOf: Nullable<[String]>?
    /// Injection details for this route.
    public let inject: Nullable<[String]>?
    /// Aggregation method for this route.
    public let aggrMtd: Nullable<String>?
    /// Aggregation boundary for this route.
    public let aggrBndry: Nullable<String>?
    /// Export composition for this route.
    public let exportComps: Nullable<String>?
    /// Route components.
    public let components: Nullable<String>?
    /// Handles of organization objects related to this route.
    public let organizations: Nullable<[String]>?
    /// Remarks for this route object.
    public let remarks: Nullable<[String]>?
    /// Notify email addresses for this route object.
    public let notify: Nullable<[String]>?
    /// Lower-level maintainer handles for this route.
    public let mntLower: Nullable<[String]>?
    /// Maintainer handles for this route object.
    public let mntBy: Nullable<[String]>?
    /// Registration date of this route object (YYYY-MM-DD).
    public let dateCreated: Nullable<CalendarDate>?
    /// Last update date of this route object (YYYY-MM-DD).
    public let dateUpdated: Nullable<CalendarDate>?
    /// WHOIS data source for this route object.
    public let source: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        route: Nullable<String>? = nil,
        origin: Nullable<String>? = nil,
        description: Nullable<[String]>? = nil,
        country: Nullable<String>? = nil,
        pingable: Nullable<[String]>? = nil,
        pingHdl: Nullable<[String]>? = nil,
        holes: Nullable<[String]>? = nil,
        memberOf: Nullable<[String]>? = nil,
        inject: Nullable<[String]>? = nil,
        aggrMtd: Nullable<String>? = nil,
        aggrBndry: Nullable<String>? = nil,
        exportComps: Nullable<String>? = nil,
        components: Nullable<String>? = nil,
        organizations: Nullable<[String]>? = nil,
        remarks: Nullable<[String]>? = nil,
        notify: Nullable<[String]>? = nil,
        mntLower: Nullable<[String]>? = nil,
        mntBy: Nullable<[String]>? = nil,
        dateCreated: Nullable<CalendarDate>? = nil,
        dateUpdated: Nullable<CalendarDate>? = nil,
        source: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.route = route
        self.origin = origin
        self.description = description
        self.country = country
        self.pingable = pingable
        self.pingHdl = pingHdl
        self.holes = holes
        self.memberOf = memberOf
        self.inject = inject
        self.aggrMtd = aggrMtd
        self.aggrBndry = aggrBndry
        self.exportComps = exportComps
        self.components = components
        self.organizations = organizations
        self.remarks = remarks
        self.notify = notify
        self.mntLower = mntLower
        self.mntBy = mntBy
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
        self.source = source
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.route = try container.decodeNullableIfPresent(String.self, forKey: .route)
        self.origin = try container.decodeNullableIfPresent(String.self, forKey: .origin)
        self.description = try container.decodeNullableIfPresent([String].self, forKey: .description)
        self.country = try container.decodeNullableIfPresent(String.self, forKey: .country)
        self.pingable = try container.decodeNullableIfPresent([String].self, forKey: .pingable)
        self.pingHdl = try container.decodeNullableIfPresent([String].self, forKey: .pingHdl)
        self.holes = try container.decodeNullableIfPresent([String].self, forKey: .holes)
        self.memberOf = try container.decodeNullableIfPresent([String].self, forKey: .memberOf)
        self.inject = try container.decodeNullableIfPresent([String].self, forKey: .inject)
        self.aggrMtd = try container.decodeNullableIfPresent(String.self, forKey: .aggrMtd)
        self.aggrBndry = try container.decodeNullableIfPresent(String.self, forKey: .aggrBndry)
        self.exportComps = try container.decodeNullableIfPresent(String.self, forKey: .exportComps)
        self.components = try container.decodeNullableIfPresent(String.self, forKey: .components)
        self.organizations = try container.decodeNullableIfPresent([String].self, forKey: .organizations)
        self.remarks = try container.decodeNullableIfPresent([String].self, forKey: .remarks)
        self.notify = try container.decodeNullableIfPresent([String].self, forKey: .notify)
        self.mntLower = try container.decodeNullableIfPresent([String].self, forKey: .mntLower)
        self.mntBy = try container.decodeNullableIfPresent([String].self, forKey: .mntBy)
        self.dateCreated = try container.decodeNullableIfPresent(CalendarDate.self, forKey: .dateCreated)
        self.dateUpdated = try container.decodeNullableIfPresent(CalendarDate.self, forKey: .dateUpdated)
        self.source = try container.decodeNullableIfPresent(String.self, forKey: .source)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.route, forKey: .route)
        try container.encodeNullableIfPresent(self.origin, forKey: .origin)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encodeNullableIfPresent(self.country, forKey: .country)
        try container.encodeNullableIfPresent(self.pingable, forKey: .pingable)
        try container.encodeNullableIfPresent(self.pingHdl, forKey: .pingHdl)
        try container.encodeNullableIfPresent(self.holes, forKey: .holes)
        try container.encodeNullableIfPresent(self.memberOf, forKey: .memberOf)
        try container.encodeNullableIfPresent(self.inject, forKey: .inject)
        try container.encodeNullableIfPresent(self.aggrMtd, forKey: .aggrMtd)
        try container.encodeNullableIfPresent(self.aggrBndry, forKey: .aggrBndry)
        try container.encodeNullableIfPresent(self.exportComps, forKey: .exportComps)
        try container.encodeNullableIfPresent(self.components, forKey: .components)
        try container.encodeNullableIfPresent(self.organizations, forKey: .organizations)
        try container.encodeNullableIfPresent(self.remarks, forKey: .remarks)
        try container.encodeNullableIfPresent(self.notify, forKey: .notify)
        try container.encodeNullableIfPresent(self.mntLower, forKey: .mntLower)
        try container.encodeNullableIfPresent(self.mntBy, forKey: .mntBy)
        try container.encodeNullableIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeNullableIfPresent(self.dateUpdated, forKey: .dateUpdated)
        try container.encodeNullableIfPresent(self.source, forKey: .source)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case route
        case origin
        case description
        case country
        case pingable
        case pingHdl = "ping_hdl"
        case holes
        case memberOf = "member_of"
        case inject
        case aggrMtd = "aggr_mtd"
        case aggrBndry = "aggr_bndry"
        case exportComps = "export_comps"
        case components
        case organizations
        case remarks
        case notify
        case mntLower = "mnt_lower"
        case mntBy = "mnt_by"
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case source
    }
}