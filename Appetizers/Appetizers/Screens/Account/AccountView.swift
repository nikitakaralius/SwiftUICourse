import SwiftUI

struct AccountView: View {
    @ObservedObject var viewModel: AccountViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Information") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    DatePicker("Birthdate",
                               selection: $viewModel.user.birthdate,
                               in: Date().oneHundredTenYearsAgo...Date().fourteenYearsAgo,
                               displayedComponents: .date)
                    
                    Button("Save Changes") {
                        DispatchQueue.main.async {
                            viewModel.saveChanges()
                        }
                    }
                }
                
                Section("Requests") {
                    Toggle("Extra Napkins",
                           isOn: $viewModel.user.areExtraNapkinsOn)
                    Toggle("Frequent Refills",
                           isOn: $viewModel.user.areFrequentRefillsOn)
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
        AccountView(viewModel: AccountViewModel())
    }
}
