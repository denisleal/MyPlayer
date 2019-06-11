//
//  PlayerView.swift
//  MyPlayer
//
//  Created by Denis Leal on 2019-06-07.
//  Copyright © 2019 Denis Leal. All rights reserved.
//

import SwiftUI

struct PlayerView: UIViewRepresentable {
    let player = VLCMediaPlayer()
    let mediaUrl: String

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {

    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .black
        player.drawable = view
        player.media = VLCMedia(url: URL(string: mediaUrl)!)
        return view
    }
}

#if DEBUG
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(mediaUrl: "")
    }
}
#endif
