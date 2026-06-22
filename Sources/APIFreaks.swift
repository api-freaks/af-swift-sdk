import Foundation

/// Use this class to access the different functions within the SDK. You can instantiate any number of clients with different configuration that will propagate to these functions.
public final class APIFreaks: Sendable {
    private let httpClient: HTTPClient

    /// Initialize the client with the specified configuration.
    ///
    /// - Parameter baseURL: The base URL to use for requests from the client. If not provided, the default base URL will be used.
    /// - Parameter headers: Additional headers to send with each request.
    /// - Parameter timeout: Request timeout in seconds. Defaults to 60 seconds. Ignored if a custom `urlSession` is provided.
    /// - Parameter maxRetries: Maximum number of retries for failed requests. Defaults to 2.
    /// - Parameter urlSession: Custom `URLSession` to use for requests. If not provided, a default session will be created with the specified timeout.
    public convenience init(
        baseURL: String = APIFreaksEnvironment.default.rawValue,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        self.init(
            baseURL: baseURL,
            headerAuth: nil,
            bearerAuth: nil,
            basicAuth: nil,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
    }

    init(
        baseURL: String,
        headerAuth: ClientConfig.HeaderAuth? = nil,
        bearerAuth: ClientConfig.BearerAuth? = nil,
        basicAuth: ClientConfig.BasicAuth? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        let config = ClientConfig(
            baseURL: baseURL,
            headerAuth: headerAuth,
            bearerAuth: bearerAuth,
            basicAuth: basicAuth,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
        self.httpClient = HTTPClient(config: config)
    }

    /// Get detailed geolocation data for an IP address including country, city, timezone, currency, and optional security and user-agent information
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter ip: IPv4, IPv6, or hostname for geolocation lookup
    /// - Parameter lang: Response language for location fields
    /// - Parameter fields: Comma separated list of fields to include in response
    /// - Parameter excludes: Comma separated list of fields to exclude from response
    /// - Parameter include: Additional data to include (location, network, security, currency, time_zone, user_agent, country_metadata , hostname, liveHostname, hostnameFallbackLivet)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func geolocationLookup(apiKey: String, format: GeolocationLookupRequestFormat? = nil, ip: String? = nil, lang: GeolocationLookupRequestLang? = nil, fields: String? = nil, excludes: String? = nil, include: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GeolocationLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geolocation/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": ip.map { .string($0) }, 
                "lang": lang.map { .string($0.rawValue) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }, 
                "include": include.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GeolocationLookupResponse.self
        )
    }

