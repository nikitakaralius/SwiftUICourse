import SwiftUI

struct AccountView: View {
    @StateObject private var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Information") {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                    DatePicker("Birthdate", selection: $viewModel.birthdate, displayedComponents: .date)
                    Button("Save Changes") {
                        DispatchQueue.main.async {
                            viewModel.saveChanges()
                        }
                    }
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins",
                           isOn: $viewModel.areExtraNapkinsOn)
                    Toggle("Frequent Refills",
                           isOn: $viewModel.areFrequentRefillsOn)
                }
                .tint(.brandPrimary)
            }
            .navigationTitle("🧑🏼 Account")
        }
        .alert(item: $viewModel.alertDescription) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
