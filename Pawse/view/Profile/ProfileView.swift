import SwiftUI

struct ProfileView: View {
        @StateObject var user = User()
        
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Profile(user: user)
                    .padding(.top, 20.0)
                Divider()
            
                TodayTaskView()
                    .padding(.top, 36.0)
                Spacer()
//                NavigationLink(destination: CalendarView()) {
//                    JournalLinkView()
//                }
                Spacer()
            }
            .padding()
        }
    }
}




struct JournalLinkView: View {
    var body: some View {
        HStack {
            Text("Your Journal")
                .font(.headline)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    ProfileView()
}
