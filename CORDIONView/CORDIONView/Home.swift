//
//  Home.swift
//  CORDIONView
//
//  Created by Anas Hamad on 04/05/1446 AH.
//

import SwiftUI
//let size = UIScreen.main.bounds
struct Home: View {
    @State var isShow = false
    var body: some View {
        HideTextAndButton(textVisebale: "اهلا", textHide: "وسهلا", showContent: $isShow)
    }
}

#Preview {
    Home()
}
struct HideTextAndButton :View{
    @State var textVisebale : String
    @State var textHide : String
    @Binding var showContent : Bool
   
    var body: some View{
       VStack {
        
     
            Button {
                withAnimation {
                    showContent.toggle()
                }
               
            } label: {
                VStack{
                    
                    HStack{
                        Text(textVisebale)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.trailing)
                       
                            .foregroundColor(Color("Green1"))
                            .padding()
                            .lineLimit(2)
                        Spacer()
                        Image(showContent ? "arrowDown":"arrowLeft")
                            .foregroundColor(.black)
                            .padding()
                    }
                  
                   
                    
                }
                
            }
//            .frame(width: size.width - 40,height: 100)
           
            .background(
                Color.white
                    .shadow(radius: 1,x:3,y:5)
            
            
            )
            .mask( showContent ?  RoundedCorners(tl: 30, tr: 30, bl: 0 , br: 0) : RoundedCorners(tl: 30, tr: 30, bl: 30 , br: 30) )
            .shadow(radius: 4 ,x: 3,y: 5)
      
           
         
           if showContent{
               
               VStack(alignment: .leading){
                   HStack{
                       Text(textHide)
                           .foregroundColor(.black)
                           .multilineTextAlignment(.leading)
                         
                           .lineLimit(nil)
                           .padding(8)
                       Spacer()
                   }
               }
//               .frame(width: size.width - 40)
              
               .background(
                 Rectangle()
                    .stroke(Color.gray,lineWidth: 0.5)
                  
               )
             
               .padding(.horizontal, 10)
               .padding(.bottom)
           }
         
           
           

        }
        
     
     
    }
}
struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}
