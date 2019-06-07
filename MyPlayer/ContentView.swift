//
//  ContentView.swift
//  MyPlayer
//
//  Created by Denis Leal on 2019-06-07.
//  Copyright © 2019 Denis Leal. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        PlayerUIView()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
