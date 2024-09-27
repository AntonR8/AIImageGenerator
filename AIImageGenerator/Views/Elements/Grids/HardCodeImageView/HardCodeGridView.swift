//
//  GridView.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI

struct HardCodeGridView: View {
    @EnvironmentObject var vm: ViewModel
    var arrayOfImages: [HardCodeImageModel]

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem()], content: {
            ForEach(arrayOfImages) { image in
                HardCodeGridElementView(image: image)
            }
        })
    }
}
