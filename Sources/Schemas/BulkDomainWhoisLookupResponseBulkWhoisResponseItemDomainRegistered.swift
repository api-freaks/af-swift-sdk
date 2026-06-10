import Foundation

public enum BulkDomainWhoisLookupResponseBulkWhoisResponseItemDomainRegistered: String, Codable, Hashable, CaseIterable, Sendable {
    case yes
    case no
    case restricted
}