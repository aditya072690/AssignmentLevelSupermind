import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            Color.backgroundPrimary.ignoresSafeArea()
            TabView(selection: $selectedTab) {
                MainContentView(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Today")
                    }
                    .tag(0)
                
                Text("Explore")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Explore")
                    }
                    .tag(1)
                
                Text("You")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("You")
                    }
                    .tag(2)
            }
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor(named: "backgroundPrimary")
                UITabBar.appearance().standardAppearance = appearance
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            .accentColor(.white)
        }
    }
}

struct MainContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HeaderView().padding()
                GetStartedView().padding()
                ExploreView()
                SectionWithHorizontalScroll(title: "Recommended For You", items: viewModel.recommendedMeditations).padding()
                SectionWithHorizontalScroll(title: "Recents", items: viewModel.recentMeditations, showSeeAll: true).padding()
                LearnView().padding()
                FeaturedView(meditation: viewModel.featuredMeditation).padding()
            }
            .padding(.bottom, 50)
        }
        .background(Color.backgroundPrimary.ignoresSafeArea())
    }
}

struct HeaderView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("Background")
                .resizable()
                .scaledToFill()
                .frame(height: 250)
                .clipped()
            
            HStack(spacing: 10) {
                HStack(spacing: 5) {
                    Text("2")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Image(systemName: "flame.fill")
                        .foregroundColor(.yellow)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.5))
                )
                
                HStack(spacing: 5) {
                    Text("Rank 5")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Capsule()
                        .fill(Color.black.opacity(0.5))
                )
                
                Spacer()
                
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.5))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "gift.fill")
                        .foregroundColor(.yellow)
                }
                .padding(.trailing)
            }
            .padding()
        }
    }
}

struct SectionWithHorizontalScroll: View {
    let title: String
    let items: [Model]
    var showSeeAll: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                SectionHeader(title: title)
                Spacer()
                if showSeeAll {
                    Text("See All").font(.caption).foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(items) { meditation in
                        MeditationCard(meditation: meditation)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct SectionHeader: View {
    let title: String
    var body: some View {
        Text(title).font(.headline).foregroundColor(.white).padding(.horizontal)
    }
}

struct MeditationCard: View {
    let meditation: Model
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                Image(meditation.imageName)
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(10)
                
                if meditation.isNew {
                    Text("New").font(.caption).bold().padding(6).background(Color.yellow).cornerRadius(5)
                }
            }
            
            Text(meditation.subtitle).font(.caption).foregroundColor(.gray)
            Text(meditation.title).font(.headline).foregroundColor(.white)
            Text(meditation.author).font(.caption).foregroundColor(.gray)
        }
        .frame(width: 160)
    }
}

struct GetStartedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Get Started").font(.headline).foregroundColor(.white)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Meditation Series").font(.caption).foregroundColor(.blueAccent)
                    Text("Manage your emotions").font(.title2).bold().foregroundColor(.white)
                    Text("Ranveer Allahbadia").font(.caption).foregroundColor(.gray)
                }
                Spacer()
                Image("CardBG").resizable().frame(width: 160, height: 120).cornerRadius(10)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.purple, lineWidth: 2))
        }
        .padding(.horizontal)
    }
}

struct ExploreView: View {
    let categories: [(String, String)] = [
        ("Meditation", "Meditation"),
        ("Workout", "Body"),
        ("Sleep", "Moon"),
        ("More", "Vector")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Explore").font(.headline).foregroundColor(.white).padding()
            
            HStack(spacing: 10) {
                ForEach(categories, id: \ .0) { category, imageName in
                    VStack {
                        Image(imageName).resizable().scaledToFit().frame(width: 40, height: 40)
                        Text(category).font(.caption).foregroundColor(.white)
                    }
                    .frame(width: 88, height: 88)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }.padding()
        }
        .padding(.horizontal)
    }
}

struct LearnView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Learn").font(.headline).foregroundColor(.white)
            
            HStack {
                Image("learn").resizable().frame(width: 111, height: 73).cornerRadius(10)
                VStack(alignment: .leading) {
                    Text("How to meditate like a monk").font(.headline).foregroundColor(.white)
                    Text("Read More").font(.caption).foregroundColor(.gray)
                }
                Spacer()
                Image("Share").resizable().scaledToFit().frame(width: 20, height: 20).foregroundColor(.white)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).fill(Color.blueAccent.opacity(0.7)))
        }
        .padding(.horizontal)
    }
}

struct FeaturedView: View {
    let meditation: Model
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(meditation.subtitle).font(.caption).foregroundColor(.gray)
            Text(meditation.title).font(.title2).bold().foregroundColor(.white)
            Text(meditation.author).font(.caption).foregroundColor(.gray)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
