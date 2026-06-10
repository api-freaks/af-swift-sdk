import Foundation

public enum CurrencySupportedResponseSupportedCurrenciesMapValueStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case available = "AVAILABLE"
    case depreciated = "DEPRECIATED"
}