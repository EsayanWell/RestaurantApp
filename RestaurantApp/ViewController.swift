//
//  ViewController.swift
//  4. UISwitch Homework
//
//  Created by Владимир Есаян on 20.06.2023.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Создаем константы для основного экрана
    //создаем кнопку "Войти"
    private let enterButton = UIButton()
    //создаем лэйблы для первого экрана
    private let signInLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    //создаем imageIcon для глаз на первом экране
    let imageIcon = UIImageView()
    //добавляем картинку
    let closeEyeImage = UIImage(named: "closeeye")
    let openEyeImage = UIImage(named: "openeye")
    var iconClick = false
    //создаем view для картинки
    var eyeImageView = UIImageView()
    //создаем картинку на первом экране
    var logoImageView = UIImageView()
    //добавляем картинку
    let marioImage = UIImage(named: "mario")
    
    //MARK: - ViewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
        //меняем цвет первого view
        view.backgroundColor = .white
        //название кнопки входа
        enterButton.setTitle("Войти", for: .normal)
        //добавляем кнопку на view
        view.addSubview(enterButton)
        //закругляем кнопку
        enterButton.layer.cornerRadius = 12
        //меняем шрифт и делаем его жирным
        enterButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        //назначаем цвет на кнопку
        enterButton.backgroundColor = .systemRed
        //назначаем цвет текста
        enterButton.setTitleColor(.white, for: .normal)
        //Добавление действия и обработчика действия к кнопке "enterButton"
        enterButton.addTarget(self, action: #selector(didTapEnterButton), for: .touchUpInside)
        //отключаем автоматическое добавление системных ограничений (constraits)
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        //установка constraits (ограничения)
        NSLayoutConstraint.activate([
            enterButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            enterButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 600),
            enterButton.widthAnchor.constraint(equalToConstant: 300),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //MARK: - Настраиваем лейблы на view 1
        //let labelFrame = CGRect(x: 0, y: 0, width: 100, height: 50)
        //- настройка signInLabel
        //создаем frame для signUpLabel
        //signInLabel.frame = labelFrame
        //создаем текст для signUpLabel
        signInLabel.text = "Sign In"
        //создаем размер шрифта
        signInLabel.font = UIFont.boldSystemFont(ofSize: 30)
        //располагаем signUpLabel
        signInLabel.frame = CGRect(x: 50, y: 310, width: 100, height: 50)
        //метод для того, чтобы текст полностью был виден
        signInLabel.sizeToFit()
        //добавляем на view
        view.addSubview(signInLabel)
        
        //-настройка emailLabel
        //создаем текст для signUpLabel
        emailLabel.text = "Email"
        //создаем размер шрифта и делаем шрифт жирнее
        emailLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        //располагаем signUpLabel
        emailLabel.frame = CGRect(x: 50, y: 350, width: 100, height: 50)
        //цвет текста
        emailLabel.textColor = .systemRed
        //метод для того, чтобы текст полностью был виден
        //emailLabel.sizeToFit()
        //добавляем на view
        view.addSubview(emailLabel)
        
        
        //-настройка passwordLabel
        //создаем frame для passwordLabel
        //passwordLabel.frame = passwordLabel
        //создаем текст для passwordLabel
        passwordLabel.text = "Password"
        //создаем размер шрифта и делаем шрифт жирнее
        passwordLabel.font = .systemFont(ofSize: 17, weight: .heavy)
        //располагаем signUpLabel
        passwordLabel.frame = CGRect(x: 50, y: 430, width: 100, height: 50)
        //цвет текста
        passwordLabel.textColor = .systemRed
        //метод для того, чтобы текст полностью был виден
        //passwordLabel.sizeToFit()
        //добавляем на view
        view.addSubview(passwordLabel)
        
        //MARK: - настройка textField
        //textField для email
        //вызов экземпляра класса
        emailTextField = UITextField()
        //отключаю автоматические constrait
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        //назначаю цвет фона
        emailTextField.backgroundColor = .white
        //закругляю края
        emailTextField.borderStyle = .roundedRect
        //надпись внутри поля
        emailTextField.placeholder = "enter your email"
        //добавляю на view
        view.addSubview(emailTextField)
        //установить contstrait
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: -9),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //textField для password
        //вызов экземпляра класса
        passwordTextField = UITextField()
        //отключаю автоматические constrait
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        //назначаю цвет фона
        passwordTextField.backgroundColor = .white
        //закругляю края
        passwordTextField.borderStyle = .roundedRect
        //скрываем текст при вводе
        passwordTextField.isSecureTextEntry = true
        //надпись внутри поля
        passwordTextField.placeholder = "enter your password"
        //метод, который позволяет смотреть пароль
        
        //добавляю на view
        view.addSubview(passwordTextField)
        
        //установить contstrait
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: -9),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        //MARK: - Разместить логотип на первом экране
        //добавляем картинку на view
        logoImageView.image = marioImage
        //добавляем на view imageview
        view.addSubview(logoImageView)
        //отключаю автоматические constrait
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //установить contstrait
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            logoImageView.widthAnchor.constraint(equalToConstant: 270),
            logoImageView.heightAnchor.constraint(equalToConstant: 270)
        ])
        
    }
    
    //MARK: - обработчик нажатия на кнопку "enterButton"
    //устанавливаем связь для перехода на следуюший view после нажатия на "enterButton"
    @objc private func didTapEnterButton() {
        let rootVC = SecondViewController()
        let secondVC = UINavigationController(rootViewController: rootVC)
        //метод, который отображает второй экран полностью(не как карту)
        secondVC.modalPresentationStyle = .fullScreen
        
        present(secondVC, animated: true)
    }
}

