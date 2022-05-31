//
//  ViewController.swift
//  MailBoxSample
//
//  Created by Mohammad  Talha on 31/05/2022.
//

import UIKit
import MapboxMaps


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
        guard let url = URL(string: "https://medium.com") else { return }
        ServiceManager().callAPI(withURL: url, isCertificatePinning: true) { (message) in
            let alert = UIAlertController(title: "SSLPinning", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
