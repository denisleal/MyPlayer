//
//  PlayerView.swift
//  MyPlayer
//
//  Created by Denis Leal on 2019-06-07.
//  Copyright © 2019 Denis Leal. All rights reserved.
//

import SwiftUI

struct PlayerView: UIViewRepresentable {
    private var mediaPlayer = VLCMediaPlayer()
    private let mediaURL = "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.m3u8"

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {

    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .green
        mediaPlayer.drawable = view
        mediaPlayer.media = VLCMedia(url: URL(string: mediaURL)!)
//        mediaPlayer.play()
        return view
    }

    func playVideo() {
        mediaPlayer.play()
    }

    func stopVideo() {
        mediaPlayer.stop()
    }
}

#if DEBUG
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
#endif
