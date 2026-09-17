import Foundation

public enum DomainAvailabilitySuggestionsResponse: Codable, Hashable, Sendable {
    /// Returned when `sug=false` — availability for the queried domain only, no suggestions.
    case domainAvailabilitySuggestionsResponseDomain(DomainAvailabilitySuggestionsResponseDomain)
    /// Returned when `sug` is omitted or `true` — the queried domain plus suggested alternatives.
    case domainAvailabilitySuggestionsResponseDomainAvailableResponse(DomainAvailabilitySuggestionsResponseDomainAvailableResponse)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(DomainAvailabilitySuggestionsResponseDomain.self) {
            self = .domainAvailabilitySuggestionsResponseDomain(value)
        } else if let value = try? container.decode(DomainAvailabilitySuggestionsResponseDomainAvailableResponse.self) {
            self = .domainAvailabilitySuggestionsResponseDomainAvailableResponse(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .domainAvailabilitySuggestionsResponseDomain(let value):
            try container.encode(value)
        case .domainAvailabilitySuggestionsResponseDomainAvailableResponse(let value):
            try container.encode(value)
        }
    }
}