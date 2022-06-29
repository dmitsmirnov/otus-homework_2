//
// NewsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class NewsAPI {

    /**
     News List
     
     - parameter language: (query) Language in two letters 
     - parameter apiKey: (query) API key 
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    @discardableResult
    open class func latestNewsGet(language: String, apiKey: String, category: String, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: NewsList?, _ error: Error?) -> Void)) -> RequestTask {
        return latestNewsGetWithRequestBuilder(language: language, apiKey: apiKey, category: category).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     News List
     - GET /latest-news/
     - parameter language: (query) Language in two letters 
     - parameter apiKey: (query) API key 
     - returns: RequestBuilder<NewsList> 
     */
    open class func latestNewsGetWithRequestBuilder(language: String, apiKey: String, category: String) -> RequestBuilder<NewsList> {
        //let localVariablePath = "/latest-news/"
        let localVariablePath = "/search/"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "language": language,
            "apiKey": apiKey,
            "category": category,
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<NewsList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters)
    }
}