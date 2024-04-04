//
//  MapCell.swift
//  Academy
//
//  Created by Sergey Dimitriev on 27.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import UIKit
import YandexMapKit

open class MapCell: UITableViewCell {
    @IBOutlet weak var forMap: UIView!
    @IBOutlet weak var forMapHeight: NSLayoutConstraint!
    var cellModel: MapModel?
    var mapView = YMKMapView()
    
    let TARGET_LOCATION = YMKPoint(latitude: 54.319769, longitude: 48.395945)
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        let width = forMap.frame.size.width
        forMapHeight.constant = width
        
        mapView.mapWindow.map.move(
        with: YMKCameraPosition(target: TARGET_LOCATION, zoom: 18, azimuth: 0, tilt: 0),
        animationType: YMKAnimation(type: YMKAnimationType.smooth, duration: 3),
        cameraCallback: nil)
        
        
        
        mapView.frame = forMap.bounds
        mapView.frame.size.height = width
        forMap.addSubview(mapView)
    }
}

extension MapCell: CellModelConfigurable {
    func config(model: CellModel) {
        guard let model = model as? MapModel else { return }
        self.cellModel = model
    }
}
