//
//  ContentView.swift
//  UI-81
//
//  Created by にゃんにゃん丸 on 2020/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home : View {
    @State var sheet = false
    @State var items : [Any] = []
    var body: some View{
        VStack{
            
            HStack{
                
                Image("p16")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                VStack{
                    Image("p16")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                    
                    Button(action: {
                        items.removeAll()
                        items.append(UIImage(named: "p16")!)
                        sheet.toggle()
                    }, label: {
                        Text("Share")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .background(Color.gray)
                    })
                    
                }
                
                
               
            }
            
            
            
        }
        .ignoresSafeArea(.all, edges: .all)
        .fullScreenCover(isPresented: $sheet, content: {
            ShareSheet(items: items)
        })
        
    }
}

struct ShareSheet : UIViewControllerRepresentable {
    var items : [Any]
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        return view
        
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
