import Foundation

public struct SignUpViewModel {
    var name: String?
    var email: String?
    var password: String?
    var passwordConfirmation: String?

    init(name: String? = nil,
         email: String? = nil,
         password: String? = nil,
         passwordConfirmation: String? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}

public final class SignUpPresenter {
    private var alertView: AlertView

    init(alertView: AlertView) {
        self.alertView = alertView
    }

    func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        }
    }

    private func validate(viewModel: SignUpViewModel) -> String? {
        if viewModel.name == nil || viewModel.name!.isEmpty {
            return "O campo Nome é obrigatorio"
        } else if viewModel.email == nil || viewModel.email!.isEmpty {
            return "O campo Email é obrigatorio"
        } else if viewModel.password == nil || viewModel.password!.isEmpty {
            return "O campo Senha é obrigatorio"
        } else if viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty {
            return "O campo Confirmar Senha é obrigatorio"
        }
        return nil
    }
}


