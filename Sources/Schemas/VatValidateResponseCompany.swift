import Foundation

public struct VatValidateResponseCompany: Codable, Hashable, Sendable {
    public let companyName: String
    public let companyAddress: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        companyName: String,
        companyAddress: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.companyName = companyName
        self.companyAddress = companyAddress
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companyName = try container.decode(String.self, forKey: .companyName)
        self.companyAddress = try container.decode(String.self, forKey: .companyAddress)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.companyName, forKey: .companyName)
        try container.encode(self.companyAddress, forKey: .companyAddress)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case companyName = "company_name"
        case companyAddress = "company_address"
    }
}