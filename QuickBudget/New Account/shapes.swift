//
//  shapes.swift
//  QuickBudget
//
//  Created by Anton Bredykhin on 8/22/19.
//  Copyright © 2019 Anton Bredykhin. All rights reserved.
//

import SwiftUI

struct shapes: View {
    var body: some View {
//        GeometryReader { geometry in
            Path { path in
                let width = 100            

                path.move(to: CGPoint(x: 0, y: 100))
                path.addCurve(to: CGPoint(x: width / 2, y: 0), control1: CGPoint(x: width / 4, y: 50), control2: CGPoint(x: width / 3, y: 30))
                
            }
            .fill(Color.black)
//        }
    }
}

#if DEBUG
struct shapes_Previews: PreviewProvider {
    static var previews: some View {
        shapes()
    }
}
#endif
