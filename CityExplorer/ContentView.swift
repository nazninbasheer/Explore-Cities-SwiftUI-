
import SwiftUI

struct ContentView: View {
    let cityData: [CityData] = [
        CityData(imageName: "newyork",name: "New York"),
        CityData(imageName : "austin",name:"Austin"),
        CityData(imageName : "hoston",name:"Hoston"),
        CityData(imageName : "losangel",name:"Los Angels"),
        CityData(imageName : "dallas",name:"Dallas")
    ]
   
    var body: some View {
        NavigationView{
        ZStack{
            Color.yellow.opacity(0.3)
                .ignoresSafeArea()
       
            VStack{
                Text("City Explorer")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding()
                    
                
                List {
                    ForEach(cityData){ city in
                        NavigationLink(destination: getDestinationView(labe: city)){
                        HStack {
                            Image(city.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            Text(city.name)
                        }
                    }
                        
                    }
                }.cornerRadius(10)
                    .padding([.top, .leading, .trailing], 10.0)
            }
        }
     }
    }
    
}

struct getDestinationView : View {
    var labe : CityData
    var body: some View{
        VStack{
        Image(labe.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
            Text(labe.name)
                .font(.largeTitle)
            Text(labe.desc)
        }
        .padding()
    }
    
}

struct CityData : Identifiable{
    let id = UUID()
    let imageName : String
    let name : String
    let desc :String = "The most populous city in the United States. It is located at the southern tip of New York State on one of the world's largest natural harbors."
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
