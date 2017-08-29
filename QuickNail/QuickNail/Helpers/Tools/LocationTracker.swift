//
//  LocationTracker.swift
//  ReswiftAppCoordinatorDemo
//
//  Created by Xianning Liu on 06/01/2017.
//  Copyright © 2017 xianlinbox. All rights reserved.
//

//Baidu
import CoreLocation

class LocationTracker :NSObject, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager?
    
    var geocoder : CLGeocoder!

    var onSuccess: ((String) -> Void)?
    
    var onFailure: ((String) -> Void)?

    func getCurrentLocation(success: ((String) -> Void)?, fail: ((String) -> Void)?){
        
        if !(CLLocationManager.locationServicesEnabled()) {
            //            showMBProgressAndDelayHideMBProgressHUD("您的定位功能尚未设置打开,请设置打开", delay: 1.0)
            UIApplication.shared.openURL(urlImage(urlString: UIApplicationOpenSettingsURLString))
            return;
        }

        
        self.locationManager = CLLocationManager()
        
        self.geocoder = CLGeocoder()
        
        self.onSuccess = success
        
        self.onFailure = fail
        
       
        // Ask for Authorisation from the User.
        //self.locationManager?.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager?.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager?.startUpdatingLocation()
        }
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        /*
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        self.onSuccess?("\(locValue.latitude),\(locValue.longitude)")
        self.locationManager?.stopUpdatingLocation()
        self.locationManager = nil
        
         */
 
         //取出位置
        let location = locations.first
        
        weak var weakeSelf = self
        
        let locationQueue = DispatchQueue.init(label: "com.location")
        
        locationQueue.async {
            
            self.geocoder.reverseGeocodeLocation(location!) { (placemarks : [CLPlacemark]?, error : Error?) in
                
                if placemarks?.count == 0{
                    printLog(message: "定位失败")
                    return
                }
                
                if placemarks == nil{
                    return
                }
                
                let placemark : CLPlacemark = (placemarks?.last)!
                
                guard let string : String = placemark.locality else{
                    //self.cityStr = string
                    return
                }
          

                guard utilHelpSingleton.cityString != string else{
                    
                    return
                }
            
                utilHelpSingleton.cityString = string
                NSKeyedArchiverManager.recorderLocationString()
                weakeSelf?.onSuccess?("\(string)")
            }
            
        }
        
        self.locationManager?.stopUpdatingLocation()
        self.locationManager = nil
        self.geocoder = nil
        printLog(message: "结束定位")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.onFailure?(error.localizedDescription)
        self.locationManager?.stopUpdatingLocation()
        self.locationManager = nil
        self.geocoder = nil
    }

}













