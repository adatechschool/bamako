import SwiftUI

struct ContentView: View {
    
    @State var images = [ImageModel]()
    
    var body: some View {
        
        ImagesList(images : images)
            .onAppear() {
                            Api().loadData { (images) in
                                self.images = images
                            }
                        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

