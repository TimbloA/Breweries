//
//  BreweryDetailView.swift
//  Breweries
//
//  Created by Timblo, Adi (WING) on 11/06/2024.
//

import SwiftUI

struct BreweryDetailView: View {
    
    let breweryWebAdaptor = BreweryWebAdaptor.shared
    let breweryId:String
    @State private var brewery: Brewery?
    
    var body: some View {
        VStack{
            if let brewery = brewery {
                Text("\(brewery.name)")
            } else {
                Text("None found")
            }
        }
        .onAppear {
            breweryWebAdaptor.singleBrewery(for: breweryId, completion: { breweryItem in
                brewery = breweryItem
            })
        }
    }

}


#Preview {
    BreweryDetailView(breweryId: "b54b16e1-ac3b-4bff-a11f-f7ae9ddc27e0")
}