//MARK: - создание второго SecondViewController
class SecondViewController: UIViewController {
    
    //MARK: - Создаем константы для второго экрана
    //создаем кнопку "Выставить счет"
    private let checkButton = UIButton()
    //создаем лейблы для второго экрана
    private let cafeMarioLabel = UILabel()
    private let nameLabel = UILabel()
    private let guestLabel = UILabel()
    private let tableNumberLabel = UILabel()
    private let bookingLabel = UILabel()
    private let prepaymentLabel = UILabel()
    private let vipLabel = UILabel()
    //создаем textField для второго экрана
    private var nameTextField = UITextField()
    private var guestTextField = UITextField()
    private var tableNumberTextField = UITextField()
    //создаем switch для второго экрана
    private let bookingSwitch = UISwitch()
    private let prepaymentSwitch = UISwitch()
    private let vipSwitch = UISwitch()
    
    //MARK: - ViewDidLoad method 2
    override func viewDidLoad() {
        super.viewDidLoad()
        //назначаем цвет фона SecondViewController
        view.backgroundColor = .white
        //название сверху на secondView
        //title = "Mario Cafe"
        
        //делаем переход со 2 экрана на 1
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(goBack))
        //название кнопки входа
        checkButton.setTitle("Выставить счёт", for: .normal)
        //добавляем кнопку на view
        view.addSubview(checkButton)
        //закругляем кнопку
        checkButton.layer.cornerRadius = 12
        //меняем шрифт и делаем его жирным
        checkButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        //назначаем цвет на кнопку
        checkButton.backgroundColor = .systemRed
        //назначаем цвет текста
        checkButton.setTitleColor(.white, for: .normal)
        //Добавление действия и обработчика действия к кнопке "checkButton"
        checkButton.addTarget(self, action: #selector(didTapCheckButton), for: .touchUpInside)
        
        
        //отключаем автоматическое добавление системных ограничений (constraits)
        checkButton.translatesAutoresizingMaskIntoConstraints = false
        
        //установка constraits (ограничения)
        NSLayoutConstraint.activate([
            checkButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            checkButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 650),
            checkButton.widthAnchor.constraint(equalToConstant: 300),
            checkButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //MARK: - создание label & switch
        //создаем название кафе сверху
        //создаем текст для signUpLabel
        cafeMarioLabel.text = "Cafe Mario"
        //создаем размер шрифта
        cafeMarioLabel.font = UIFont.boldSystemFont(ofSize: 30)
        //располагаем signUpLabel
        //cafeMarioLabel.frame = CGRect(x: 120, y: 70, width: 100, height: 50)
        //метод для того, чтобы текст полностью был виден
        cafeMarioLabel.sizeToFit()
        //добавляем на view
        view.addSubview(cafeMarioLabel)
        //отключаю автоматические constrait
        cafeMarioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //установить contstrait
        NSLayoutConstraint.activate([
            cafeMarioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cafeMarioLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            cafeMarioLabel.widthAnchor.constraint(equalToConstant: 150),
            cafeMarioLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        //-настройка nameLabel
        //создаем текст для nameLabel
        nameLabel.text = "ФИО"
        //создаем размер шрифта и делаем шрифт жирнее
        nameLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        //располагаем signUpLabel
        nameLabel.frame = CGRect(x: 50, y: 150, width: 100, height: 50)
        //цвет текста
        nameLabel.textColor = .systemRed
        //метод для того, чтобы текст полностью был виден
        //emailLabel.sizeToFit()
        //добавляем на view
        view.addSubview(nameLabel)
        
        //настройка guestLabel
        //создаем текст для guestLabel
        guestLabel.text = "Количество гостей"
        //создаем размер шрифта и делаем шрифт жирнее
        guestLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        //располагаем signUpLabel
        guestLabel.frame = CGRect(x: 50, y: 250, width: 100, height: 50)
        //цвет текста
        guestLabel.textColor = .systemRed
        //метод для того, чтобы текст полностью был виден
        guestLabel.sizeToFit()
        //добавляем на view
        view.addSubview(guestLabel)
        
        //настройка tableNumberLabel
        //создаем текст для tableNumberLabel
        tableNumberLabel.text = "Номер стола"
        //создаем размер шрифта и делаем шрифт жирнее
        tableNumberLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        //располагаем signUpLabel
        tableNumberLabel.frame = CGRect(x: 50, y: 335, width: 100, height: 50)
        //цвет текста
        tableNumberLabel.textColor = .systemRed
        //метод для того, чтобы текст полностью был виден
        tableNumberLabel.sizeToFit()
        //добавляем на view
        view.addSubview(tableNumberLabel)
        
        //настройка bookingLabel
        //создаем текст для bookingLabel
        bookingLabel.text = "Бронировали стол?"
        //создаем размер шрифта и делаем шрифт жирнее
        bookingLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        //располагаем signUpLabel
        bookingLabel.frame = CGRect(x: 60, y: 510, width: 100, height: 50)
        //цвет текста
        bookingLabel.textColor = .systemRed
        //метод для того, чтобы текст полностью был виден
        bookingLabel.sizeToFit()
        //добавляем на view
        view.addSubview(bookingLabel)
        
        //добавляем switch
        bookingSwitch.frame = CGRect(x: 260, y: 505, width: 100, height: 50)
        //добавить на view
        view.addSubview(bookingSwitch)
        
        //настройка prepaymentLabel
        //создаем текст для prepaymentLabel
        prepaymentLabel.text = "Предоплата?"
        //создаем размер шрифта и делаем шрифт жирнее
        prepaymentLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        //располагаем signUpLabel
        prepaymentLabel.frame = CGRect(x: 60, y: 560, width: 100, height: 50)
        //цвет текста
        prepaymentLabel.textColor = .systemRed
        //метод для того, чтобы текст полностью был виден
        prepaymentLabel.sizeToFit()
        //добавляем на view
        view.addSubview(prepaymentLabel)
        
        //добавляем switch
        prepaymentSwitch.frame = CGRect(x: 260, y: 555, width: 100, height: 50)
        //добавить на view
        view.addSubview(prepaymentSwitch)
        
        //настройка vipLabel
        //создаем текст для vipLabel
        vipLabel.text = "VIP комната?"
        //создаем размер шрифта и делаем шрифт жирнее
        vipLabel.font = .systemFont(ofSize: 15, weight: .heavy)
        //располагаем signUpLabel
        vipLabel.frame = CGRect(x: 60, y: 610, width: 100, height: 50)
        //цвет текста
        vipLabel.textColor = .systemRed
        //метод для того, чтобы текст полностью был виден
        vipLabel.sizeToFit()
        //добавляем на view
        view.addSubview(vipLabel)
        
        //добавляем switch
        vipSwitch.frame = CGRect(x: 260, y: 605, width: 100, height: 50)
        //добавить на view
        view.addSubview(vipSwitch)
        
        
        //MARK: - создание textField
        
        //textField для name
        //вызов экземпляра класса
        nameTextField = UITextField()
        //отключаю автоматические constrait
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        //назначаю цвет фона
        nameTextField.backgroundColor = .white
        //закругляю края
        nameTextField.borderStyle = .roundedRect
        //надпись внутри поля
        nameTextField.placeholder = "Введите ФИО"
        
        //добавляю на view
        view.addSubview(nameTextField)
        
        //установить contstrait
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -6),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //guestTextField для
        //вызов экземпляра класса
        guestTextField = UITextField()
        //отключаю автоматические constrait
        guestTextField.translatesAutoresizingMaskIntoConstraints = false
        //назначаю цвет фона
        guestTextField.backgroundColor = .white
        //закругляю края
        guestTextField.borderStyle = .roundedRect
        //надпись внутри поля
        guestTextField.placeholder = "Введите количество гостей"
        
        //добавляю на view
        view.addSubview(guestTextField)
        
        //установить contstrait
        NSLayoutConstraint.activate([
            guestTextField.topAnchor.constraint(equalTo: guestLabel.bottomAnchor, constant: 10),
            guestTextField.leadingAnchor.constraint(equalTo: guestLabel.leadingAnchor),
            guestTextField.widthAnchor.constraint(equalToConstant: 300),
            guestTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //tableNumberTextField для
        //вызов экземпляра класса
        tableNumberTextField = UITextField()
        //отключаю автоматические constrait
        tableNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        //назначаю цвет фона
        tableNumberTextField.backgroundColor = .white
        //закругляю края
        tableNumberTextField.borderStyle = .roundedRect
        //надпись внутри поля
        tableNumberTextField.placeholder = "Введите номер стола"
        //добавляю на view
        view.addSubview(tableNumberTextField)
        //установить contstrait
        NSLayoutConstraint.activate([
            tableNumberTextField.topAnchor.constraint(equalTo: tableNumberLabel.bottomAnchor, constant: 10),
            tableNumberTextField.leadingAnchor.constraint(equalTo: tableNumberLabel.leadingAnchor),
            tableNumberTextField.widthAnchor.constraint(equalToConstant: 300),
            tableNumberTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    //MARK: - обработчик нажатия на кнопку "checkButton"
    //устанавливаем связь для перехода на следуюший view после нажатия на "checkButton"
    
    //        @objc private func didTapCheckButton() {
    //            let thirdVC = UIViewController()
    //            thirdVC.view.backgroundColor = .white
    //            navigationController?.pushViewController(thirdVC, animated: true)
    //        }
    
    //MARK: - обработчик нажатия на кнопку "Back"
    //устанавливаем связь для перехода на следуюший view после нажатия на "checkButton"
    @objc private func goBack() {
        dismiss(animated: true)
    }
    
    func didTapCheckButtonForAlert() {
        let rootVC = ThirdViewController()
        let thirdVC = UINavigationController(rootViewController: rootVC)
        //метод, который отображает второй экран полностью(не как карту)
        thirdVC.modalPresentationStyle = .fullScreen
        present(thirdVC, animated: true)
        
    }
    
    @objc func didTapCheckButton() {
        //имя контроллера
        
        let alertController = UIAlertController(
            title: "Выставить чек?",
            message: nil,
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Выставить", style: .default, handler: { [weak self] _ in
            self?.didTapCheckButtonForAlert()
            
        }))
        present(alertController, animated: true)
    }
}

//MARK: - создание третьего ThirdViewController

class ThirdViewController: UIViewController {
    
    //MARK: - Создаем константы для третьего экрана
    //создаем кнопку "итого"
    private let sumButton = UIButton()
    //создаем лейблы для третьего экрана
    private let checkLabel = UILabel()
    private let nameLabel = UILabel()
    
    //MARK: - ViewDidLoad method 3
    override func viewDidLoad() {
        super.viewDidLoad()
        //назначаем цвет фона ThirdViewController
        view.backgroundColor = .white
        
        
        //делаем переход со 2 экрана на 1
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(goBack))
        
        //название кнопки входа
        sumButton.setTitle("итого: ", for: .normal)
        //добавляем кнопку на view
        view.addSubview(sumButton)
        //закругляем кнопку
        sumButton.layer.cornerRadius = 12
        //меняем шрифт и делаем его жирным
        sumButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        //назначаем цвет на кнопку
        sumButton.backgroundColor = .systemGreen
        //назначаем цвет текста
        sumButton.setTitleColor(.white, for: .normal)
        //отключаем автоматическое добавление системных ограничений (constraits)
        sumButton.translatesAutoresizingMaskIntoConstraints = false
        //установка constraits (ограничения)
        NSLayoutConstraint.activate([
            sumButton.centerXAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -150),
            sumButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 650),
            sumButton.widthAnchor.constraint(equalToConstant: 210),
            sumButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        //MARK: - создание label
        //создаем название кафе сверху
        //создаем текст для signUpLabel
        checkLabel.text = "Чек"
        //создаем размер шрифта
        checkLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        //располагаем signUpLabel
        //checkLabel.frame = CGRect(x: 120, y: 70, width: 100, height: 50)
        //метод для того, чтобы текст полностью был виден
        checkLabel.sizeToFit()
        //добавляем на view
        view.addSubview(checkLabel)
        //отключаю автоматические constrait
        checkLabel.translatesAutoresizingMaskIntoConstraints = false
        //установить contstrait
        NSLayoutConstraint.activate([
            checkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            checkLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    //MARK: - обработчик нажатия на кнопку "Back"
    //устанавливаем связь для перехода на следуюший view после нажатия на "checkButton"
    @objc private func goBack() {
        dismiss(animated: true)
    }
}




