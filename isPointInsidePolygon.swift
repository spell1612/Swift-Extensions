//
//  isPoint.swift
//  GuideDogStub
//
//  Created by Sayooj Sojen on 26/03/19.
//  Copyright © 2019 teamta. All rights reserved.
//

import Foundation
import MapKit

extension MKMapPoint {
    func isPoint(insidePolygon polygon: MKPolygon) -> Bool {
        let polygonVerticies = polygon.points()
        var isInsidePolygon = false
        
        for i in 0..<polygon.pointCount {
            let vertex = polygonVerticies[i]
            let nextVertex = polygonVerticies[(i + 1) % polygon.pointCount]
            
            // The vertices of the edge we are checking.
            let xp0 = vertex.x
            let yp0 = vertex.y
            let xp1 = nextVertex.x
            let yp1 = nextVertex.y
            
            if ((yp0 <= self.y) && (yp1 > self.y) || (yp1 <= self.y) && (yp0 > self.y))
            {
                // If so, get the point where it crosses that line. This is a simple solution
                // to a linear equation. Note that we can't get a division by zero here -
                // if yp1 == yp0 then the above if be false.
                let cross = (xp1 - xp0) * (self.y - yp0) / (yp1 - yp0) + xp0
                
                // Finally check if it crosses to the left of our test point. You could equally
                // do right and it should give the same result.
                if cross < self.x {
                    isInsidePolygon = !isInsidePolygon
                }
            }
        }
        
        return isInsidePolygon
    }
}
