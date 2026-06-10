import Foundation

public enum PdfConvertToJpgRequestProfile: String, Codable, Hashable, CaseIterable, Sendable {
    case gray
    case rgb
    case cmyk
}