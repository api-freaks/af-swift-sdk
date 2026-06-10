import Foundation

/// Classification of the phone line.
public enum BulkPhoneValidateResponseItemLineType: String, Codable, Hashable, CaseIterable, Sendable {
    case mobile = "MOBILE"
    case fixedLine = "FIXED_LINE"
    case fixedLineOrMobile = "FIXED_LINE_OR_MOBILE"
    case voip = "VOIP"
    case tollFree = "TOLL_FREE"
    case premiumRate = "PREMIUM_RATE"
    case sharedCost = "SHARED_COST"
    case personalNumber = "PERSONAL_NUMBER"
    case pager = "PAGER"
    case uan = "UAN"
    case voicemail = "VOICEMAIL"
    case unknown = "UNKNOWN"
}