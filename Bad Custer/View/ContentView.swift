//
//  ContentView.swift
//  Bad Custer
//
//  Created by Phillip Giammattei on 7/13/20.
//  Copyright © 2020 Phil Giammattei. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showingNowPlaying = false
    
    var body: some View {
        TabView {
            Music()
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("Music")
            }
            Text("Social Media")
                .tabItem {
                    Image(systemName: "at.badge.plus")
                    Text("Social")
            }
            Button(action: {
                self.showingNowPlaying.toggle()
            }) {
                Text("Show Now Playing")
            }
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About")
            }
            Text("Contact")
                .tabItem {
                    Image(systemName: "cart")
                    Text("Store")
            }
        }
        .sheet(isPresented: $showingNowPlaying) {
            NowPlaying(album: AlbumList().albums[0])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
