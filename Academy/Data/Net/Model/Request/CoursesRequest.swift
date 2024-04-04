//
//  CoursesRequest.swift
//  Academy
//
//  Created by MovchanArtemiy on 12.01.2020.
//  Copyright © 2020 MovchanArtemiy. All rights reserved.
//

import Foundation
import UIKit


struct CoursesRequest: CodableAbout {
    var publish: Bool



    private enum CodingKeys: String, CodingKey {
        case publish
    }
}

