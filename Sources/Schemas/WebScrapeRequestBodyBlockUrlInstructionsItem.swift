import Foundation

public enum WebScrapeRequestBodyBlockUrlInstructionsItem: Codable, Hashable, Sendable {
    case webScrapeRequestBodyBlockUrlInstructionsItemBlockElement(WebScrapeRequestBodyBlockUrlInstructionsItemBlockElement)
    case webScrapeRequestBodyBlockUrlInstructionsItemClick(WebScrapeRequestBodyBlockUrlInstructionsItemClick)
    case webScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue(WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue)
    case webScrapeRequestBodyBlockUrlInstructionsItemClickIfExist(WebScrapeRequestBodyBlockUrlInstructionsItemClickIfExist)
    case webScrapeRequestBodyBlockUrlInstructionsItemConditionalCheck(WebScrapeRequestBodyBlockUrlInstructionsItemConditionalCheck)
    case webScrapeRequestBodyBlockUrlInstructionsItemEnter(WebScrapeRequestBodyBlockUrlInstructionsItemEnter)
    case webScrapeRequestBodyBlockUrlInstructionsItemExtract(WebScrapeRequestBodyBlockUrlInstructionsItemExtract)
    case webScrapeRequestBodyBlockUrlInstructionsItemFill(WebScrapeRequestBodyBlockUrlInstructionsItemFill)
    case webScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptcha(WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptcha)
    case webScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptcha(WebScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptcha)
    case webScrapeRequestBodyBlockUrlInstructionsItemJsExe(WebScrapeRequestBodyBlockUrlInstructionsItemJsExe)
    case webScrapeRequestBodyBlockUrlInstructionsItemMoveToRelativeTab(WebScrapeRequestBodyBlockUrlInstructionsItemMoveToRelativeTab)
    case webScrapeRequestBodyBlockUrlInstructionsItemNewTab(WebScrapeRequestBodyBlockUrlInstructionsItemNewTab)
    case webScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha(WebScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha)
    case webScrapeRequestBodyBlockUrlInstructionsItemSaveimage(WebScrapeRequestBodyBlockUrlInstructionsItemSaveimage)
    case webScrapeRequestBodyBlockUrlInstructionsItemScreenshot(WebScrapeRequestBodyBlockUrlInstructionsItemScreenshot)
    case webScrapeRequestBodyBlockUrlInstructionsItemSelect(WebScrapeRequestBodyBlockUrlInstructionsItemSelect)
    case webScrapeRequestBodyBlockUrlInstructionsItemSwitchToIframe(WebScrapeRequestBodyBlockUrlInstructionsItemSwitchToIframe)
    case webScrapeRequestBodyBlockUrlInstructionsItemSwitchToParentFrame(WebScrapeRequestBodyBlockUrlInstructionsItemSwitchToParentFrame)
    case webScrapeRequestBodyBlockUrlInstructionsItemWait(WebScrapeRequestBodyBlockUrlInstructionsItemWait)
    case webScrapeRequestBodyBlockUrlInstructionsItemWaitFor(WebScrapeRequestBodyBlockUrlInstructionsItemWaitFor)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemBlockElement.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemBlockElement(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemClick.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemClick(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemClickIfExist.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemClickIfExist(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemConditionalCheck.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemConditionalCheck(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemEnter.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemEnter(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemExtract.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemExtract(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemFill.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemFill(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptcha.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptcha(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptcha.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptcha(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemJsExe.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemJsExe(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemMoveToRelativeTab.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemMoveToRelativeTab(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemNewTab.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemNewTab(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemSaveimage.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemSaveimage(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemScreenshot.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemScreenshot(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemSelect.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemSelect(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemSwitchToIframe.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemSwitchToIframe(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemSwitchToParentFrame.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemSwitchToParentFrame(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemWait.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemWait(value)
        } else if let value = try? container.decode(WebScrapeRequestBodyBlockUrlInstructionsItemWaitFor.self) {
            self = .webScrapeRequestBodyBlockUrlInstructionsItemWaitFor(value)
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
        case .webScrapeRequestBodyBlockUrlInstructionsItemBlockElement(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemClick(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemClickIfExist(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemConditionalCheck(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemEnter(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemExtract(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemFill(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptcha(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptcha(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemJsExe(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemMoveToRelativeTab(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemNewTab(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemSaveimage(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemScreenshot(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemSelect(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemSwitchToIframe(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemSwitchToParentFrame(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemWait(let value):
            try container.encode(value)
        case .webScrapeRequestBodyBlockUrlInstructionsItemWaitFor(let value):
            try container.encode(value)
        }
    }
}