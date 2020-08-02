//
//  NowPlaying.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 7/19/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//

import SwiftUI
import AVKit

struct NowPlaying: View {
    var album: Album
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isPlaying = false
    @State private var currentTrack = 0
    
    var songList: [Song] {
        AllSongList().getSongsByAlbum(from: self.album)
    }
    
    var currentSong: Song {
        songList[currentTrack]
    }
    
    var currentTime: String {
        let numberOfSeconds: Double
        if self.audioPlayer != nil {
            numberOfSeconds = self.audioPlayer.currentTime
        } else {
            numberOfSeconds = 0
        }
        
        return String(numberOfSeconds)
    }
    
    var duration: String {
        let numberOfSeconds: Double
        if self.audioPlayer != nil {
            numberOfSeconds = self.audioPlayer.duration
        } else {
            numberOfSeconds = 0
        }
        return String(numberOfSeconds)
    }
    
    var playPauseButtonIcon: String {
        isPlaying ? "pause.fill" : "play.fill"
    }
    
    var body: some View {
        
        func playPauseButton() {
            if isPlaying {
                self.audioPlayer.pause()
            } else {
                self.audioPlayer.play()
            }
            isPlaying.toggle()
        }
        
        func backButton() {
            self.audioPlayer.pause()
            
            if audioPlayer.currentTime < 1 {
                if self.currentTrack == 0 {
                    self.currentTrack = songList.count - 1
                } else {
                    self.currentTrack -= 1
                }
                loadMusic(song: currentSong)
            }
            
            audioPlayer.currentTime = 0
            
            if isPlaying {
                self.audioPlayer.play()
            }
        }
        
        func forwardButton() {
            self.audioPlayer.pause()
            
            if currentTrack == songList.count - 1 {
                currentTrack = 0
            } else {
                currentTrack += 1
            }
            
            loadMusic(song: currentSong)
            
            
            self.audioPlayer.currentTime = 0
            if isPlaying {
                self.audioPlayer.play()
            }
        }
        
        func loadMusic(song: Song) {
            let loadSong = Bundle.main.path(forResource: song.src, ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: loadSong!))
        }
        
        
        return ZStack {
            Color(red: 0.68, green: 0.22, blue: 0.22)
            VStack {
                AlbumView(album: album)
                Text(currentSong.title)
                    .font(.headline)
                
                HStack {
                    Spacer()
                    Button(action: {
                        backButton()
                    }) {
                        Image(systemName: "backward.end")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Button(action: {
                        playPauseButton()
                    }) {
                        Image(systemName: playPauseButtonIcon)
                        .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                    Button(action:  {
                        forwardButton()
                    }) {
                        Image(systemName: "forward.end")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                    }
                    Spacer()
                }
                .foregroundColor(.black)
                Text("\(self.currentTime):\(self.duration)")
                Spacer()
            }
        }
        .onAppear() {
            loadMusic(song: self.currentSong)
        }
    }
}

struct NowPlaying_Previews: PreviewProvider {
    static var previews: some View {
        NowPlaying(album: AlbumList().albums[1])
    }
}
