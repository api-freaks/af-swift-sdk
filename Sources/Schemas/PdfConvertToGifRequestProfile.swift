import Foundation

public enum PdfConvertToGifRequestProfile: String, Codable, Hashable, CaseIterable, Sendable {
    case bw
    case gray
    case rgb
    case rgba
    case fourBit = "4-bit"
    case eightBit = "8-bit"
}