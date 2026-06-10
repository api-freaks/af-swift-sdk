import Foundation

public struct DomainAvailabilitySuggestionsResponse: Codable, Hashable, Sendable {
    public let domainAvailableResponse: [DomainAvailabilitySuggestionsResponseDomainAvailableResponseItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domainAvailableResponse: [DomainAvailabilitySuggestionsResponseDomainAvailableResponseItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domainAvailableResponse = domainAvailableResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domainAvailableResponse = try container.decodeIfPresent([DomainAvailabilitySuggestionsResponseDomainAvailableResponseItem].self, forKey: .domainAvailableResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.domainAvailableResponse, forKey: .domainAvailableResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domainAvailableResponse = "domain_available_response"
    }
}