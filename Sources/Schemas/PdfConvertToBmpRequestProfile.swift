import Foundation

public enum PdfConvertToBmpRequestProfile: String, Codable, Hashable, CaseIterable, Sendable {
    case bw
    case gray
    case rgb
    case fourBit = "4-bit"
    case eightBit = "8-bit"
}