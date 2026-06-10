import Foundation

public enum DomainAvailabilitySuggestionsRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}