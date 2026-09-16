import Foundation

/// Domain registration status as recorded by the registry.
public enum BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactRegistryDataDomainRegistered: String, Codable, Hashable, CaseIterable, Sendable {
    case yes
    case no
    case restricted
}