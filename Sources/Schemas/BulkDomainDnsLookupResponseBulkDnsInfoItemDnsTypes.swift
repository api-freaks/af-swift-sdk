import Foundation

public struct BulkDomainDnsLookupResponseBulkDnsInfoItemDnsTypes: Codable, Hashable, Sendable {
    public let a: Double?
    public let aaaa: Double?
    public let cname: Double?
    public let mx: Double?
    public let ns: Double?
    public let soa: Double?
    public let txt: Double?
    public let spf: Double?
    public let ptr: Double?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        a: Double? = nil,
        aaaa: Double? = nil,
        cname: Double? = nil,
        mx: Double? = nil,
        ns: Double? = nil,
        soa: Double? = nil,
        txt: Double? = nil,
        spf: Double? = nil,
        ptr: Double? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.a = a
        self.aaaa = aaaa
        self.cname = cname
        self.mx = mx
        self.ns = ns
        self.soa = soa
        self.txt = txt
        self.spf = spf
        self.ptr = ptr
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.a = try container.decodeIfPresent(Double.self, forKey: .a)
        self.aaaa = try container.decodeIfPresent(Double.self, forKey: .aaaa)
        self.cname = try container.decodeIfPresent(Double.self, forKey: .cname)
        self.mx = try container.decodeIfPresent(Double.self, forKey: .mx)
        self.ns = try container.decodeIfPresent(Double.self, forKey: .ns)
        self.soa = try container.decodeIfPresent(Double.self, forKey: .soa)
        self.txt = try container.decodeIfPresent(Double.self, forKey: .txt)
        self.spf = try container.decodeIfPresent(Double.self, forKey: .spf)
        self.ptr = try container.decodeIfPresent(Double.self, forKey: .ptr)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.a, forKey: .a)
        try container.encodeIfPresent(self.aaaa, forKey: .aaaa)
        try container.encodeIfPresent(self.cname, forKey: .cname)
        try container.encodeIfPresent(self.mx, forKey: .mx)
        try container.encodeIfPresent(self.ns, forKey: .ns)
        try container.encodeIfPresent(self.soa, forKey: .soa)
        try container.encodeIfPresent(self.txt, forKey: .txt)
        try container.encodeIfPresent(self.spf, forKey: .spf)
        try container.encodeIfPresent(self.ptr, forKey: .ptr)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case a = "A"
        case aaaa = "AAAA"
        case cname = "CNAME"
        case mx = "MX"
        case ns = "NS"
        case soa = "SOA"
        case txt = "TXT"
        case spf = "SPF"
        case ptr = "PTR"
    }
}