    /// Retrieve detailed geolocation data for multiple IP addresses in a single request.
    /// Supports up to `50,000` IP-addresses/host-names per request.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter lang: Language of the response.
    /// - Parameter fields: Comma-separated list of fields to include in the response. Can include "geo".
    /// - Parameter excludes: Comma-separated list of fields to exclude from the response (except "ip").
    /// - Parameter include: Comma-separated list of additional information to include in the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkGeolocationLookup(apiKey: String, format: BulkGeolocationLookupRequestFormat? = nil, lang: String? = nil, fields: String? = nil, excludes: String? = nil, include: String? = nil, request: Requests.BulkGeolocationLookupRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkGeolocationLookupResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/geolocation/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "lang": lang.map { .string($0) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }, 
                "include": include.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkGeolocationLookupResponseItem].self
        )
    }

    /// Get comprehensive security information for a given IP address. Detects VPNs, proxies, Tor nodes, and other security threats.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter ip: A valid IPv4 or IPv6 address to look up. If omitted, the API uses the public IP of the requesting client.
    /// - Parameter fields: Comma-separated list of fields to return. Supports dot notation (e.g. security.threat_score).
    /// - Parameter excludes: Comma-separated list of fields to remove from the response. Supports dot notation (e.g. security.is_tor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func ipSecurityLookup(apiKey: String, format: IpSecurityLookupRequestFormat? = nil, ip: String? = nil, fields: String? = nil, excludes: String? = nil, requestOptions: RequestOptions? = nil) async throws -> IpSecurityLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/ip/security",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": ip.map { .string($0) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: IpSecurityLookupResponse.self
        )
    }

    /// The Bulk IP Security Lookup API allows you to retrieve security details for up to `50,000` IP-addresses in a single request.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter fields: Comma-separated list of fields to return. Supports dot notation (e.g. security.threat_score).
    /// - Parameter excludes: Comma-separated list of fields to remove from the response. Supports dot notation (e.g. security.is_tor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkIpSecurityLookup(apiKey: String, format: BulkIpSecurityLookupRequestFormat? = nil, fields: String? = nil, excludes: String? = nil, request: Requests.BulkIpSecurityLookupRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkIpSecurityLookupResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/ip/security",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkIpSecurityLookupResponseItem].self
        )
    }

    /// Convert a given address or place name into geographic coordinates (latitude and longitude).
    ///
    /// - Parameter acceptLanguage: Preferred language order for showing search results. This may either be a simple comma-separated list of language codes or a single entry. The results will be in the 1st language which is matched from the header. As a fallback if the results are not supported in the given language, 'en' will be used.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter query: Free-form search query, e.g. Wembley Stadium, London
    /// - Parameter limit: Max number of results to return (1–40). May return fewer if matches are weak.
    /// - Parameter minLat: Minimum latitude for the viewbox. Must be ≤ max_lat and between -90 and 90.
    /// - Parameter maxLat: Maximum latitude for the viewbox. Must be ≥ min_lat and between -90 and 90.
    /// - Parameter minLon: Minimum longitude for the viewbox. Must be ≤ max_lon and between -180 and 180.
    /// - Parameter maxLon: Maximum longitude for the viewbox. Must be ≥ min_lon and between -180 and 180.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func geocoderSearch(acceptLanguage: String? = nil, apiKey: String, format: GeocoderSearchRequestFormat? = nil, query: String, limit: Int? = nil, minLat: Float? = nil, maxLat: Float? = nil, minLon: Float? = nil, maxLon: Float? = nil, requestOptions: RequestOptions? = nil) async throws -> [GeocoderSearchResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geocoder/search",
            headers: [
                "Accept-Language": acceptLanguage
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "query": .string(query), 
                "limit": limit.map { .int($0) }, 
                "min_lat": minLat.map { .float($0) }, 
                "max_lat": maxLat.map { .float($0) }, 
                "min_lon": minLon.map { .float($0) }, 
                "max_lon": maxLon.map { .float($0) }
            ],
            requestOptions: requestOptions,
            responseType: [GeocoderSearchResponseItem].self
        )
    }

    /// Convert geographic coordinates (latitude and longitude) into a human-readable address or place name.
    ///
    /// - Parameter acceptLanguage: Preferred language order for showing search results. This may either be a simple comma-separated list of language codes or a single entry. The results will be in the 1st language which is matched from the header. As a fallback if the results are not supported in the given language, en will be used.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter lat: WGS84 latitude value ranging from -90 to 90.
    /// - Parameter lon: WGS84 longitude value ranging from -180 to 180.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func geocoderReverse(acceptLanguage: String? = nil, apiKey: String, format: GeocoderReverseRequestFormat? = nil, lat: Double, lon: Double, requestOptions: RequestOptions? = nil) async throws -> GeocoderReverseResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geocoder/reverse",
            headers: [
                "Accept-Language": acceptLanguage
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "lat": .double(lat), 
                "lon": .double(lon)
            ],
            requestOptions: requestOptions,
            responseType: GeocoderReverseResponse.self
        )
    }

    /// Retrieve current WHOIS information for a domain name.
    /// This endpoint provides detailed registration information including registrar details,
    /// dates, nameservers, and registrant information.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format (defaults to json)
    /// - Parameter domainName: Domain name for WHOIS lookup
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainWhoisLookup(apiKey: String, format: DomainWhoisLookupRequestFormat? = nil, domainName: String, requestOptions: RequestOptions? = nil) async throws -> DomainWhoisLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName)
            ],
            requestOptions: requestOptions,
            responseType: DomainWhoisLookupResponse.self
        )
    }

    /// Retrieve WHOIS information for `100 Domains per Request`.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkDomainWhoisLookup(apiKey: String, format: BulkDomainWhoisLookupRequestFormat? = nil, request: Requests.BulkDomainWhoisLookupRequest, requestOptions: RequestOptions? = nil) async throws -> BulkDomainWhoisLookupResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/domain/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkDomainWhoisLookupResponse.self
        )
    }

    /// Returns WHOIS registration details for a specified IP address (IPv4 or IPv6).
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter ip: The IP address (IPv4 or IPv6) for which WHOIS data is requested.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func ipWhoisLookup(apiKey: String, format: IpWhoisLookupRequestFormat? = nil, ip: String, requestOptions: RequestOptions? = nil) async throws -> IpWhoisLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/ip/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": .string(ip)
            ],
            requestOptions: requestOptions,
            responseType: IpWhoisLookupResponse.self
        )
    }

    /// Returns WHOIS registration details for a specified ASN, with or without the 'as' prefix.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter asn: The Autonomous System Number (ASN) to retrieve WHOIS data for. Can be prefixed with 'as' or not.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func asnWhoisLookup(apiKey: String, format: AsnWhoisLookupRequestFormat? = nil, asn: String, requestOptions: RequestOptions? = nil) async throws -> AsnWhoisLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/asn/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "asn": .string(asn)
            ],
            requestOptions: requestOptions,
            responseType: AsnWhoisLookupResponse.self
        )
    }

    /// Retrieve historical WHOIS records for a domain name.
    /// This endpoint provides a timeline of all recorded changes in domain registration information.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domainName: Domain name for historical WHOIS lookup
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainWhoisHistory(apiKey: String, format: DomainWhoisHistoryRequestFormat? = nil, domainName: String, requestOptions: RequestOptions? = nil) async throws -> DomainWhoisHistoryResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/whois/history",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName)
            ],
            requestOptions: requestOptions,
            responseType: DomainWhoisHistoryResponse.self
        )
    }

    /// Performs a reverse WHOIS search using one or more search parameters like keyword, email, owner, or company.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter keyword: Keyword search term for reverse WHOIS by keyword (case-insensitive pattern matching).
    /// - Parameter email: Email search term for reverse WHOIS by email address (case-insensitive exact or regex match; * wildcard supported).
    /// - Parameter owner: Registrant or owner name for reverse WHOIS (a full-text search phrase matching technique to retrieve results).
    /// - Parameter company: Organization or company name for reverse WHOIS (full-text search phrase matching technique to retrieve results).
    /// - Parameter exact: Accepts 'true' or 'false'. "true" returns only records that exactly match the input (keyword, owner/registrant, or company). "false" returns all matches and is the default when omitted.
    /// - Parameter page: Page number for paginated results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainWhoisReverse(apiKey: String, format: DomainWhoisReverseRequestFormat? = nil, keyword: String? = nil, email: String? = nil, owner: String? = nil, company: String? = nil, exact: Bool? = nil, mode: DomainWhoisReverseRequestMode? = nil, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainWhoisReverseResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/whois/reverse",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "keyword": keyword.map { .string($0) }, 
                "email": email.map { .string($0) }, 
                "owner": owner.map { .string($0) }, 
                "company": company.map { .string($0) }, 
                "exact": exact.map { .bool($0) }, 
                "mode": mode.map { .string($0.rawValue) }, 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainWhoisReverseResponse.self
        )
    }

    /// Retrieve real-time DNS records for any hostname. Supports multiple record types including A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME records.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter hostName: Hostname or URL whose DNS records are required.
    /// - Parameter ipAddress: The IP address for requested DNS's PTR record. 'type' parameter must be set to 'all'.
    /// - Parameter type: A comma-separated list of DNS record types for lookup. Possible values: A, AAAA, MX, NS, SOA, SPF, TXT, CNAME, or all. When ipAddress is provided, type must be "all".
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainDnsLookup(apiKey: String, format: DomainDnsLookupRequestFormat? = nil, hostName: String? = nil, ipAddress: String? = nil, type: String, requestOptions: RequestOptions? = nil) async throws -> DomainDnsLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/dns/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "host-name": hostName.map { .string($0) }, 
                "ipAddress": ipAddress.map { .string($0) },
                "type": .string(type)
            ],
            requestOptions: requestOptions,
            responseType: DomainDnsLookupResponse.self
        )
    }

    /// Perform DNS lookups for multiple hostnames in a single request. Supports up to `100 host-names per request`
    /// and returns DNS records including A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME records.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter type: A comma-separated list of DNS record types for lookup.
    /// Possible values: A, AAAA, MX, NS, SOA, SPF, TXT, CNAME, or all
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkDomainDnsLookup(apiKey: String, format: BulkDomainDnsLookupRequestFormat? = nil, type: String, request: Requests.BulkDomainDnsLookupRequest, requestOptions: RequestOptions? = nil) async throws -> BulkDomainDnsLookupResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/domain/dns/live",
            queryParams: [
                "apiKey": .string(apiKey),
                "format": format.map { .string($0.rawValue) },
                "type": .string(type)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkDomainDnsLookupResponse.self
        )
    }

    /// Retrieve historical DNS records for any hostname. Access unique historical data for A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME records,
    /// including subdomains. Results are paginated with up to 100 unique records per page.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter hostName: Hostname or URL whose historical DNS records are required
    /// - Parameter type: A comma-separated list of DNS record types for lookup.
    /// Possible values: A, AAAA, MX, NS, SOA, SPF, TXT, CNAME, or all
    /// - Parameter page: Page number for paginated results
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainDnsHistory(apiKey: String, format: DomainDnsHistoryRequestFormat? = nil, hostName: String, type: String, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainDnsHistoryResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/dns/history",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "host-name": .string(hostName),
                "type": .string(type),
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainDnsHistoryResponse.self
        )
    }

    /// Retrieve all the hostnames associated with any particular A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME DNS records. For instance, you can access all the hostnames hosted on any IP/CIDR notation, all the domain names using Cloudflare name servers, and all the domain names using Google Mailbox
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter type: The type of reverse DNS lookup to perform. Determines how the value parameter is interpreted:
    /// - A: IPv4 CIDR block
    /// - AAAA: IPv6 CIDR block
    /// - MX: Mail provider domain
    /// - NS: Name server provider hostname
    /// - SOA: SOA record admin domain
    /// - SPF/TXT: Target verification strings
    /// - CNAME: Target hostname
    /// - Parameter value: Provide an IP or CIDR for A/AAAA lookups, or a hostname/selector for MX, NS, SOA, SPF, TXT, and CNAME queries. Wildcard regex patterns are also supported (e.g., mail.google.com, m*.google.com, _spf.g*.com, s*.g*.com).
    /// - Parameter exact: Accepts 'true' or 'false'. "true" returns only records that exactly match the input (NS, MX, CNAME, SOA, SPF, TXT). "false" returns all matches (default when omitted).
    /// - Parameter page: Page number to paginate through results (defaults to 1).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainDnsReverse(apiKey: String, format: DomainDnsReverseRequestFormat? = nil, type: DomainDnsReverseRequestType, value: String, exact: Bool? = nil, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainDnsReverseResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/dns/reverse",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "type": .string(type.rawValue), 
                "value": .string(value), 
                "exact": exact.map { .bool($0) }, 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainDnsReverseResponse.self
        )
    }

    /// Execute a series of web scraping instructions on a target URL. 
    /// Supports various operations like form filling, clicking, data extraction, and CAPTCHA solving.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter url: Target URL to scrape
    /// - Parameter text: Set to `true` to return the data in text format else `false` for data in html format with tags.
    /// - Parameter jsEnabled: Set  `true` to handle websites with JavaScript. Set `false` to handle static html websites.
    /// 
    /// 
    ///  Default value is `true`.
    /// - Parameter proxy: Use proxy for requests
    /// - Parameter sslIgnore: Ignore SSL certificate errors.
    /// 
    /// 
    ///  Only works if **jsEnabled** is **true**.
    /// - Parameter windowSize: Specify the browser window size in the format 'width,height' (e.g., "1920w,1080h"). Default value is the default resolutions provided by web/browser.
    /// 
    /// 
    ///  Only works if **jsEnabled** is **true**.
    /// - Parameter adBlock: Set to `true` to apply ad-blocker to the specified URL else false or ignore to not apply.
    /// 
    /// 
    ///  Only works if **jsEnabled** is **true**.
    /// - Parameter captcha: if true user can provide captcha instructions in the instructions to solve image captchas.
    /// 
    /// 
    ///   Only works if **jsEnabled** is **true**.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func webScrape(apiKey: String, format: WebScrapeRequestFormat? = nil, url: String, text: Bool? = nil, jsEnabled: Bool? = nil, proxy: WebScrapeRequestProxy? = nil, sslIgnore: Bool? = nil, windowSize: String? = nil, adBlock: Bool? = nil, captcha: Bool? = nil, request: WebScrapeRequestBody, requestOptions: RequestOptions? = nil) async throws -> WebScrapeResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/scraping",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "url": .string(url), 
                "text": text.map { .bool($0) }, 
                "jsEnabled": jsEnabled.map { .bool($0) }, 
                "proxy": proxy.map { .unknown($0) }, 
                "sslIgnore": sslIgnore.map { .bool($0) }, 
                "windowSize": windowSize.map { .string($0) }, 
                "adBlock": adBlock.map { .bool($0) }, 
                "captcha": captcha.map { .bool($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: WebScrapeResponse.self
        )
    }

    /// Validates a single email address and returns result.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func emailValidate(apiKey: String, format: EmailValidateRequestFormat? = nil, request: Requests.EmailValidateRequest, requestOptions: RequestOptions? = nil) async throws -> EmailValidateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/email-validation/single",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: EmailValidateResponse.self
        )
    }

    /// Validates a bulk of email addresses and returns result for each. Maximum `10` email addresses per request.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkEmailValidate(apiKey: String, format: BulkEmailValidateRequestFormat? = nil, request: Requests.BulkEmailValidateRequest, requestOptions: RequestOptions? = nil) async throws -> BulkEmailValidateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/email-validation/bulk",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkEmailValidateResponse.self
        )
    }

    /// Validates a single phone number and returns detailed metadata including carrier, line type, geolocation, time zones, and standardized formats.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object. If not provided, the API defaults to JSON format.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func phoneValidate(apiKey: String, format: PhoneValidateRequestFormat? = nil, request: Requests.PhoneValidateRequest, requestOptions: RequestOptions? = nil) async throws -> PhoneValidateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/phone/validation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: PhoneValidateResponse.self
        )
    }

    /// Validates up to 100 phone numbers in a single request. Each number is processed independently — invalid entries return per-number errors without affecting the rest of the batch.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object. If not provided, the API defaults to JSON format.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkPhoneValidate(apiKey: String, format: BulkPhoneValidateRequestFormat? = nil, request: Requests.BulkPhoneValidateRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkPhoneValidateResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/phone/validation/bulk",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkPhoneValidateResponseItem].self
        )
    }

    /// Retrieve comprehensive SSL certificate information without the certificate chain.
    /// This endpoint provides detailed information about the SSL certificate including expiry dates, issuer details, and encryption methods.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domainName: Domain name or URL whose SSL certificate lookup is required
    /// - Parameter sslRaw: Set to true to get the raw openSSL response of the domain
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainSslLookup(apiKey: String, format: DomainSslLookupRequestFormat? = nil, domainName: String, sslRaw: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainSslLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/ssl/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName), 
                "sslRaw": sslRaw.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainSslLookupResponse.self
        )
    }

    /// Retrieve the complete SSL certificate chain from root Certificate Authority (CA) to end-user certificate.
    /// This endpoint provides comprehensive information about each certificate in the chain.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domainName: Domain name or URL whose SSL certificate chain lookup is required
    /// - Parameter sslRaw: Set to true to get the raw openSSL response for each certificate in the chain
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainSslChainLookup(apiKey: String, format: DomainSslChainLookupRequestFormat? = nil, domainName: String, sslRaw: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainSslChainLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/ssl/live/chain",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName), 
                "sslRaw": sslRaw.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainSslChainLookupResponse.self
        )
    }

    /// The Domain Search API is designed to simplify the process of finding available domain names across all top-level domains (TLDs) and second-level domains (SLDs).
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domain: Domain name whose availability is to be checked.
    /// - Parameter source: Specify the data source for domain availability checks. Use "dns" for DNS-based lookups or "whois" for WHOIS-based lookups. By default, "dns" is used.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainAvailabilityCheck(apiKey: String, format: DomainAvailabilityCheckRequestFormat? = nil, domain: String, source: DomainAvailabilityCheckRequestSource? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainAvailabilityCheckResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/availability",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domain": .string(domain), 
                "source": source.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: DomainAvailabilityCheckResponse.self
        )
    }

    /// Perform Bulk Domain Availability checks using a list of domains. Supports upto `100 Domains Per Request`.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter source: Specify the data source for domain availability checks. Use "dns" for DNS-based lookups or "whois" for WHOIS-based lookups. By default, "dns" is used.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkDomainAvailabilityCheck(apiKey: String, format: BulkDomainAvailabilityCheckRequestFormat? = nil, source: BulkDomainAvailabilityCheckRequestSource? = nil, request: Requests.BulkDomainAvailabilityCheckRequest, requestOptions: RequestOptions? = nil) async throws -> BulkDomainAvailabilityCheckResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/domain/availability",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "source": source.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkDomainAvailabilityCheckResponse.self
        )
    }

    /// The Domain Search API is designed to simplify the process of finding available domain names across all top-level domains (TLDs) and second-level domains (SLDs).
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domain: Domain name for availability and suggestions.
    /// - Parameter source: Specify the data source for domain availability checks. Use "dns" for DNS-based lookups or "whois" for WHOIS-based lookups. By default, "dns" is used.
    /// - Parameter count: Number of suggestions to retrieve.
    /// - Parameter sug: Whether to include name suggestions in the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainAvailabilitySuggestions(apiKey: String, format: DomainAvailabilitySuggestionsRequestFormat? = nil, domain: String, source: DomainAvailabilitySuggestionsRequestSource? = nil, count: Int? = nil, sug: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainAvailabilitySuggestionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/availability/suggestions",
            queryParams: [
                "apiKey": .string(apiKey),
                "format": format.map { .string($0.rawValue) },
                "domain": .string(domain),
                "source": source.map { .string($0.rawValue) },
                "count": count.map { .int($0) },
                "sug": sug.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainAvailabilitySuggestionsResponse.self
        )
    }

    /// The Subdomain Lookup API is designed to retrieve subdomains related to the given domain name. It helps you explore subdomains that are available for registration or usage.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domain: Domain name for availability and suggestions.
    /// - Parameter after: Filter subdomains seen after this date (format YYYY-MM-DD).
    /// - Parameter before: Filter subdomains seen before this date( format YYYY-MM-DD).
    /// - Parameter status: Filter subdomains by status (active or inactive).
    /// - Parameter page: Page number for paginated results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func subdomainsLookup(apiKey: String, format: SubdomainsLookupRequestFormat? = nil, domain: String, after: CalendarDate? = nil, before: CalendarDate? = nil, status: SubdomainsLookupRequestStatus? = nil, page: String? = nil, requestOptions: RequestOptions? = nil) async throws -> SubdomainsLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/subdomains/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domain": .string(domain), 
                "after": after.map { .calendarDate($0) }, 
                "before": before.map { .calendarDate($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "page": page.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: SubdomainsLookupResponse.self
        )
    }

    /// This API merges multiple PDF files into a single PDF, in the order they are provided
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: An array of unique file IDs referencing PDF files previously uploaded to the API Freaks server. Use this parameter to merge existing files without re-uploading them. Provide multiple IDs to merge files in the specified order.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: Specifies the desired name for the resulting merged PDF file. If not provided, a default name will be assigned.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfMerge(webhookAuthorization: String? = nil, apiKey: String, format: PdfMergeRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfMergeRequest, requestOptions: RequestOptions? = nil) async throws -> PdfMergeResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/merge",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfMergeResponse.self
        )
    }

    /// This API removes a selection or range of pages from a PDF file.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique identifier of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output PDF file after pages have been removed. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies which pages to remove from the PDF. Accepts individual page numbers (e.g., '1,7') and/or ascending page ranges (e.g., '3-5'). Use commas to separate entries and hyphens for ranges. Reverse ranges (e.g., '5-3') are not allowed. Alternatively, you may provide only one of the following keywords: 'even' (removes all even-numbered pages), 'odd' (removes all odd-numbered pages), or 'last' (removes only the last page). The keyword 'all' is not supported for this operation. Examples: '1,3-5', 'even'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfRemovePages(webhookAuthorization: String? = nil, apiKey: String, format: PdfRemovePagesRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfRemovePagesRequest, requestOptions: RequestOptions? = nil) async throws -> PdfRemovePagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/remove-pages",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": .string(pages), 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfRemovePagesResponse.self
        )
    }

    /// This API splits a PDF into multiple parts based on specified page numbers or ranges.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired base name for the output PDF files after splitting. If not provided, a default naming convention will be used.
    /// - Parameter pages: Defines the page numbers or ranges where the PDF should be split. Provide individual pages and/or ranges in any order (for example: "1-4,9-5,16-last"). Separate entries with commas and use hyphens for ranges.
    /// 
    /// Special keywords (use alone):
    /// 
    /// • `even` — split at every even-numbered page
    /// 
    /// • `odd` — split at every odd-numbered page
    /// 
    /// • `all` — split the PDF into single-page files
    /// 
    /// The keyword `last` can be used anywhere in the string, in combination with page numbers or ranges (for example: "5-last", "last-2", "1,last,9").
    /// 
    /// Examples:
    /// - "1,4-2,last"
    /// - "odd"
    /// - "all"
    /// - "last,2-5"
    /// 
    /// Invalid example: "1,odd" (mixing a keyword other than "last" with specific pages/ranges is not allowed). You can pass multiple pages entries to produce multiple output files.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfSplit(webhookAuthorization: String? = nil, apiKey: String, format: PdfSplitRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfSplitRequest, requestOptions: RequestOptions? = nil) async throws -> PdfSplitResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/split",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfSplitResponse.self
        )
    }

    /// This API rotates pages of a PDF by a specified angle (in multiples of 90 degrees).
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output PDF file after rotation. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies which pages to rotate. Accepts individual page numbers (e.g., '1,7') and/or ascending page ranges (e.g., '3-5'). Use commas to separate entries and hyphens for ranges. Reverse ranges (e.g., '5-3') are not allowed. Alternatively, provide only one of the following keywords: 'even' (rotate all even-numbered pages), 'odd' (rotate all odd-numbered pages), 'last' (rotate only the last page), or 'all' (rotate all pages). Examples: '1,3-5', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter rotate: The angle in degrees to rotate the selected pages. Must be one of the following values: 0, 90, 180, 270, -90, -180, or -270. All rotations are applied clockwise.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfRotate(webhookAuthorization: String? = nil, apiKey: String, format: PdfRotateRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, rotate: Int, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfRotateRequest, requestOptions: RequestOptions? = nil) async throws -> PdfRotateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/rotate",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "rotate": .int(rotate), 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfRotateResponse.self
        )
    }

    /// This API compresses a given PDF file to reduce its file size.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file.
    /// - Parameter output: Name of the output PDF.
    /// - Parameter compressionLevel: Controls how aggressively the PDF is compressed. Lower levels preserve more quality, while higher levels reduce file size more.
    /// - Parameter destroy: If set to true, the input file(s) will be deleted from the server immediately after the output is generated.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfCompress(webhookAuthorization: String? = nil, apiKey: String, format: PdfCompressRequestFormat? = nil, fileId: String? = nil, output: String? = nil, compressionLevel: PdfCompressRequestCompressionLevel, destroy: Bool? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfCompressRequest, requestOptions: RequestOptions? = nil) async throws -> PdfCompressResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/compress",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "output": output.map { .string($0) }, 
                "compression_level": .string(compressionLevel.rawValue), 
                "destroy": destroy.map { .bool($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfCompressResponse.self
        )
    }

    /// This API extracts specific pages or page ranges from a PDF file and returns them as a new PDF.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output PDF file after pages have been extracted. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies which pages to extract from the PDF. You can provide individual page numbers (e.g., '2') and/or page ranges in any order, including descending (e.g., '9-5', '16-last'). Use commas to separate entries and hyphens for ranges. You may alternatively pass only one of the special keywords: 'even' (extracts all even-numbered pages), 'odd' (extracts all odd-numbered pages), 'last' (extracts only the last page), or 'all' (extracts all pages into individual files). Examples: '2,6-3', 'even', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter separated: If set to `true`, each of the specified pages will be extracted and returned as a separate PDF file.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfExtractPages(webhookAuthorization: String? = nil, apiKey: String, format: PdfExtractPagesRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String, separated: Bool? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfExtractPagesRequest, requestOptions: RequestOptions? = nil) async throws -> PdfExtractPagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/extract-pages",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": .string(pages), 
                "separated": separated.map { .bool($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfExtractPagesResponse.self
        )
    }

    /// API endpoint that linearizes any given PDF, restructuring it for faster loading and page-by-page viewing in web browsers.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output PDF file after pages have been extracted. If not provided, a default name will be assigned.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfLinearize(webhookAuthorization: String? = nil, apiKey: String, format: PdfLinearizeRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfLinearizeRequest, requestOptions: RequestOptions? = nil) async throws -> PdfLinearizeResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/linearize",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfLinearizeResponse.self
        )
    }

    /// This API encrypts a PDF file by setting a password required to open it.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output encrypted PDF file. If not provided, a default name will be assigned.
    /// - Parameter filePassword: The password to unlock the input file if it is already protected. Either the owner password or user password can be provided. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    /// - Parameter userPassword: Sets the user password required to open and view the encrypted PDF file. Password Length should be between 6 and 128 characters.
    /// - Parameter ownerPassword: Sets the owner password for the PDF file. This password provides full access, including the ability to remove restrictions. If not provided, the `user_password` will also be used as the owner password. Password Length should be between 6 and 128 characters.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfEncrypt(webhookAuthorization: String? = nil, apiKey: String, format: PdfEncryptRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, filePassword: String? = nil, userPassword: String, ownerPassword: String? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfEncryptRequest, requestOptions: RequestOptions? = nil) async throws -> PdfEncryptResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/encrypt",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "file_password": filePassword.map { .string($0) }, 
                "user_password": .string(userPassword), 
                "owner_password": ownerPassword.map { .string($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfEncryptResponse.self
        )
    }

    /// This API decrypts PDF files, removing all encryption, including open passwords and permission restrictions.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output decrypted PDF file. If not provided, a default name will be assigned.
    /// - Parameter filePassword: The password to unlock the input file if it is protected. Either the owner password or user password can be provided. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfDecrypt(webhookAuthorization: String? = nil, apiKey: String, format: PdfDecryptRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, filePassword: String, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfDecryptRequest, requestOptions: RequestOptions? = nil) async throws -> PdfDecryptResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/decrypt",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "file_password": .string(filePassword), 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfDecryptResponse.self
        )
    }

    /// This API applies permission restrictions on a PDF file, such as disabling printing, copying, or editing. This can include password protection to enforce restrictions.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output restricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter filePassword: The password to unlock the input file if it is already secured. Provide the owner password if available; otherwise, the user password. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    /// - Parameter userPassword: Sets the password users will use to open the PDF. If this is not set, only the owner password will be configured, and anyone can open the PDF file with the provided restrictions enabled. Password Length should be between 6 and 128 characters.
    /// - Parameter ownerPassword: Sets the password that allows full access to the PDF (e.g., removing restrictions). If not provided, the `user_password` (if set) will also be used as the owner password. Password Length should be between 6 and 128 characters.
    /// - Parameter restrictions: A comma-separated list of restrictions to apply to the PDF. These define what the end-user is *not* allowed to do with the PDF. Available options are:
    /// 
    /// 
    /// * **print_high** – Disables high-quality printing.
    /// * **print_low** – Disables low-resolution printing.
    /// * **edit_document_assembly** – Prevents reordering or inserting pages.
    /// * **fill_form_fields** – Disallows filling in PDF form fields.
    /// * **edit_annotations** – Disables adding or modifying annotations or comments.
    /// * **modify_content** – Prevents modifying existing content in the PDF.
    /// * **copy_and_extract_content** – Disables copying text or images from the PDF.
    /// * **use_accessibility** – Prevents screen readers or accessibility tools from accessing content.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfRestrict(webhookAuthorization: String? = nil, apiKey: String, format: PdfRestrictRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, filePassword: String? = nil, userPassword: String, ownerPassword: String? = nil, restrictions: PdfRestrictRequestRestrictionsItem? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfRestrictRequest, requestOptions: RequestOptions? = nil) async throws -> PdfRestrictResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/restrict",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "file_password": filePassword.map { .string($0) }, 
                "user_password": .string(userPassword), 
                "owner_password": ownerPassword.map { .string($0) }, 
                "restrictions": restrictions.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfRestrictResponse.self
        )
    }

    /// This API removes permission restrictions from a PDF while keeping it encrypted. If you want to remove all security (including encryption), use the `/pdf/decrypt` endpoint instead.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter filePassword: The password to unlock the input file. Either the owner password or user password can be provided. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    /// - Parameter userPassword: Sets the user password for the PDF file. Password Length should be between 6 and 128 characters.
    /// - Parameter ownerPassword: Sets the owner password for the PDF file. If the owner password is not provided, the `user_password` will also be used as the owner password. Password Length should be between 6 and 128 characters.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfUnrestrict(webhookAuthorization: String? = nil, apiKey: String, format: PdfUnrestrictRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, filePassword: String, userPassword: String? = nil, ownerPassword: String? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfUnrestrictRequest, requestOptions: RequestOptions? = nil) async throws -> PdfUnrestrictResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/unrestrict",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "file_password": .string(filePassword), 
                "user_password": userPassword.map { .string($0) }, 
                "owner_password": ownerPassword.map { .string($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfUnrestrictResponse.self
        )
    }

    /// This API converts a given PDF file into a sequence of PNG images.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToPng(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToPngRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToPngRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToPngRequest, requestOptions: RequestOptions? = nil) async throws -> PdfConvertToPngResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/png",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToPngResponse.self
        )
    }

    /// This API converts a given PDF file into a sequence of JPG images.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter quality: Controls JPG compression quality. Higher values yield sharper images with larger file sizes.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToJpg(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToJpgRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, quality: Int? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToJpgRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToJpgRequest, requestOptions: RequestOptions? = nil) async throws -> PdfConvertToJpgResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/jpg",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "quality": quality.map { .int($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToJpgResponse.self
        )
    }

    /// This API converts a given PDF file into a sequence of TIFF images. The output images can be saved as a single TIFF file, or as a sequence of TIFF files.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToTiff(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToTiffRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToTiffRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToTiffRequest, requestOptions: RequestOptions? = nil) async throws -> PdfConvertToTiffResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/tif",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToTiffResponse.self
        )
    }

    /// Converts a PDF file to a BMP image.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToBmp(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToBmpRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToBmpRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToBmpRequest, requestOptions: RequestOptions? = nil) async throws -> PdfConvertToBmpResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/bmp",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToBmpResponse.self
        )
    }

    /// This API converts a given PDF file into a sequence of GIF images.
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToGif(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToGifRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToGifRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToGifRequest, requestOptions: RequestOptions? = nil) async throws -> PdfConvertToGifResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/gif",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToGifResponse.self
        )
    }

    /// This API uploads multiple PDF files to the API Freaks server and generates their unique file IDs.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfUploadResources(apiKey: String, format: PdfUploadResourcesRequestFormat? = nil, request: Requests.PdfUploadResourcesRequest, requestOptions: RequestOptions? = nil) async throws -> PdfUploadResourcesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/resource/upload",
            contentType: .multipartFormData,
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfUploadResourcesResponse.self
        )
    }

    /// This API uploads PDF files to the API Freaks server in binary format.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileName: The desired name for the uploaded PDF file. This name will be used for storage on the server.
    /// 
    /// 
    ///  **NOTE**: Please ensure file_name has extension `.pdf`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfUploadBinary(apiKey: String, format: PdfUploadBinaryRequestFormat? = nil, fileName: String, request: Data, requestOptions: RequestOptions? = nil) async throws -> PdfUploadBinaryResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/resource/upload-binary",
            contentType: .applicationOctetStream,
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_name": .string(fileName)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: PdfUploadBinaryResponse.self
        )
    }

    /// This API downloads PDF files or ZIP archives from the server using their unique resource ID.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter resourceId: The unique identifier of the file or ZIP archive to download.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfDownloadResource(apiKey: String, format: PdfDownloadResourceRequestFormat? = nil, resourceId: String, requestOptions: RequestOptions? = nil) async throws -> Data {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/pdf/resource/download",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "resource_id": .string(resourceId)
            ],
            requestOptions: requestOptions,
            responseType: Data.self
        )
    }

    /// This API checks the status of a previously initiated PDF processing task using its unique task ID.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter taskId: The unique ID of the PDF processing task for which the status is requested.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfGetTaskStatus(apiKey: String, format: PdfGetTaskStatusRequestFormat? = nil, taskId: String, requestOptions: RequestOptions? = nil) async throws -> PdfGetTaskStatusResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/pdf/task-status",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "task_id": .string(taskId)
            ],
            requestOptions: requestOptions,
            responseType: PdfGetTaskStatusResponse.self
        )
    }

    /// This API checks the status of a PDF file using its unique file ID, providing information about its creation and potential deletion time.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of the file whose status is requested.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfGetFileStatus(apiKey: String, format: PdfGetFileStatusRequestFormat? = nil, fileId: String, requestOptions: RequestOptions? = nil) async throws -> PdfGetFileStatusResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/pdf/file-status",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": .string(fileId)
            ],
            requestOptions: requestOptions,
            responseType: PdfGetFileStatusResponse.self
        )
    }

    /// This API retrieves a list of all PDF files uploaded and generated by a specific user. Please note that if the user is part of an organization, only the Organization Administrator can access this endpoint. Organization Members cannot access this endpoint.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfListFiles(apiKey: String, format: PdfListFilesRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> PdfListFilesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/pdf/files",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: PdfListFilesResponse.self
        )
    }

    /// This API deletes a PDF file using its unique file ID.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of the file to be deleted.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfDeleteFile(apiKey: String, format: PdfDeleteFileRequestFormat? = nil, fileId: String, requestOptions: RequestOptions? = nil) async throws -> PdfDeleteFileResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1.0/pdf/file",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": .string(fileId)
            ],
            requestOptions: requestOptions,
            responseType: PdfDeleteFileResponse.self
        )
    }

    /// Capture full-page screenshots and videos of websites with advanced options like device simulation, custom code injection, cookie banner blocking, and scrollable content recording.
    /// Supports multiple output formats including JSON, image, GIF, MP4, and WebM.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter output: Output format for screenshot results
    /// - Parameter fileType: File type for screenshot output
    /// - Parameter url: URLs to capture screenshots of
    /// - Parameter width: Browser viewport width in pixels
    /// - Parameter height: Browser viewport height in pixels
    /// - Parameter fullPage: Capture a full-page screenshot
    /// - Parameter fresh: Bypass cache and take a fresh screenshot
    /// - Parameter noCookieBanners: Remove cookie banners from the screenshot
    /// - Parameter enableCaching: Enable caching for repeated requests
    /// - Parameter blockAds: Block advertisements on the page
    /// - Parameter blockChatWidgets: Block chat widget scripts from loading
    /// - Parameter extractText: Extract visible text from the page
    /// - Parameter extractHtml: Extract HTML content of the page
    /// - Parameter destroyScreenshot: Auto-destroy screenshot after fetch
    /// - Parameter lazyLoad: Enable lazy-loading content before screenshot
    /// - Parameter retina: Capture screenshot in high-DPI (Retina) mode
    /// - Parameter darkMode: Render page in dark mode
    /// - Parameter blockTracking: Block common user-tracking scripts
    /// - Parameter enableIncognito: Enable private/incognito mode for browser session
    /// - Parameter omitBackground: Omit background color (transparent background)
    /// - Parameter thumbnailWidth: Thumbnail width in pixels
    /// - Parameter adjustTop: Adjust top in pixels
    /// - Parameter waitForEvent: Wait for a specific load event before capturing the screenshot.
    /// - Parameter grayscale: Range:0 to 100 for grayscale filter
    /// - Parameter delay: How many milliseconds to wait before taking the screenshot
    /// - Parameter timeout: Maximum timeout in milliseconds. Defalut is `10,000`
    /// - Parameter ttl: Number of seconds the screenshot should be cached
    /// - Parameter clipX: X position of the clipping rectangle in pixels
    /// - Parameter clipY: Y position of the clipping rectangle in pixels
    /// - Parameter clipWidth: Width of the clipping rectangle in pixels
    /// - Parameter clipHeight: Height of the clipping rectangle in pixels
    /// - Parameter cssUrl: URL to CSS file
    /// - Parameter css: Your custom CSS code
    /// - Parameter jsUrl: URL to JS file
    /// - Parameter js: Your JS code
    /// - Parameter blockJs: Block Scripts
    /// - Parameter blockStylesheets: Block Stylesheets
    /// - Parameter blockImages: Block Images
    /// - Parameter blockMedia: Block Media
    /// - Parameter blockFont: Block Fonts
    /// - Parameter blockTextTrack: Block Text Tracks
    /// - Parameter blockXhr: Block XHR Requests
    /// - Parameter blockFetch: Block Fetch Requests
    /// - Parameter blockEventSource: Block Event Source
    /// - Parameter blockWebSocket: Block Web Sockets
    /// - Parameter blockManifest: Block Manifest
    /// - Parameter blockSpecificRequests: Comma- or newline-separated list of specific requests to block. Each line and comma are treated as separate requests for processing. Example: https://example.com, https://example.js
    /// - Parameter blurSelector: Comma-separated list of indexed CSS selectors to blur.
    /// Format: `index:<selector>`, e.g., `0:.banner,1:#ads`.
    /// - Parameter removeSelector: Comma-separated list of indexed CSS selectors to blur.
    /// Format: `index:<selector>`, e.g., `0:.banner,1:#ads`.
    /// - Parameter resultFileName: Specify a meaningful & unique file name to easily identify the screenshot result.
    /// Avoid using spaces or special characters; use hyphens or underscores to separate words.
    /// - Parameter scrollingScreenshot: **`Scrolling Screenshot`**: Capture a long scrolling screenshot. When true, disable `fullPage` and `freshScreenshot`.
    /// - Parameter scrollSpeed: Speed of scrolling during the screenshot.
    /// - Parameter scrollBack: If true, the scroll will reverse back to the top after reaching the bottom.
    /// - Parameter startImmediately: If true, the scrolling capture will start immediately upon page load.
    /// - Parameter multipleScrolling: If true, multiple scrolling screenshots will be taken at different viewport sizes.
    /// - Parameter sizes: Comma-separated list of viewport sizes in the format index:XXw:YYh. Example: sizes=0:120w:300h,1:240w:500h
    /// - Parameter duration: Duration in seconds for the scrolling capture. Acceptable range: 0 to 100 seconds.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func screenshotCapture(apiKey: String, output: ScreenshotCaptureRequestOutput? = nil, fileType: ScreenshotCaptureRequestFileType? = nil, url: String, width: Int? = nil, height: Int? = nil, fullPage: Bool? = nil, fresh: Bool? = nil, noCookieBanners: Bool? = nil, enableCaching: Bool? = nil, blockAds: Bool? = nil, blockChatWidgets: Bool? = nil, extractText: Bool? = nil, extractHtml: Bool? = nil, destroyScreenshot: Bool? = nil, lazyLoad: Bool? = nil, retina: Bool? = nil, darkMode: Bool? = nil, blockTracking: Bool? = nil, enableIncognito: Bool? = nil, omitBackground: Bool? = nil, thumbnailWidth: Int? = nil, adjustTop: Int? = nil, waitForEvent: ScreenshotCaptureRequestWaitForEvent? = nil, grayscale: Int? = nil, delay: Int? = nil, timeout: Int? = nil, ttl: Int? = nil, clipX: Int? = nil, clipY: Int? = nil, clipWidth: Int? = nil, clipHeight: Int? = nil, cssUrl: String? = nil, css: String? = nil, jsUrl: String? = nil, js: String? = nil, blockJs: Bool? = nil, blockStylesheets: Bool? = nil, blockImages: Bool? = nil, blockMedia: Bool? = nil, blockFont: Bool? = nil, blockTextTrack: Bool? = nil, blockXhr: Bool? = nil, blockFetch: Bool? = nil, blockEventSource: Bool? = nil, blockWebSocket: Bool? = nil, blockManifest: Bool? = nil, blockSpecificRequests: String? = nil, blurSelector: String? = nil, removeSelector: String? = nil, resultFileName: String? = nil, scrollingScreenshot: Bool? = nil, scrollSpeed: ScreenshotCaptureRequestScrollSpeed? = nil, scrollBack: Bool? = nil, startImmediately: Bool? = nil, multipleScrolling: Bool? = nil, sizes: String? = nil, duration: Double? = nil, failOnError: Bool? = nil, longitude: Double? = nil, latitude: Double? = nil, proxy: String? = nil, headers: String? = nil, cookies: String? = nil, scrollToElement: String? = nil, selector: String? = nil, userAgent: String? = nil, acceptLanguages: String? = nil, customHtml: String? = nil, imageQuality: Double? = nil, requestOptions: RequestOptions? = nil) async throws -> Data {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/screenshot",
            queryParams: [
                "apiKey": .string(apiKey), 
                "output": output.map { .string($0.rawValue) }, 
                "file_type": fileType.map { .string($0.rawValue) }, 
                "url": .string(url), 
                "width": width.map { .int($0) }, 
                "height": height.map { .int($0) }, 
                "full_page": fullPage.map { .bool($0) }, 
                "fresh": fresh.map { .bool($0) }, 
                "no_cookie_banners": noCookieBanners.map { .bool($0) }, 
                "enable_caching": enableCaching.map { .bool($0) }, 
                "block_ads": blockAds.map { .bool($0) }, 
                "block_chat_widgets": blockChatWidgets.map { .bool($0) }, 
                "extract_text": extractText.map { .bool($0) }, 
                "extract_html": extractHtml.map { .bool($0) }, 
                "destroy_screenshot": destroyScreenshot.map { .bool($0) }, 
                "lazy_load": lazyLoad.map { .bool($0) }, 
                "retina": retina.map { .bool($0) }, 
                "dark_mode": darkMode.map { .bool($0) }, 
                "block_tracking": blockTracking.map { .bool($0) }, 
                "enable_incognito": enableIncognito.map { .bool($0) }, 
                "omit_background": omitBackground.map { .bool($0) }, 
                "thumbnail_width": thumbnailWidth.map { .int($0) }, 
                "adjust_top": adjustTop.map { .int($0) }, 
                "wait_for_event": waitForEvent.map { .string($0.rawValue) }, 
                "grayscale": grayscale.map { .int($0) }, 
                "delay": delay.map { .int($0) }, 
                "timeout": timeout.map { .int($0) }, 
                "ttl": ttl.map { .int($0) }, 
                "clip[x]": clipX.map { .int($0) }, 
                "clip[y]": clipY.map { .int($0) }, 
                "clip[width]": clipWidth.map { .int($0) }, 
                "clip[height]": clipHeight.map { .int($0) }, 
                "css_url": cssUrl.map { .string($0) }, 
                "css": css.map { .string($0) }, 
                "js_url": jsUrl.map { .string($0) }, 
                "js": js.map { .string($0) }, 
                "block_js": blockJs.map { .bool($0) }, 
                "block_stylesheets": blockStylesheets.map { .bool($0) }, 
                "block_images": blockImages.map { .bool($0) }, 
                "block_media": blockMedia.map { .bool($0) }, 
                "block_font": blockFont.map { .bool($0) }, 
                "block_text_track": blockTextTrack.map { .bool($0) }, 
                "block_xhr": blockXhr.map { .bool($0) }, 
                "block_fetch": blockFetch.map { .bool($0) }, 
                "block_event_source": blockEventSource.map { .bool($0) }, 
                "block_web_socket": blockWebSocket.map { .bool($0) }, 
                "block_manifest": blockManifest.map { .bool($0) }, 
                "block_specific_requests": blockSpecificRequests.map { .string($0) }, 
                "blur_selector": blurSelector.map { .string($0) }, 
                "remove_selector": removeSelector.map { .string($0) }, 
                "result_file_name": resultFileName.map { .string($0) }, 
                "scrolling_screenshot": scrollingScreenshot.map { .bool($0) }, 
                "scroll_speed": scrollSpeed.map { .string($0.rawValue) }, 
                "scroll_back": scrollBack.map { .bool($0) }, 
                "start_immediately": startImmediately.map { .bool($0) }, 
                "multiple_scrolling": multipleScrolling.map { .bool($0) }, 
                "sizes": sizes.map { .string($0) }, 
                "duration": duration.map { .double($0) }, 
                "fail_on_error": failOnError.map { .bool($0) }, 
                "longitude": longitude.map { .double($0) }, 
                "latitude": latitude.map { .double($0) }, 
                "proxy": proxy.map { .string($0) }, 
                "headers": headers.map { .string($0) }, 
                "cookies": cookies.map { .string($0) }, 
                "scroll_to_element": scrollToElement.map { .string($0) }, 
                "selector": selector.map { .string($0) }, 
                "user_agent": userAgent.map { .string($0) }, 
                "accept_languages": acceptLanguages.map { .string($0) }, 
                "custom_html": customHtml.map { .string($0) }, 
                "image_quality": imageQuality.map { .double($0) }
            ],
            requestOptions: requestOptions,
            responseType: Data.self
        )
    }

    /// Our Bulk Screenshot API allows you to capture screenshots of multiple webpages simultaneously, saving you time and effort. Instead of manually capturing each page one by one, you can batch process URLs and receive high-quality screenshots in the format you choose.
    ///  Maximum `50 URLs` per request.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkScreenshotCapture(apiKey: String, format: BulkScreenshotCaptureRequestFormat? = nil, request: Requests.BulkScreenshotCaptureRequest, requestOptions: RequestOptions? = nil) async throws -> BulkScreenshotCaptureResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/screenshot",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkScreenshotCaptureResponse.self
        )
    }

    /// Get live forex rates for all world currencies with customizable update frequency
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter base: Base currency for rate calculations
    /// - Parameter symbols: Comma separated list of desired currency codes
    /// - Parameter updates: Exchange rates update period (1d=daily, 1h=hourly, 10m=10 minutes, 1m=1 minute)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyLatestRates(apiKey: String, format: CurrencyLatestRatesRequestFormat? = nil, base: String? = nil, symbols: String? = nil, updates: CurrencyLatestRatesRequestUpdates? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyLatestRatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/rates/latest",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "base": base.map { .string($0) }, 
                "symbols": symbols.map { .string($0) }, 
                "updates": updates.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyLatestRatesResponse.self
        )
    }

    /// Get historical exchange rates for any specific date
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter base: Base currency for rate calculations
    /// - Parameter symbols: Comma separated list of desired currency codes
    /// - Parameter date: Specific date in YYYY-MM-DD format
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyHistoricalRates(apiKey: String, format: CurrencyHistoricalRatesRequestFormat? = nil, base: String? = nil, symbols: String? = nil, date: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CurrencyHistoricalRatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/rates/historical",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "base": base.map { .string($0) }, 
                "symbols": symbols.map { .string($0) }, 
                "date": .calendarDate(date)
            ],
            requestOptions: requestOptions,
            responseType: CurrencyHistoricalRatesResponse.self
        )
    }

    /// Convert amount between currencies using the latest exchange rates
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter from: Source currency code
    /// - Parameter to: Target currency code
    /// - Parameter amount: Amount to convert
    /// - Parameter updates: Exchange rates update period (1d=daily, 1h=hourly, 10m=10 minutes, 1m=1 minute)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyConvertLatest(apiKey: String, format: CurrencyConvertLatestRequestFormat? = nil, from: String, to: String, amount: String? = nil, updates: CurrencyConvertLatestRequestUpdates? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyConvertLatestResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/converter/latest/prices",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "from": .string(from), 
                "to": .string(to), 
                "amount": amount.map { .string($0) },
                "updates": updates.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyConvertLatestResponse.self
        )
    }

    /// Convert amount between currencies using historical rates
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter from: From currency symbol
    /// - Parameter to: To currency symbol
    /// - Parameter amount: The Amount to be converted
    /// - Parameter date: specific date (format YYYY-MM-DD) of which exchange rates is used.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyConvertHistorical(apiKey: String, format: CurrencyConvertHistoricalRequestFormat? = nil, from: String, to: String, amount: String? = nil, date: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CurrencyConvertHistoricalResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/converter/historical/prices",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "from": .string(from), 
                "to": .string(to), 
                "amount": amount.map { .string($0) },
                "date": .calendarDate(date)
            ],
            requestOptions: requestOptions,
            responseType: CurrencyConvertHistoricalResponse.self
        )
    }

    /// Get exchange rates for a time range
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter startDate: Start date (format YYYY-MM-DD) of the preferred time frame
    /// - Parameter endDate: End date (format YYYY-MM-DD) of the preferred time frame
    /// - Parameter base: Base currency
    /// - Parameter symbols: comma separated list of desired currencies/ commodities symbols
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyTimeSeries(apiKey: String, format: CurrencyTimeSeriesRequestFormat? = nil, startDate: CalendarDate, endDate: CalendarDate? = nil, base: String? = nil, symbols: String? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyTimeSeriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/time-series",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": endDate.map { .calendarDate($0) }, 
                "base": base.map { .string($0) }, 
                "symbols": symbols.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyTimeSeriesResponse.self
        )
    }

    /// Get currency fluctuation data for a time period
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter startDate: Start date (format YYYY-MM-DD) of the preferred time frame
    /// - Parameter endDate: End date (format YYYY-MM-DD) of the preferred time frame
    /// - Parameter base: Base currency
    /// - Parameter symbols: comma separated list of desired currencies/ commodities symbols
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyFluctuation(apiKey: String, format: CurrencyFluctuationRequestFormat? = nil, startDate: CalendarDate, endDate: CalendarDate? = nil, base: String? = nil, symbols: String? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyFluctuationResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/fluctuation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": endDate.map { .calendarDate($0) }, 
                "base": base.map { .string($0) }, 
                "symbols": symbols.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyFluctuationResponse.self
        )
    }

    /// Convert amount using user's location
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter updates: Exchange rates update period (1d=daily, 1h=hourly, 10m=10 minutes, 1m=1 minute)
    /// - Parameter from: From currency symbol
    /// - Parameter ip: IPv4 or IPv6 geolocated currency
    /// - Parameter amount: Amount to convert
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyConvertByIp(apiKey: String, format: CurrencyConvertByIpRequestFormat? = nil, updates: CurrencyConvertByIpRequestUpdates? = nil, from: String, ip: String? = nil, amount: String? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyConvertByIpResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/converter/ip-to-currency",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "updates": updates.map { .string($0.rawValue) }, 
                "from": .string(from), 
                "ip": ip.map { .string($0) },
                "amount": amount.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyConvertByIpResponse.self
        )
    }

    /// Get list of all supported currencies with their metadata
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencySupported(apiKey: String, format: CurrencySupportedRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencySupportedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/supported",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencySupportedResponse.self
        )
    }

    /// Get currency symbols and codes
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencySymbols(apiKey: String, format: CurrencySymbolsRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencySymbolsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/symbols",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencySymbolsResponse.self
        )
    }

    /// Get information about historical data availability and limits
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyHistoricalLimits(apiKey: String, format: CurrencyHistoricalLimitsRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyHistoricalLimitsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/historical/data/limits",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyHistoricalLimitsResponse.self
        )
    }

    /// Get live commodity rates with customizable update frequency
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the Response
    /// - Parameter symbols: Comma separated list of desired commodities symbols *(e.g. XAU,XAG,WTI,BRENT)* **Required**
    /// - Parameter updates: Exchange rates update period. Possible values are: (1) `10m` - 10 minute update (2) `1m` - 1 minute update **Required**
    /// - Parameter quote: Specifies the target currency for the exchange rate; default quote currency is the market currency of commodity *(e.g. USD, EUR, INR)*
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityLatestRates(apiKey: String, format: CommodityLatestRatesRequestFormat? = nil, symbols: String, updates: CommodityLatestRatesRequestUpdates, quote: String? = nil, requestOptions: RequestOptions? = nil) async throws -> CommodityLatestRatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/rates/latest",
            queryParams: [
                "apiKey": .string(apiKey),
                "format": format.map { .string($0.rawValue) },
                "symbols": .string(symbols),
                "updates": .string(updates.rawValue),
                "quote": quote.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: CommodityLatestRatesResponse.self
        )
    }

    /// Get historical commodity rates for a specific date
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter date: Historical date (YYYY-MM-DD)
    /// - Parameter symbols: Comma-separated list of commodity symbols
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityHistoricalRates(apiKey: String, format: CommodityHistoricalRatesRequestFormat? = nil, date: CalendarDate, symbols: String, requestOptions: RequestOptions? = nil) async throws -> CommodityHistoricalRatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/rates/historical",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "date": .calendarDate(date),
                "symbols": .string(symbols)
            ],
            requestOptions: requestOptions,
            responseType: CommodityHistoricalRatesResponse.self
        )
    }

    /// Get commodity price fluctuation data for a time period
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter symbols: Comma-separated list of commodity symbols
    /// - Parameter startDate: Start date (YYYY-MM-DD)
    /// - Parameter endDate: End date (YYYY-MM-DD)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityFluctuation(apiKey: String, format: CommodityFluctuationRequestFormat? = nil, symbols: String, startDate: CalendarDate, endDate: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CommodityFluctuationResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/fluctuation",
            queryParams: [
                "apiKey": .string(apiKey),
                "format": format.map { .string($0.rawValue) },
                "symbols": .string(symbols),
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate)
            ],
            requestOptions: requestOptions,
            responseType: CommodityFluctuationResponse.self
        )
    }

    /// Get commodity rates for a time range
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter symbols: Comma-separated list of commodity symbols
    /// - Parameter startDate: Start date (YYYY-MM-DD)
    /// - Parameter endDate: End date (YYYY-MM-DD)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityTimeSeries(apiKey: String, format: CommodityTimeSeriesRequestFormat? = nil, symbols: String, startDate: CalendarDate, endDate: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CommodityTimeSeriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/time-series",
            queryParams: [
                "apiKey": .string(apiKey),
                "format": format.map { .string($0.rawValue) },
                "symbols": .string(symbols),
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate)
            ],
            requestOptions: requestOptions,
            responseType: CommodityTimeSeriesResponse.self
        )
    }

    /// Get list of supported commodities
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commoditySymbols(apiKey: String, format: CommoditySymbolsRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> CommoditySymbolsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/symbols",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CommoditySymbolsResponse.self
        )
    }

    /// Retrieves a list of supported countries.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response. Default is JSON.
    /// - Parameter type: Type of supported country. Supported values: IBAN, SWIFT, VAT. By default, it returns all supported countries for all types.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func vatSupportedCountries(apiKey: String, format: VatSupportedCountriesRequestFormat? = nil, type: VatSupportedCountriesRequestType? = nil, requestOptions: RequestOptions? = nil) async throws -> VatSupportedCountriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/vat/supported-countries",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "type": type.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: VatSupportedCountriesResponse.self
        )
    }

    /// Fetches VAT rate based on the specified or originating IP address.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter ipAddress: IPv4 or IPv6 address to look up VAT rate for. If omitted, the originating IP address will be used.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func vatRateByIp(apiKey: String, format: VatRateByIpRequestFormat? = nil, ipAddress: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [VatRateByIpResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/vat/rates/ip-address",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ipAddress": ipAddress.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [VatRateByIpResponseItem].self
        )
    }

    /// Fetches VAT rates for a single country or state provided via query parameters.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter country: Country identifier in Alpha-2 (PK), Alpha-3 (PAK), or full name (Pakistan). Combine with the optional "state" query for sub-national VAT; values are case-insensitive and may use underscores instead of spaces.
    /// - Parameter state: Optional state or region in Alpha-2 (NY) or full name (New_York). Use with "country" for state-level VAT; values are case-insensitive and may use underscores.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func vatRateByCountry(apiKey: String, format: VatRateByCountryRequestFormat? = nil, country: String, state: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [VatRateByCountryResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/vat/rates/country",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "state": state.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [VatRateByCountryResponseItem].self
        )
    }

    /// Retrieves VAT details for multiple countries or country-state combinations in a single request. Maximum of `100` entries per request are allowed.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkVatRateByCountry(apiKey: String, format: BulkVatRateByCountryRequestFormat? = nil, request: Requests.BulkVatRateByCountryRequest, requestOptions: RequestOptions? = nil) async throws -> BulkVatRateByCountryResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/vat/rates/country",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkVatRateByCountryResponse.self
        )
    }

    /// Validates an EU or UK VAT number and returns registration status details.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter vatNumber: EU or UK VAT number to validate.
    /// - Parameter requesterVatNumber: Requester EU or UK VAT number.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func vatValidate(apiKey: String, format: VatValidateRequestFormat? = nil, vatNumber: String, requesterVatNumber: String? = nil, requestOptions: RequestOptions? = nil) async throws -> VatValidateResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/vat/validation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "vatNumber": .string(vatNumber), 
                "requesterVatNumber": requesterVatNumber.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: VatValidateResponse.self
        )
    }

    /// Checks an IBAN for structural validity, checksum accuracy, and bank metadata.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter iban: IBAN to validate.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func ibanValidate(apiKey: String, format: IbanValidateRequestFormat? = nil, iban: String, requestOptions: RequestOptions? = nil) async throws -> IbanValidateResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/iban/validation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "iban": .string(iban)
            ],
            requestOptions: requestOptions,
            responseType: IbanValidateResponse.self
        )
    }

    /// Fetches SWIFT codes for a given country, bank, and city.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter country: Country name (accepts full name, e.g., Pakistan, United States). If only the country parameter is supplied, lists all banks in the country.
    /// - Parameter bank: Bank name (upper case) used to filter SWIFT codes. Should be used together with the country parameter. If only country and bank are provided (without city), returns the list of cities for that bank.
    /// - Parameter city: Gives SWIFT codes for a bank. Optionally specify the city (upper case) to narrow results to a specific city for that bank.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func swiftCodeFind(apiKey: String, format: SwiftCodeFindRequestFormat? = nil, country: String? = nil, bank: String? = nil, city: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [String] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/swift-code/finder",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": country.map { .string($0) }, 
                "bank": bank.map { .string($0) }, 
                "city": city.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [String].self
        )
    }

    /// Fetches detailed information about a SWIFT code.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter swiftCode: SWIFT/BIC code to lookup (must be 8 or 11 characters).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func swiftCodeLookup(apiKey: String, format: SwiftCodeLookupRequestFormat? = nil, swiftCode: String, requestOptions: RequestOptions? = nil) async throws -> SwiftCodeLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/swift-code/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "swiftCode": .string(swiftCode)
            ],
            requestOptions: requestOptions,
            responseType: SwiftCodeLookupResponse.self
        )
    }

    public func zipcodeLookup(apiKey: String, format: ZipcodeLookupRequestFormat? = nil, code: String, country: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ZipcodeLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/zipcode/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "code": .string(code), 
                "country": country.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ZipcodeLookupResponse.self
        )
    }

    /// Validates a bulk of ZIP/postal codes and returns result for each. Maximum `100` ZIP/postal codes per request.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkZipcodeLookup(apiKey: String, format: BulkZipcodeLookupRequestFormat? = nil, request: Requests.BulkZipcodeLookupRequest, requestOptions: RequestOptions? = nil) async throws -> BulkZipcodeLookupResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/zipcode/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkZipcodeLookupResponse.self
        )
    }

    public func zipcodeSearchByCity(apiKey: String, format: ZipcodeSearchByCityRequestFormat? = nil, city: String, country: String, stateName: String? = nil, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ZipcodeSearchByCityResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/zipcode/search/city",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "city": .string(city), 
                "country": .string(country), 
                "state_name": stateName.map { .string($0) }, 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ZipcodeSearchByCityResponse.self
        )
    }

    public func zipcodeSearchByRegion(apiKey: String, format: ZipcodeSearchByRegionRequestFormat? = nil, country: String, region: String, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ZipcodeSearchByRegionResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/zipcode/search/region",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "region": .string(region), 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ZipcodeSearchByRegionResponse.self
        )
    }

    public func zipcodeSearchByRadius(apiKey: String, format: ZipcodeSearchByRadiusRequestFormat? = nil, code: String? = nil, lat: Float? = nil, long: Float? = nil, country: String? = nil, radius: Float, unit: ZipcodeSearchByRadiusRequestUnit? = nil, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ZipcodeSearchByRadiusResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/zipcode/search/radius",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "code": code.map { .string($0) }, 
                "lat": lat.map { .float($0) }, 
                "long": long.map { .float($0) }, 
                "country": country.map { .string($0) }, 
                "radius": .float(radius), 
                "unit": unit.map { .string($0.rawValue) }, 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ZipcodeSearchByRadiusResponse.self
        )
    }

    /// Get distance between postal codes. Maximum `100` postal codes per request.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func zipcodeDistance(apiKey: String, format: ZipcodeDistanceRequestFormat? = nil, request: Requests.ZipcodeDistanceRequest, requestOptions: RequestOptions? = nil) async throws -> ZipcodeDistanceResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/zipcode/distance",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: ZipcodeDistanceResponse.self
        )
    }

    /// Get matching ZIP/postal code pairs within a specified distance. Maximum `100` postal codes per request.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func zipcodeDistanceMatch(apiKey: String, format: ZipcodeDistanceMatchRequestFormat? = nil, request: Requests.ZipcodeDistanceMatchRequest, requestOptions: RequestOptions? = nil) async throws -> ZipcodeDistanceMatchResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/zipcode/distance/match",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: ZipcodeDistanceMatchResponse.self
        )
    }

    /// Get current weather data including temperature, humidity, precipitation, wind conditions, atmospheric pressure, and air quality for any location. Accepts city names, coordinates, or IP addresses. Also includes astronomy data and timezone-aware timestamps.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currentWeather(apiKey: String, format: CurrentWeatherRequestFormat? = nil, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrentWeatherResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/current",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: CurrentWeatherResponse.self
        )
    }

    /// Retrieve current weather conditions for up to `50 locations` in a single request. A maximum of 50 locations (city names, IP addresses, or geographic coordinates) can be included in the request body.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkCurrentWeather(apiKey: String, format: BulkCurrentWeatherRequestFormat? = nil, timezone: String? = nil, request: Requests.BulkCurrentWeatherRequest, requestOptions: RequestOptions? = nil) async throws -> BulkCurrentWeatherResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/weather/current",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkCurrentWeatherResponse.self
        )
    }

    /// Access comprehensive weather forecasts with customizable precision - choose from daily overviews, hourly breakdowns, or even minute-by-minute data. Configure your date ranges or use the default 7-day forecast for standard weather planning.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter startDate: Start date for the forecast in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between startDate and endDate must not exceed 16 days.
    /// - Parameter endDate: End date for the forecast in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between startDate and endDate must not exceed 16 days.
    /// - Parameter forecastDays: Number of days for the forecast, from 1 to 16. Default is 7. Maximum value is 16.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Precision of the forecast data.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func weatherForecast(apiKey: String, format: WeatherForecastRequestFormat? = nil, startDate: CalendarDate? = nil, endDate: CalendarDate? = nil, forecastDays: Int? = nil, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: WeatherForecastRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> WeatherForecastResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/forecast",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": startDate.map { .calendarDate($0) }, 
                "endDate": endDate.map { .calendarDate($0) }, 
                "forecastDays": forecastDays.map { .int($0) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: WeatherForecastResponse.self
        )
    }

    /// Access past weather conditions for specific dates with records going back to 1940. Retrieve comprehensive historical data with both daily and hourly precision options.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter date: Specific date for which to fetch weather data in YYYY-MM-DD format. Historical dates must be past dates only. Current or future dates are not allowed for historical data. Data available from 1940 onwards.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Precision of the historical data. **Note:** 'daily' returns daily aggregates, 'hourly' returns hourly data.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func historicalWeather(apiKey: String, format: HistoricalWeatherRequestFormat? = nil, date: CalendarDate, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: HistoricalWeatherRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> HistoricalWeatherResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/historical",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "date": .calendarDate(date), 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: HistoricalWeatherResponse.self
        )
    }

    /// Pull historical weather information for date ranges up to 90 days (daily data) or 7 days (hourly data). Get consistent formatting across your specified date range with reliable historical weather patterns.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter startDate: Starting date for the data in YYYY-MM-DD format. Historical dates must be past dates only. Current or future dates are not allowed for historical data. Data available from 1940 onwards. For precision=daily, the difference between endDate and startDate must not exceed 90 days. For precision=hourly, the difference must not exceed 7 days.
    /// - Parameter endDate: End date for the data in YYYY-MM-DD format. Historical dates must be past dates only. Current or future dates are not allowed for historical data. Data available from 1940 onwards. For precision=daily, the difference between endDate and startDate must not exceed 90 days. For precision=hourly, the difference must not exceed 7 days.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Precision of the data.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func weatherTimeSeries(apiKey: String, format: WeatherTimeSeriesRequestFormat? = nil, startDate: CalendarDate, endDate: CalendarDate, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: WeatherTimeSeriesRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> WeatherTimeSeriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/time-series",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate), 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: WeatherTimeSeriesResponse.self
        )
    }

    /// Provides hourly forecasts of marine conditions including wave heights, wave directions, wave periods, swell info, sea surface temperatures, and ocean currents. Supports multiple geographical points and returns daily max wave statistics for up to 7 days. Ideal for maritime planning, navigation, and coastal activities.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter startDate: Starting date for marine forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    /// - Parameter endDate: End date for marine forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Precision of the marine data.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func marineWeather(apiKey: String, format: MarineWeatherRequestFormat? = nil, startDate: CalendarDate? = nil, endDate: CalendarDate? = nil, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: MarineWeatherRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> MarineWeatherResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/marine",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": startDate.map { .calendarDate($0) }, 
                "endDate": endDate.map { .calendarDate($0) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: MarineWeatherResponse.self
        )
    }

    /// Monitor and predict air quality conditions using European and US AQI standards. Track pollutant concentrations including PM10, PM2.5, carbon monoxide, nitrogen dioxide, sulfur dioxide, ozone, and dust particles. Get current readings plus hourly forecasts up to 5 days ahead, complete with UV index and aerosol measurements for comprehensive air quality assessment.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter startDate: Starting date for AQI forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 5 days.
    /// - Parameter endDate: End date for AQI forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 5 days.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Only hourly precision is supported; returns hourly AQI data for the selected date range.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func airQuality(apiKey: String, format: AirQualityRequestFormat? = nil, startDate: CalendarDate? = nil, endDate: CalendarDate? = nil, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: AirQualityRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> AirQualityResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/air-quality",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": startDate.map { .calendarDate($0) }, 
                "endDate": endDate.map { .calendarDate($0) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: AirQualityResponse.self
        )
    }

    /// Provides flood forecast data for a given location, including river discharge metrics such as mean, median, maximum, minimum, and percentile values (p25, p75). Requires a startDate and endDate, with the date range limited to 16 days. Location can be specified using city name, latitude/longitude, or IP address.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter startDate: Starting date for flood forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    /// - Parameter endDate: End date for flood forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Only daily precision is supported; returns flood forecast data for the selected date range.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func floodForecast(apiKey: String, format: FloodForecastRequestFormat? = nil, startDate: CalendarDate, endDate: CalendarDate, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: FloodForecastRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> FloodForecastResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/flood",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate), 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: FloodForecastResponse.self
        )
    }

    /// Retrieve countries, optionally filtered by region or subregion.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter region: Optional filter to return countries within a specific region from the region endpoint.
    /// - Parameter subregion: Optional filter to return countries within a specific subregion from the subregion endpoint.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getCountries(apiKey: String, format: GetCountriesRequestFormat? = nil, region: String? = nil, subregion: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GetCountriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/countries",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "region": region.map { .string($0) }, 
                "subregion": subregion.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetCountriesResponse.self
        )
    }

    public func getCountryDetails(apiKey: String, format: GetCountryDetailsRequestFormat? = nil, country: String, requestOptions: RequestOptions? = nil) async throws -> GetCountryDetailsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/country/details",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country)
            ],
            requestOptions: requestOptions,
            responseType: GetCountryDetailsResponse.self
        )
    }

    public func getRegions(apiKey: String, format: GetRegionsRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> GetRegionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/regions",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: GetRegionsResponse.self
        )
    }

    public func getSubregions(apiKey: String, format: GetSubregionsRequestFormat? = nil, region: String, requestOptions: RequestOptions? = nil) async throws -> GetSubregionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/subregions",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "region": .string(region)
            ],
            requestOptions: requestOptions,
            responseType: GetSubregionsResponse.self
        )
    }

    /// Retrieve administrative units based on ISO 3166-1 alpha-2 country code.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getAdminLevels(apiKey: String, format: GetAdminLevelsRequestFormat? = nil, country: String, requestOptions: RequestOptions? = nil) async throws -> GetAdminLevelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/admin-levels",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country)
            ],
            requestOptions: requestOptions,
            responseType: GetAdminLevelsResponse.self
        )
    }

    /// Retrieve administrative divisions for a given country using ISO 3166-1 alpha-2 country codes. You can optionally filter by administrative levels.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter adminLevels: Comma-separated list to filter results by one or more administrative levels.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getAdminUnits(apiKey: String, format: GetAdminUnitsRequestFormat? = nil, country: String, adminLevels: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GetAdminUnitsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/admin-units",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "adminLevels": adminLevels.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetAdminUnitsResponse.self
        )
    }

    /// Retrieve detailed administrative unit information by country and optionally filtered by admin code.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter adminUnit: Optional admin code to fetch details for a specific administrative unit.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getAdminUnitDetails(apiKey: String, format: GetAdminUnitDetailsRequestFormat? = nil, country: String, adminUnit: String, requestOptions: RequestOptions? = nil) async throws -> GetAdminUnitDetailsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/admin-unit/details",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "admin_unit": .string(adminUnit)
            ],
            requestOptions: requestOptions,
            responseType: GetAdminUnitDetailsResponse.self
        )
    }

    /// Retrieve a list of cities within a country, optionally filtered by an administrative unit code.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter adminUnit: Administrative unit code used to filter cities within a specific region.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getCities(apiKey: String, format: GetCitiesRequestFormat? = nil, country: String, adminUnit: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GetCitiesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/cities",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "admin_unit": adminUnit.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetCitiesResponse.self
        )
    }

    /// Get list of all supported flags with their metadata
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getSupportedFlags(apiKey: String, requestOptions: RequestOptions? = nil) async throws -> [GetSupportedFlagsResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/flags/supported",
            queryParams: [
                "apiKey": .string(apiKey)
            ],
            requestOptions: requestOptions,
            responseType: [GetSupportedFlagsResponseItem].self
        )
    }

    /// Retrieve the flag for a specific country
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter name: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter shape: Flag shape. One of: `'flat'` or `'round'`.
    /// - Parameter format: Flag format. Applicable only for PNG or WEBP formats. Default is png.
    /// - Parameter size: Flag size in pixels. Valid options: `16px`, `24px`, `32px`, `48px`, `64px`. Applicable only for PNG or WEBP formats.
    /// - Parameter type: Type of flag. One of: `country` or `organization`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getFlags(apiKey: String, name: String, shape: GetFlagsRequestShape, format: GetFlagsRequestFormat? = nil, size: GetFlagsRequestSize? = nil, type: GetFlagsRequestType, requestOptions: RequestOptions? = nil) async throws -> Data {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/flags",
            queryParams: [
                "apiKey": .string(apiKey), 
                "name": .string(name), 
                "shape": .string(shape.rawValue), 
                "format": format.map { .string($0.rawValue) }, 
                "size": size.map { .string($0.rawValue) }, 
                "type": .string(type.rawValue)
            ],
            requestOptions: requestOptions,
            responseType: Data.self
        )
    }

    /// Retrieve current time, date, and timezone-related information by specifying a timezone name, location address, location coordinates, IP address, or use the client IP address if no parameter is passed.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter ip: IPv4 or IPv6 address to extract timezone information.
    /// - Parameter tz: Timezone name (e.g., "Asia/Kolkata") to retrieve information directly.
    /// - Parameter location: Location string (preferably city and country) to extract timezone.
    /// - Parameter lat: Latitude for geolocation lookup.
    /// - Parameter long: Longitude for geolocation lookup.
    /// - Parameter lang: Language code for response localization (default is "en").
    /// - Parameter iataCode: 3-letter IATA airport code (e.g., JFK).
    /// - Parameter icaoCode: 4-letter ICAO airport code (e.g., KJFK).
    /// - Parameter loCode: 5-letter UN/LO city code.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func timezoneLookup(apiKey: String, format: TimezoneLookupRequestFormat? = nil, ip: String? = nil, tz: String? = nil, location: String? = nil, lat: Float? = nil, long: Float? = nil, lang: TimezoneLookupRequestLang? = nil, iataCode: String? = nil, icaoCode: String? = nil, loCode: String? = nil, requestOptions: RequestOptions? = nil) async throws -> TimezoneLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geolocation/timezone",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": ip.map { .string($0) }, 
                "tz": tz.map { .string($0) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .float($0) }, 
                "long": long.map { .float($0) }, 
                "lang": lang.map { .string($0.rawValue) }, 
                "iata_code": iataCode.map { .string($0) }, 
                "icao_code": icaoCode.map { .string($0) }, 
                "lo_code": loCode.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: TimezoneLookupResponse.self
        )
    }

    /// Converts a given time from one timezone to another using various input types like timezone name, coordinates, location, or codes.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response .
    /// - Parameter time: Time to convert in `yyyy-MM-dd HH:mm` or `yyyy-MM-dd HH:mm:ss` format.
    /// - Parameter tzFrom: Source timezone name (e.g., `Asia/Kolkata`).
    /// - Parameter tzTo: Target timezone name (e.g., `America/New_York`).
    /// - Parameter latFrom: Latitude of source location.
    /// - Parameter longFrom: Longitude of source location.
    /// - Parameter latTo: Latitude of target location.
    /// - Parameter longTo: Longitude of target location.
    /// - Parameter locationFrom: From location (city/country).
    /// - Parameter locationTo: To location (city/country).
    /// - Parameter iataFrom: From IATA airport code (e.g., JFK).
    /// - Parameter iataTo: To IATA airport code.
    /// - Parameter icaoFrom: From ICAO airport code (e.g., KJFK).
    /// - Parameter icaoTo: To ICAO airport code.
    /// - Parameter locodeFrom: From UN/LO CODE.
    /// - Parameter locodeTo: To UN/LO CODE.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func timezoneConvert(apiKey: String, format: TimezoneConvertRequestFormat? = nil, time: String? = nil, tzFrom: String? = nil, tzTo: String? = nil, latFrom: Double? = nil, longFrom: Double? = nil, latTo: Double? = nil, longTo: Double? = nil, locationFrom: String? = nil, locationTo: String? = nil, iataFrom: String? = nil, iataTo: String? = nil, icaoFrom: String? = nil, icaoTo: String? = nil, locodeFrom: String? = nil, locodeTo: String? = nil, requestOptions: RequestOptions? = nil) async throws -> TimezoneConvertResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/timezone/converter",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "time": time.map { .string($0) }, 
                "tz_from": tzFrom.map { .string($0) }, 
                "tz_to": tzTo.map { .string($0) }, 
                "lat_from": latFrom.map { .double($0) }, 
                "long_from": longFrom.map { .double($0) }, 
                "lat_to": latTo.map { .double($0) }, 
                "long_to": longTo.map { .double($0) }, 
                "location_from": locationFrom.map { .string($0) }, 
                "location_to": locationTo.map { .string($0) }, 
                "iata_from": iataFrom.map { .string($0) }, 
                "iata_to": iataTo.map { .string($0) }, 
                "icao_from": icaoFrom.map { .string($0) }, 
                "icao_to": icaoTo.map { .string($0) }, 
                "locode_from": locodeFrom.map { .string($0) }, 
                "locode_to": locodeTo.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: TimezoneConvertResponse.self
        )
    }

    /// Parse User Agent string to get detailed browser, device, and operating system information
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter userAgent: User-Agent string to parse. Sent as the `User-Agent` HTTP header.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func userAgentLookup(apiKey: String, format: UserAgentLookupRequestFormat? = nil, userAgent: String, requestOptions: RequestOptions? = nil) async throws -> UserAgentLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/user-agent/lookup",
            headers: [
                "User-Agent": userAgent
            ],
            queryParams: [
                "apiKey": .string(apiKey),
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: UserAgentLookupResponse.self
        )
    }

    /// Parse up to `50,000 User-Agent strings` at once in a single request.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkUserAgentLookup(apiKey: String, format: BulkUserAgentLookupRequestFormat? = nil, request: Requests.BulkUserAgentLookupRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkUserAgentLookupResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/user-agent/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkUserAgentLookupResponseItem].self
        )
    }

    /// Perform Optical Character Recognition (OCR) on images, PDFs, or ZIP archives. Supports two models: `mini-ocr-v1` for CAPTCHA-optimized OCR and `ocr-v1` for general-purpose document text extraction. Supports zonal OCR to extract text from specific regions of an image.
    /// 
    /// **Notes:**
    /// - The `zone` query parameter cannot be given with .pdf and .zip types as it can only be applied to single image query.
    /// - The `page_range` query parameter cannot be given in any other type except .pdf types.
    /// - PDFs containing images in them are allowed only for processing.
    /// - The `mini-ocr-v1` model doesn’t support the following query parameters:
    ///     - `page_range` (.pdf types)
    ///     - `zone`
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter url: URL of the image or PDF (required if `file` not provided)
    /// - Parameter model: OCR model to use.
    /// - Parameter pageRange: Specify page range for multi-page PDFs (e.g., '1,3,5-10' or 'allpages'). **Note:** This parameter can only be used with .pdf file types.
    /// - Parameter zone: Define OCR zones using coordinates (top:left:height:width). Multiple zones can be defined using commas. Only available for model 'ocr-v1'. **Note:** This parameter cannot be used with .pdf and .zip file types as it can only be applied to single image queries.
    /// - Parameter newLine: Set to 1 to split output text into individual lines (default: 0)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func ocrPredict(apiKey: String, url: String? = nil, model: OcrPredictRequestModel, pageRange: String? = nil, zone: String? = nil, newLine: Int? = nil, request: Requests.OcrPredictRequest, requestOptions: RequestOptions? = nil) async throws -> OcrPredictResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/ocr/predict",
            queryParams: [
                "apiKey": .string(apiKey), 
                "url": url.map { .string($0) }, 
                "model": .string(model.rawValue), 
                "page_range": pageRange.map { .string($0) }, 
                "zone": zone.map { .string($0) }, 
                "new_line": newLine.map { .int($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: OcrPredictResponse.self
        )
    }

    /// Analyze text for grammar errors and return the exact words flagged as grammatically incorrect with zero-based word positions.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func grammarDetect(apiKey: String, request: Requests.GrammarDetectRequest, requestOptions: RequestOptions? = nil) async throws -> GrammarDetectResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/readability/grammar/detect",
            queryParams: [
                "apiKey": .string(apiKey)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: GrammarDetectResponse.self
        )
    }

    /// Submit text with grammatical issues and receive a clean grammar-corrected result for proofreading and content workflows.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func grammarCorrect(apiKey: String, request: Requests.GrammarCorrectRequest, requestOptions: RequestOptions? = nil) async throws -> GrammarCorrectResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/readability/grammar/correct",
            queryParams: [
                "apiKey": .string(apiKey)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: GrammarCorrectResponse.self
        )
    }

    /// Analyze text and return weak, vague, or filler words with zero-based word positions to help writers produce clearer and more concise content.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func weakWordsDetect(apiKey: String, request: Requests.WeakWordsDetectRequest, requestOptions: RequestOptions? = nil) async throws -> WeakWordsDetectResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/readability/weak-words",
            queryParams: [
                "apiKey": .string(apiKey)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: WeakWordsDetectResponse.self
        )
    }

    /// Analyze text readability using industry-standard formulas including Flesch Reading Ease, Flesch-Kincaid Grade Level, Gunning Fog Index, SMOG Index, Coleman-Liau Index, and Automated Readability Index.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter target: Target audience used to tune sentence difficulty levels
    /// - Parameter exclude: Comma-separated response sections to omit. Possible values are readability_scores, sentence_readability, readability_grade
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func readabilityScore(apiKey: String, target: ReadabilityScoreRequestTarget? = nil, exclude: String? = nil, request: Requests.ReadabilityScoreRequest, requestOptions: RequestOptions? = nil) async throws -> ReadabilityScoreResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/readability/score",
            queryParams: [
                "apiKey": .string(apiKey), 
                "target": target.map { .string($0.rawValue) }, 
                "exclude": exclude.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: ReadabilityScoreResponse.self
        )
    }

    /// Retrieve sunrise and sunset times, current position of the moon, and other related information by specifying a location address, location coordinates, IP address, or using the client IP address if no parameter is passed.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter location: Location name or address
    /// - Parameter lat: Latitude for location coordinates
    /// - Parameter long: Longitude for location coordinates
    /// - Parameter ip: IP address for location detection
    /// - Parameter date: Date for astronomy data (YYYY-MM-DD)
    /// - Parameter elevation: Timezone of the location for which astronomy data is required
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func astronomyLookup(apiKey: String, format: AstronomyLookupRequestFormat? = nil, location: String? = nil, lat: Float? = nil, long: Float? = nil, ip: String? = nil, lang: String? = nil, date: CalendarDate? = nil, elevation: Double? = nil, timeZone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> AstronomyLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geolocation/astronomy",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .float($0) }, 
                "long": long.map { .float($0) }, 
                "ip": ip.map { .string($0) }, 
                "lang": lang.map { .string($0) }, 
                "date": date.map { .calendarDate($0) }, 
                "elevation": elevation.map { .double($0) }, 
                "time_zone": timeZone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: AstronomyLookupResponse.self
        )
    }
}