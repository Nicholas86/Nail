//
//  StructMacros.swift
//  QuickNail
//
//  Created by XueShan Zhang on 2017/8/28.
//  Copyright © 2017年 XueShan Zhang. All rights reserved.
//

import Foundation

import Alamofire

struct Colors {
    static let blue = "#656565"
}


struct SearchCriteria {
    let placeName:String?
    let centerPoint:String?
}

struct PropertyDetail {
    var title:String
    var price:Double
    var imgUrl:String
    var bedroomNumber:Int = -1
    var propertyType:String
    var bathroomNumber:Int = -1
    var description:String
}



struct PropertyApi {
    
    func findProperties(searchCriteria:SearchCriteria, success: @escaping (_ response: Any) -> Void, failure: @escaping (_ error: Error?) -> Void ) {
        
        let parameters = parametersForQuery(searchCriteria: searchCriteria)
        
        Alamofire.request("http://api.nestoria.co.uk/api", parameters:parameters).responseJSON(
            completionHandler: { response in
                switch response.result {
                case .success(let JSON):
                    print("Validation Successful")
                    print(response.data ?? "Data is empty")
                    success(JSON)
                case .failure(let error):
                    print(error)
                    failure(error)
                }
        })
    }
    
    private func parametersForQuery(searchCriteria:SearchCriteria) -> [String : Any]{
        var queryParameters = [
            "country": "uk",
            "pretty": "1",
            "encoding": "json",
            "listing_type": "buy",
            "action": "search_listings",
            "page": 1
            ] as [String : Any]
        if (searchCriteria.placeName != nil) {
            queryParameters["place_name"] = searchCriteria.placeName
        }
        if(searchCriteria.centerPoint != nil) {
            queryParameters["centre_point"] = searchCriteria.centerPoint
        }
        
        return queryParameters
    }
    
}


//控制器调用
/*
 
 
 struct PropertyActionCreater {
 
    typealias ActionCreator = (_ state: AppState, _ store: Store<AppState>) -> Action?
 
    typealias AsyncActionCreator = (_ state: AppState, _ store: Store<AppState>,  _ callback:  @escaping (_ actionCreator: ActionCreator) -> Void ) -> Void
 
    let propertyApi = PropertyApi()
 
    let locationTracker = LocationTracker()
 
 func searchProperties(searchCriteria: SearchCriteria, _ callback:(() -> Void)?) -> ActionCreator {
 return { state, store in
 store.dispatch(UpdateSearchCriteria(searchCriteria: searchCriteria))
 
 self.propertyApi.findProperties(
 searchCriteria: searchCriteria,
 success: { (response) in
 store.dispatch(UpdateProperties(response: response))
 store.dispatch(EndLoading())
 callback?()
 },
 failure: { (error) in
 store.dispatch(EndLoading())
 store.dispatch(SaveErrorMessage(errorMessage: (error?.localizedDescription)!))
 }
 )
 return StartLoading()
 }
 }
 
 
 func searchPropertiesByCurrentLocation(_ nextStep:(() -> Void)?) -> AsyncActionCreator {
 
    return { maybeState, store, callback in
    store.dispatch(StartLoading())
    self.locationTracker.getCurrentLocation(
        success: { currentLocation in
        let searchCriteria = SearchCriteria(
        placeName:nil,
        centerPoint: currentLocation
    )
    callback(self.searchProperties(searchCriteria: searchCriteria, nextStep))
    },
        fail: { errorMessage in
        store.dispatch(SaveErrorMessage(errorMessage: errorMessage))
        store.dispatch(EndLoading())
    }
    )
        }
    }
 
        }

 
 */







