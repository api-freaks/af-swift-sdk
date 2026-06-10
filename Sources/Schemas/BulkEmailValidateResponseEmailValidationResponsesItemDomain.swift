import Foundation

public struct BulkEmailValidateResponseEmailValidationResponsesItemDomain: Codable, Hashable, Sendable {
    public let name: String
    public let disposable: Bool
    public let spam: Bool
    public let free: Bool
    public let catchAll: Bool
    public let validDomain: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: String,
        disposable: Bool,
        spam: Bool,
        free: Bool,
        catchAll: Bool,
        validDomain: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.disposable = disposable
        self.spam = spam
        self.free = free
        self.catchAll = catchAll
        self.validDomain = validDomain
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.disposable = try container.decode(Bool.self, forKey: .disposable)
        self.spam = try container.decode(Bool.self, forKey: .spam)
        self.free = try container.decode(Bool.self, forKey: .free)
        self.catchAll = try container.decode(Bool.self, forKey: .catchAll)
        self.validDomain = try container.decode(Bool.self, forKey: .validDomain)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.disposable, forKey: .disposable)
        try container.encode(self.spam, forKey: .spam)
        try container.encode(self.free, forKey: .free)
        try container.encode(self.catchAll, forKey: .catchAll)
        try container.encode(self.validDomain, forKey: .validDomain)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case disposable
        case spam
        case free
        case catchAll
        case validDomain
    }
}