//
//  ContentView.swift
//  MyPlayList
//
//  Created by Hannarong Kaewkiriya on 7/2/2567 BE.
//

import SwiftUI

struct MainListView: View {
    //ตัวแปร State เพื่อทํางานรวมกับ List
    @State var mySongList : [SongInformation] = []
    func CreateSongList() -> Void {
        //สร้างข้อมูลเพลง
        let mySong1 : SongInformation = SongInformation(songName: "ผิดที่สําคัญตัว", songFileName:"1", artistName: "พีทพล", artistImage: "1.png")
        let mySong2 : SongInformation = SongInformation(songName: "หน้าหนาวที่แล้ว", songFileName: "2", artistName: "ทอม Room39", artistImage:"2.png")
        let mySong3 : SongInformation = SongInformation(songName: "คนละชั้น", songFileName:"3", artistName: "เจ้านาย", artistImage: "3.png")
        let mySong4 : SongInformation = SongInformation(songName: "(อย่าให้ฉัน) ฝันเก้อ", songFileName: "4", artistName: "ต๊อง วัตดิวัต", artistImage:"4.png")
        //ใส่ข้อมูลเพลงลงไปในอาร์เรย์ mySongList
        mySongList.append(mySong1)
        mySongList.append(mySong2)
        mySongList.append(mySong3)
        mySongList.append(mySong4)
    }
    var body: some View {
        NavigationView{ //เปิด NavView
            List{//เปิด List
                //ลูปเพื่ออ่านค่าจาก mySongList และทําการแสดงผลในรูปแบบของ List
                ForEach(self.mySongList, id:\.self) { theSong in
                    NavigationLink(destination: SongView(mySong:
                                                            theSong)){ //เปิด NavLink
                        HStack(alignment: .center){//เปิด HStack
                            Image(uiImage: UIImage(named:"\(theSong.artistImage)")!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 75 )
                                .cornerRadius(20)
                            VStack(alignment: .leading){//เปิด VStack
                                Text("\(theSong.songName)")
                                Text("\(theSong.artistName)")
                            }//ปิด VStack
                        }//ปิด HStack
                    }//ปิด NavLink
                }//ปิด ForEach
            }//ปิด List
            .listStyle(.plain)
            .navigationTitle("MyPlayList")
        }//ปิด NavView
        .onAppear { //เปิด onAppear
            self.CreateSongList()
            
            //เปลี่ยนสี Navigation Bar และข้อความบน Navigation Bar
            let navbar = UINavigationBarAppearance()
            navbar.configureWithOpaqueBackground()
            navbar.backgroundColor = .brown
            navbar.titleTextAttributes = [.foregroundColor: UIColor.white]
            navbar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            //กําหนดการแสดงผลให้กับ Navigation Bar
            UINavigationBar.appearance().standardAppearance = navbar
            UINavigationBar.appearance().scrollEdgeAppearance = navbar
            UINavigationBar.appearance().barTintColor = .white
            UINavigationBar.appearance().tintColor = .white
        }//ปิด onAppear
    }
}

#Preview {
    MainListView()
}
