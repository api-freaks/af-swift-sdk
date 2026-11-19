import Foundation

/// A single browser scraping step. Exactly one of these action fields is set per instruction; every other field is absent.
public struct WebScrapeRequestBodyBlockUrlInstructionsItem: Codable, Hashable, Sendable {
    /// A selector/value pair used by fill, select, and clickButtonByValue instructions.
    public let fill: WebScrapeRequestBodyBlockUrlInstructionsItemFill?
    /// Click action: CSS selector or XPath identifying the element to click.
    public let click: String?
    /// Click if exists action: CSS selector or XPath identifying the element to click, only if it appears on the page within a short timeout.
    public let clickIfExist: String?
    /// Enter key action: CSS selector or XPath identifying the element to send an Enter keystroke to.
    public let enter: String?
    /// New tab action: set to true to switch focus to a newly opened browser tab.
    public let newTab: Bool?
    /// Move to relative tab action: relative tab index to move to (e.g. 1 for the next tab, -1 for the previous tab).
    public let moveToRelativeTab: Int?
    /// Wait action: pauses execution for this many milliseconds.
    public let wait: Int?
    /// Wait for element action: CSS selector or XPath identifying the element to wait for before continuing.
    public let waitFor: String?
    /// A selector/value pair used by fill, select, and clickButtonByValue instructions.
    public let select: WebScrapeRequestBodyBlockUrlInstructionsItemSelect?
    /// Execute JavaScript action: JavaScript code to execute inside the page context.
    public let jsExe: String?
    /// Conditional check action: list of conditional steps, each supporting if-<method> and else-<method> keys with conditions, executed based on element state.
    public let conditionalCheck: [[String: JSONValue]]?
    /// A selector/value pair used by fill, select, and clickButtonByValue instructions.
    public let clickButtonByValue: WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue?
    /// Image captcha solver action: instructions for solving image-based captchas using a selected model.
    public let generalImageCaptcha: [WebScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptchaItem]?
    /// Block element action: list of CSS selectors or XPaths for elements to block or hide on the page.
    public let blockElement: [String]?
    /// Maps arbitrary output field names to CSS or XPath selectors. Each key becomes a field in the response's extractedData object.
    public let extract: [String: String]?
    /// Fill image captcha action: captures and fills image-based captcha values automatically.
    public let fillImageCaptcha: [WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptchaItem]?
    /// Switch to iframe action: switches the browser context into an iframe identified by name or ID.
    public let switchToIframe: String?
    /// Switch to parent frame action: returns the browser context from an iframe back to its parent frame.
    public let switchToParentFrame: Bool?
    /// Selectors for locating and solving a single audio CAPTCHA challenge.
    public let resolveAudioCaptcha: WebScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha?
    /// Screenshot action: captures a screenshot of the current page state. Can be a boolean-like value or a selector.
    public let screenshot: String?
    /// Save image action: saves an image from the page by CSS selector or element ID.
    public let saveimage: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fill: WebScrapeRequestBodyBlockUrlInstructionsItemFill? = nil,
        click: String? = nil,
        clickIfExist: String? = nil,
        enter: String? = nil,
        newTab: Bool? = nil,
        moveToRelativeTab: Int? = nil,
        wait: Int? = nil,
        waitFor: String? = nil,
        select: WebScrapeRequestBodyBlockUrlInstructionsItemSelect? = nil,
        jsExe: String? = nil,
        conditionalCheck: [[String: JSONValue]]? = nil,
        clickButtonByValue: WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue? = nil,
        generalImageCaptcha: [WebScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptchaItem]? = nil,
        blockElement: [String]? = nil,
        extract: [String: String]? = nil,
        fillImageCaptcha: [WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptchaItem]? = nil,
        switchToIframe: String? = nil,
        switchToParentFrame: Bool? = nil,
        resolveAudioCaptcha: WebScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha? = nil,
        screenshot: String? = nil,
        saveimage: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fill = fill
        self.click = click
        self.clickIfExist = clickIfExist
        self.enter = enter
        self.newTab = newTab
        self.moveToRelativeTab = moveToRelativeTab
        self.wait = wait
        self.waitFor = waitFor
        self.select = select
        self.jsExe = jsExe
        self.conditionalCheck = conditionalCheck
        self.clickButtonByValue = clickButtonByValue
        self.generalImageCaptcha = generalImageCaptcha
        self.blockElement = blockElement
        self.extract = extract
        self.fillImageCaptcha = fillImageCaptcha
        self.switchToIframe = switchToIframe
        self.switchToParentFrame = switchToParentFrame
        self.resolveAudioCaptcha = resolveAudioCaptcha
        self.screenshot = screenshot
        self.saveimage = saveimage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fill = try container.decodeIfPresent(WebScrapeRequestBodyBlockUrlInstructionsItemFill.self, forKey: .fill)
        self.click = try container.decodeIfPresent(String.self, forKey: .click)
        self.clickIfExist = try container.decodeIfPresent(String.self, forKey: .clickIfExist)
        self.enter = try container.decodeIfPresent(String.self, forKey: .enter)
        self.newTab = try container.decodeIfPresent(Bool.self, forKey: .newTab)
        self.moveToRelativeTab = try container.decodeIfPresent(Int.self, forKey: .moveToRelativeTab)
        self.wait = try container.decodeIfPresent(Int.self, forKey: .wait)
        self.waitFor = try container.decodeIfPresent(String.self, forKey: .waitFor)
        self.select = try container.decodeIfPresent(WebScrapeRequestBodyBlockUrlInstructionsItemSelect.self, forKey: .select)
        self.jsExe = try container.decodeIfPresent(String.self, forKey: .jsExe)
        self.conditionalCheck = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .conditionalCheck)
        self.clickButtonByValue = try container.decodeIfPresent(WebScrapeRequestBodyBlockUrlInstructionsItemClickButtonByValue.self, forKey: .clickButtonByValue)
        self.generalImageCaptcha = try container.decodeIfPresent([WebScrapeRequestBodyBlockUrlInstructionsItemGeneralImageCaptchaItem].self, forKey: .generalImageCaptcha)
        self.blockElement = try container.decodeIfPresent([String].self, forKey: .blockElement)
        self.extract = try container.decodeIfPresent([String: String].self, forKey: .extract)
        self.fillImageCaptcha = try container.decodeIfPresent([WebScrapeRequestBodyBlockUrlInstructionsItemFillImageCaptchaItem].self, forKey: .fillImageCaptcha)
        self.switchToIframe = try container.decodeIfPresent(String.self, forKey: .switchToIframe)
        self.switchToParentFrame = try container.decodeIfPresent(Bool.self, forKey: .switchToParentFrame)
        self.resolveAudioCaptcha = try container.decodeIfPresent(WebScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha.self, forKey: .resolveAudioCaptcha)
        self.screenshot = try container.decodeIfPresent(String.self, forKey: .screenshot)
        self.saveimage = try container.decodeIfPresent(String.self, forKey: .saveimage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fill, forKey: .fill)
        try container.encodeIfPresent(self.click, forKey: .click)
        try container.encodeIfPresent(self.clickIfExist, forKey: .clickIfExist)
        try container.encodeIfPresent(self.enter, forKey: .enter)
        try container.encodeIfPresent(self.newTab, forKey: .newTab)
        try container.encodeIfPresent(self.moveToRelativeTab, forKey: .moveToRelativeTab)
        try container.encodeIfPresent(self.wait, forKey: .wait)
        try container.encodeIfPresent(self.waitFor, forKey: .waitFor)
        try container.encodeIfPresent(self.select, forKey: .select)
        try container.encodeIfPresent(self.jsExe, forKey: .jsExe)
        try container.encodeIfPresent(self.conditionalCheck, forKey: .conditionalCheck)
        try container.encodeIfPresent(self.clickButtonByValue, forKey: .clickButtonByValue)
        try container.encodeIfPresent(self.generalImageCaptcha, forKey: .generalImageCaptcha)
        try container.encodeIfPresent(self.blockElement, forKey: .blockElement)
        try container.encodeIfPresent(self.extract, forKey: .extract)
        try container.encodeIfPresent(self.fillImageCaptcha, forKey: .fillImageCaptcha)
        try container.encodeIfPresent(self.switchToIframe, forKey: .switchToIframe)
        try container.encodeIfPresent(self.switchToParentFrame, forKey: .switchToParentFrame)
        try container.encodeIfPresent(self.resolveAudioCaptcha, forKey: .resolveAudioCaptcha)
        try container.encodeIfPresent(self.screenshot, forKey: .screenshot)
        try container.encodeIfPresent(self.saveimage, forKey: .saveimage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fill
        case click
        case clickIfExist
        case enter
        case newTab
        case moveToRelativeTab
        case wait
        case waitFor
        case select
        case jsExe
        case conditionalCheck
        case clickButtonByValue
        case generalImageCaptcha
        case blockElement
        case extract
        case fillImageCaptcha
        case switchToIframe
        case switchToParentFrame
        case resolveAudioCaptcha
        case screenshot
        case saveimage
    }
}