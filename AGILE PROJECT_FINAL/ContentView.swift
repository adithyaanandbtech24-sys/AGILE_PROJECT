import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            EscalateView()
                .tabItem {
                    Label("Escalate", systemImage: "arrow.up.circle.fill")
                }
            
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass.circle.fill")
                }
            
            AIAssistantView()
                .tabItem {
                    Label("AI", systemImage: "message.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .tint(.blue) // Active tab color
    }
}

// ------------------------
// MARK: - Reusable Header
// ------------------------
struct HeaderView: View {
    var title: String
    var subtitle: String
    var location: String = "Bengaluru"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            Spacer()
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(.blue)
                Text(location)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
        .padding(.top, 50)  // safe area buffer
        .padding(.horizontal)
        .padding(.bottom, 16)
        .background(Color(red: 220/255, green: 230/255, blue: 250/255))
    }
}

// ------------------------
// MARK: - Home View
// ------------------------
struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Civic Hub", subtitle: "Civic contacts, one tap away")
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Other ways to reach out")
                        .font(.headline)
                        .padding(.top, 16)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        CardView(icon: "message.fill", iconColor: .blue, title: "BESCOM WhatsApp", subtitle: "+919449844640", trailingIcon: "ellipsis")
                        CardView(icon: "envelope.fill", iconColor: .blue, title: "BBMP General", subtitle: "spm.webportal@karnataka.gov.in", trailingIcon: "ellipsis")
                    }
                    .padding(.horizontal)
                    
                    Text("Mobile Apps / Websites")
                        .font(.headline)
                        .padding(.top, 16)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        LinkCard(title: "Property GPS", icon: "candybarphone")
                        LinkCard(title: "Namma Bengaluru (Sahaaya 2.0)", subtitle: "Public Grievance System", icon: "candybarphone")
                        LinkCard(title: "Fix Pothole", icon: "candybarphone")
                        LinkCard(title: "Dishaank", icon: "candybarphone")
                        LinkCard(title: "BESCOM Mithra", icon: "globe")
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct CardView: View {
    var icon: String
    var iconColor: Color
    var title: String
    var subtitle: String
    var trailingIcon: String
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle().fill(iconColor.opacity(0.15)).frame(width: 44, height: 44)
                Image(systemName: icon).foregroundColor(iconColor)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.subheadline).fontWeight(.semibold)
                Text(subtitle).font(.footnote).foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: trailingIcon).foregroundColor(.blue).rotationEffect(.degrees(90))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.03), radius: 4, x:0, y:2)
    }
}

struct LinkCard: View {
    var title: String
    var subtitle: String? = nil
    var icon: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(.subheadline).fontWeight(.semibold)
                if let sub = subtitle {
                    Text(sub).font(.caption).foregroundColor(.secondary)
                }
                Image(systemName: icon).foregroundColor(.green).font(.caption).padding(.top, 4)
            }
            Spacer()
            Image(systemName: "arrow.up.right.square")
                .foregroundColor(.blue)
                .font(.title3)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.03), radius: 4, x:0, y:2)
    }
}

// ------------------------
// MARK: - Explore View
// ------------------------
struct ExploreView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Civic Hub", subtitle: "Browse departments and officials")
            
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Departments")
                        .font(.headline)
                        .padding(.top, 16)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        ExploreCard(title: "ಗ್ರಾಹಕ ಸಂಬಂಧ (Customer Relations)", officials: 0, issues: 4)
                        ExploreCard(title: "BESCOM Helpline", officials: 0, issues: 3)
                        ExploreCard(title: "24x7 ಸಹಾಯವಾಣಿ (24x7 Helpline)", officials: 3, issues: 4)
                        ExploreCard(title: "BESCOM 24X7 Helpline", officials: 0, issues: 9)
                        ExploreCard(title: "Office of Chief Commissioner - GBA", officials: 1, issues: 0)
                        ExploreCard(title: "Revenue & IT", officials: 1, issues: 2)
                        ExploreCard(title: "Education & Welfare", officials: 1, issues: 2)
                        ExploreCard(title: "Administration, Finance & Disaster Management", officials: 1, issues: 3)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.blue)
                            Text("How Bengaluru is governed")
                                .font(.headline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 8)
                        
                        Divider()
                        
                        GovCard(title: "Greater Bengaluru Authority (GBA)", subtitle: "Greater Bengaluru comprising 5 City Corporations", website: "https://bbmp.gov.in")
                        GovCard(title: "Bangalore Electricity Supply Company (BESCOM)", subtitle: "Electricity supply for Bengaluru and surrounding districts", website: nil)
                        GovCard(title: "Bangalore Water Supply & Sewerage Board (BWSSB)", subtitle: "Water supply and sewerage for Bengaluru", website: nil)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.03), radius: 4, x:0, y:2)
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    Text("Civic Hub is an independent directory and is not affiliated with any government entity.")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .padding(.bottom, 20)
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ExploreCard: View {
    var title: String
    var officials: Int
    var issues: Int
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle().fill(Color.blue.opacity(0.1)).frame(width: 44, height: 44)
                Image(systemName: "building.2").foregroundColor(.blue)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(title).font(.subheadline).fontWeight(.semibold)
                HStack(spacing: 12) {
                    if officials > 0 {
                        HStack(spacing: 4) {
                            Image(systemName: "person.2.fill")
                            Text("\(officials) official\(officials == 1 ? "" : "s")")
                        }.font(.caption).foregroundColor(.secondary)
                    }
                    if issues > 0 {
                        HStack(spacing: 4) {
                            Image(systemName: "list.bullet")
                            Text("\(issues) issue\(issues == 1 ? "" : "s")")
                        }.font(.caption).foregroundColor(.secondary)
                    }
                }
            }
            Spacer()
            Image(systemName: "chevron.right").foregroundColor(.gray).font(.caption)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.03), radius: 4, x:0, y:2)
    }
}

