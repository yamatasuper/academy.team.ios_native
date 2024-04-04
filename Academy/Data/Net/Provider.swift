//
//  Provider.swift
//  Academy
//
//  Created by Sergey Dimitriev on 13.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import Moya
import Alamofire

class BaseProvider<T: TargetType>: MoyaProvider<T> {
    
    init() {
        //        TODO убрать кастомную реализацию манеджера ServerTrustPolicy после запуска на боевом сервере
        //        let manager = SessionManager(
        //            configuration: URLSessionConfiguration.default,
        //            serverTrustPolicyManager: CustomServerTrustPolicyManager(policies: [:])
        //        )
        //
        super.init(/*manager: manager,*/ plugins: [NetworkLoggerPlugin(verbose: true)])
    }
    
    func response(apiService service: Target) -> Response<String> {
        response(apiService: service, mapClosure: { (try? $0.mapString()) ?? "" })
    }
    
    func response<T: Codable>(apiService service: Target, mapClosure: ((Moya.Response) -> T)? = nil) -> Response<T> {
        let resultValue: Response<T> = Response()
        do {
            let response = try synchronousRequest(service)
            resultValue.statusCode = response.statusCode
            
            if let responseError = getErrorFromResponse(response: response) {
                throw responseError
            }
            let map = mapClosure ?? { (try? $0.map(T.self)) }
            resultValue.result = map(response)
            
            if let data = resultValue.result as? DataProtokol {
                let status = data.status
                resultValue.error = UseCaseMessage(data.message)

            } else if response.statusCode < 200 || response.statusCode > 299 {
                resultValue.error = ResponseError.init(response.statusCode, "Error", nil)
            }
        } catch {
            resultValue.error = error.toUserError()
        }
        return resultValue
    }
    
    @discardableResult
    private func synchronousRequest(_ target: Target) throws -> Moya.Response {
        let semaphore = DispatchSemaphore(value: 0)
        var response: Moya.Response? = nil
        var error: Error? = nil
        request(target) { result in
            defer { semaphore.signal() }
            switch result {
            case .success(let res):
                response = res
            case .failure(let err):
                error = err
            }
        }
        semaphore.wait()
        
        guard error == nil else {
            throw error!
        }
        
        return response!
    }
}
