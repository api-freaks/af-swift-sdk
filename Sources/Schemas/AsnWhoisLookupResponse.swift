import Foundation

public struct AsnWhoisLookupResponse: Codable, Hashable, Sendable {
    public let asNumber: String
    public let asName: String
    public let orgName: String
    public let description: String?
    public let orgHandle: String
    public let country: String
    public let domain: String?
    public let website: String?
    public let allocationStatus: String
    public let numOfIPv4Routes: String
    public let numOfIPv6Routes: String
    public let whoisHost: String
    public let dateAllocated: CalendarDate?
    public let type: String
    public let routeObjects: [AsnWhoisLookupResponseRouteObjectsItem]
    public let whoisResponse: String
    public let downstreams: [AsnWhoisLookupResponseDownstreamsItem]
    public let parsedWhoisResponse: AsnWhoisLookupResponseParsedWhoisResponse
    public let upstreams: [AsnWhoisLookupResponseUpstreamsItem]
    public let peers: [AsnWhoisLookupResponsePeersItem]
    public let contacts: AsnWhoisLookupResponseContacts
    public let legacyRoutes: [String]
    public let whoisRawResponse: String?
    public let rWhoisRawResponse: String?
    public let queryTime: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        asNumber: String,
        asName: String,
        orgName: String,
        description: String? = nil,
        orgHandle: String,
        country: String,
        domain: String? = nil,
        website: String? = nil,
        allocationStatus: String,
        numOfIPv4Routes: String,
        numOfIPv6Routes: String,
        whoisHost: String,
        dateAllocated: CalendarDate? = nil,
        type: String,
        routeObjects: [AsnWhoisLookupResponseRouteObjectsItem],
        whoisResponse: String,
        downstreams: [AsnWhoisLookupResponseDownstreamsItem],
        parsedWhoisResponse: AsnWhoisLookupResponseParsedWhoisResponse,
        upstreams: [AsnWhoisLookupResponseUpstreamsItem],
        peers: [AsnWhoisLookupResponsePeersItem],
        contacts: AsnWhoisLookupResponseContacts,
        legacyRoutes: [String],
        whoisRawResponse: String? = nil,
        rWhoisRawResponse: String? = nil,
        queryTime: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.asNumber = asNumber
        self.asName = asName
        self.orgName = orgName
        self.description = description
        self.orgHandle = orgHandle
        self.country = country
        self.domain = domain
        self.website = website
        self.allocationStatus = allocationStatus
        self.numOfIPv4Routes = numOfIPv4Routes
        self.numOfIPv6Routes = numOfIPv6Routes
        self.whoisHost = whoisHost
        self.dateAllocated = dateAllocated
        self.type = type
        self.routeObjects = routeObjects
        self.whoisResponse = whoisResponse
        self.downstreams = downstreams
        self.parsedWhoisResponse = parsedWhoisResponse
        self.upstreams = upstreams
        self.peers = peers
        self.contacts = contacts
        self.legacyRoutes = legacyRoutes
        self.whoisRawResponse = whoisRawResponse
        self.rWhoisRawResponse = rWhoisRawResponse
        self.queryTime = queryTime
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.asNumber = try container.decode(String.self, forKey: .asNumber)
        self.asName = try container.decode(String.self, forKey: .asName)
        self.orgName = try container.decode(String.self, forKey: .orgName)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.orgHandle = try container.decode(String.self, forKey: .orgHandle)
        self.country = try container.decode(String.self, forKey: .country)
        self.domain = try container.decodeIfPresent(String.self, forKey: .domain)
        self.website = try container.decodeIfPresent(String.self, forKey: .website)
        self.allocationStatus = try container.decode(String.self, forKey: .allocationStatus)
        self.numOfIPv4Routes = try container.decode(String.self, forKey: .numOfIPv4Routes)
        self.numOfIPv6Routes = try container.decode(String.self, forKey: .numOfIPv6Routes)
        self.whoisHost = try container.decode(String.self, forKey: .whoisHost)
        self.dateAllocated = try container.decodeIfPresent(CalendarDate.self, forKey: .dateAllocated)
        self.type = try container.decode(String.self, forKey: .type)
        self.routeObjects = try container.decode([AsnWhoisLookupResponseRouteObjectsItem].self, forKey: .routeObjects)
        self.whoisResponse = try container.decode(String.self, forKey: .whoisResponse)
        self.downstreams = try container.decode([AsnWhoisLookupResponseDownstreamsItem].self, forKey: .downstreams)
        self.parsedWhoisResponse = try container.decode(AsnWhoisLookupResponseParsedWhoisResponse.self, forKey: .parsedWhoisResponse)
        self.upstreams = try container.decode([AsnWhoisLookupResponseUpstreamsItem].self, forKey: .upstreams)
        self.peers = try container.decode([AsnWhoisLookupResponsePeersItem].self, forKey: .peers)
        self.contacts = try container.decode(AsnWhoisLookupResponseContacts.self, forKey: .contacts)
        self.legacyRoutes = try container.decode([String].self, forKey: .legacyRoutes)
        self.whoisRawResponse = try container.decodeIfPresent(String.self, forKey: .whoisRawResponse)
        self.rWhoisRawResponse = try container.decodeIfPresent(String.self, forKey: .rWhoisRawResponse)
        self.queryTime = try container.decodeIfPresent(String.self, forKey: .queryTime)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.asNumber, forKey: .asNumber)
        try container.encode(self.asName, forKey: .asName)
        try container.encode(self.orgName, forKey: .orgName)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.orgHandle, forKey: .orgHandle)
        try container.encode(self.country, forKey: .country)
        try container.encodeIfPresent(self.domain, forKey: .domain)
        try container.encodeIfPresent(self.website, forKey: .website)
        try container.encode(self.allocationStatus, forKey: .allocationStatus)
        try container.encode(self.numOfIPv4Routes, forKey: .numOfIPv4Routes)
        try container.encode(self.numOfIPv6Routes, forKey: .numOfIPv6Routes)
        try container.encode(self.whoisHost, forKey: .whoisHost)
        try container.encodeIfPresent(self.dateAllocated, forKey: .dateAllocated)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.routeObjects, forKey: .routeObjects)
        try container.encode(self.whoisResponse, forKey: .whoisResponse)
        try container.encode(self.downstreams, forKey: .downstreams)
        try container.encode(self.parsedWhoisResponse, forKey: .parsedWhoisResponse)
        try container.encode(self.upstreams, forKey: .upstreams)
        try container.encode(self.peers, forKey: .peers)
        try container.encode(self.contacts, forKey: .contacts)
        try container.encode(self.legacyRoutes, forKey: .legacyRoutes)
        try container.encodeIfPresent(self.whoisRawResponse, forKey: .whoisRawResponse)
        try container.encodeIfPresent(self.rWhoisRawResponse, forKey: .rWhoisRawResponse)
        try container.encodeIfPresent(self.queryTime, forKey: .queryTime)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case asNumber
        case asName
        case orgName
        case description
        case orgHandle
        case country
        case domain
        case website
        case allocationStatus
        case numOfIPv4Routes
        case numOfIPv6Routes
        case whoisHost
        case dateAllocated
        case type
        case routeObjects
        case whoisResponse
        case downstreams
        case parsedWhoisResponse
        case upstreams
        case peers
        case contacts
        case legacyRoutes
        case whoisRawResponse = "whois_raw_response"
        case rWhoisRawResponse = "r_whois_raw_response"
        case queryTime = "query_time"
    }
}