struct GovCard: View {
    var title: String
    var subtitle: String
    var website: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(.subheadline).fontWeight(.semibold)
            if let web = website {
                HStack {
                    Image(systemName: "globe")
                    Text(web)
                    Image(systemName: "arrow.up.right.square")
                }.font(.caption).foregroundColor(.blue)
            }
            Text(subtitle).font(.caption).foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}

// ------------------------
// MARK: - Escalate View
// ------------------------
struct EscalateView: View {
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: "Civic Hub", subtitle: "Know who to contact next")
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    TimelineStep(stepNumber: "4", title: "Chief Commissioner", description: "When: Serious unresolved complaints — escalation from Special Commissioners", borderType: .leftRed) {
                        ContactRow(icon: "envelope.fill", type: "Commissioner", value: "comm@bbmp.gov.in")
                    }
                    
                    TimelineStep(stepNumber: "5", title: "CM Good Governance Portal", description: "When: Final escalation — state-level grievance portal", isLast: true, borderType: .leftRed) {
                        ContactRow(icon: "link", type: "Website", value: "https://cmgoodgovernance.karnataka.gov.in/")
                    }
                    
                }
                .padding()
                
                Text("Civic Hub is an independent directory and is not affiliated with any government entity.")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
        .ignoresSafeArea(edges: .top)
    }
}

enum BorderType {
    case leftRed
    case none
}

struct TimelineStep<Content: View>: View {
    var stepNumber: String
    var title: String
    var description: String
    var isLast: Bool = false
    var borderType: BorderType = .none
    let content: Content
    
    init(stepNumber: String, title: String, description: String, isLast: Bool = false, borderType: BorderType = .none, @ViewBuilder content: () -> Content) {
        self.stepNumber = stepNumber
        self.title = title
        self.description = description
        self.isLast = isLast
        self.borderType = borderType
        self.content = content()
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack {
                ZStack {
                    Circle()
                        .stroke(Color(UIColor.systemGray4), lineWidth: 1)
                        .background(Circle().fill(Color.white))
                        .frame(width: 32, height: 32)
                        
                    Text(stepNumber).font(.subheadline).fontWeight(.bold).foregroundColor(.primary)
                }
                if !isLast {
                    Rectangle().fill(Color(UIColor.systemGray4)).frame(width: 2, height: 110)
                        .padding(.vertical, 4)
                }
            }
            
            VStack(alignment: .leading, spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title).font(.headline)
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                content
                
                Divider()
                
                HStack {
                    Image(systemName: "folder.fill").foregroundColor(.blue)
                    Text("Source").foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "arrow.up.right.square").foregroundColor(.gray)
                }
                .font(.caption)
                .padding(.top, 2)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.04), radius: 4, x:0, y:2)
            .overlay(
                HStack {
                    Rectangle()
                        .fill(borderType == .leftRed ? Color.red.opacity(0.8) : Color.clear)
                        .frame(width: 4)
                    Spacer()
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.bottom, 24)
        }
    }
}

struct ContactRow: View {
    var icon: String
    var type: String
    var value: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon).foregroundColor(.blue).frame(width: 20)
            VStack(alignment: .leading, spacing: 2) {
                Text(type).font(.caption2).foregroundColor(.secondary)
                Text(value)
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .lineLimit(1)
            }
            Spacer()
            Image(systemName: "arrow.up.right.square").foregroundColor(.blue).font(.title3)
        }
        .padding(.vertical, 8)
    }
}

// ------------------------
// MARK: - AI Assistant View
// ------------------------
struct AIAssistantView: View {
    @State private var text = ""
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text("AI Assistant")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Ask questions about Bengaluru, Karnataka civic contacts")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.top, 40)
            .background(Color.white)
            
            Divider()
            
            Spacer()
            
            VStack(spacing: 12) {
                Text("Ask me anything about Bengaluru, Karnataka civic contacts!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Try: \"What number do I call for potholes?\" or \"Who handles garbage complaints?\"")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
            
            Spacer()
            
            HStack {
                TextField("Ask about civic contacts...", text: $text)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(24)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color(UIColor.systemGray4), lineWidth: 1)
                    )
                
                Button(action: {}) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding(14)
                        .background(Color(red: 0.7, green: 0.8, blue: 0.95))
                        .clipShape(Circle())
                }
            }
            .padding()
            .background(Color.white)
        }
        .ignoresSafeArea(edges: .top)
        .background(Color(UIColor.systemGroupedBackground))
    }
}

// ------------------------
// MARK: - Settings View
// ------------------------
struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("General")) {
                    Text("About Civic Hub")
                    Text("Privacy Policy")
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    ContentView()
}
