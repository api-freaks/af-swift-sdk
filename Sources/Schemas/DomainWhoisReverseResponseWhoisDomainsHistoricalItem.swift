import Foundation

public enum DomainWhoisReverseResponseWhoisDomainsHistoricalItem: Codable, Hashable, Sendable {
    case domainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContact(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContact)
    case domainWhoisReverseResponseWhoisDomainsHistoricalItemCompanyname(DomainWhoisReverseResponseWhoisDomainsHistoricalItemCompanyname)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(DomainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContact.self) {
            self = .domainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContact(value)
        } else if let value = try? container.decode(DomainWhoisReverseResponseWhoisDomainsHistoricalItemCompanyname.self) {
            self = .domainWhoisReverseResponseWhoisDomainsHistoricalItemCompanyname(value)
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
        case .domainWhoisReverseResponseWhoisDomainsHistoricalItemAdministrativeContact(let value):
            try container.encode(value)
        case .domainWhoisReverseResponseWhoisDomainsHistoricalItemCompanyname(let value):
            try container.encode(value)
        }
    }
}