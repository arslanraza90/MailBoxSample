//
//  ViewController.swift
//  MailBoxSample
//
//  Created by Mohammad  Talha on 31/05/2022.
//

import UIKit
import MapboxMaps
import Alamofire

class ViewController: UIViewController {
    
    internal var mapView: MapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadAlert()
        
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1IjoiYXJzbGFucmF6YTkwIiwiYSI6ImNsM3ViaHlwajBoZDkzY252NW8yejFsa3cifQ.ZEKm4QvQfVS94RtJeyvsTw")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.view.addSubview(mapView)
    }
}


extension ViewController{
    func loadAlert() {
        guard let url = URL(string: "https://www.mapbox.com") else { return }
        ServiceManager().callAPI(withURL: url, isCertificatePinning: true) { (message) in
            let alert = UIAlertController(title: "SSLPinning", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                self.mapBoxRequest()
                }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func mapBoxRequest(){
        
        let parameters = [String: Any]()
        let nearMapURL = "https://api.nearmap.com/tiles/v3/Vert/19/119799/215845.jpg?apikey=MTkwODNiZmYtNWU0ZS00NjM4LWE5MDUtZDQ0N2MwMzRmZTIw&until=2022-08-01"
        AF.request(nearMapURL, method: .get,  parameters: parameters, encoding: URLEncoding.default)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        if let json = value as? [String: Any] {
                            print(json)
                        }
                    case .failure(let error):
                        print(error)
                    }
            }
    }
}
