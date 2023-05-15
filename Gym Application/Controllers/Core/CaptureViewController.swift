import UIKit

class CaptureViewController: UIViewController {
    
    // MARK: - UI Components
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let headerView = Header(title: "Let's Get To Know More", subTitle: "Tell Us Your Physical Attributes And Habits")
    private let heightLabel = LabelView(title: "Height:")
    private let weightLabel = LabelView(title: "Weight:")
    private let height = CustomTextField(fieldType: .height)
    private let weight = CustomTextField(fieldType: .weight)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .black
        
        // Add scrollView and contentView
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // Add UI components to contentView
        contentView.addSubview(headerView)
        contentView.addSubview(heightLabel)
        contentView.addSubview(height)
        contentView.addSubview(weightLabel)
        contentView.addSubview(weight)
        
        // Disable autoresizing mask translation for flexible constraints
        [scrollView, contentView, headerView, heightLabel, height, weightLabel, weight].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        // Set scrollView and contentView constraints
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            headerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -90),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 222),
            
            heightLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor,constant: 80),
            heightLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -90),
            heightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            heightLabel.heightAnchor.constraint(equalToConstant: 55),
            
            height.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 70),
            height.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            height.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            height.heightAnchor.constraint(equalToConstant: 55),
            
            weightLabel.topAnchor.constraint(equalTo: height.bottomAnchor, constant: 20),
            weightLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weightLabel.heightAnchor.constraint(equalToConstant: 55),
        
            weightLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.85),
            weight.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 8),
            weight.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            weight.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            weight.heightAnchor.constraint(equalToConstant: 55)
                    ])
    }
    }
