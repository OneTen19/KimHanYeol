import UIKit
import SnapKit

class TossReviewStatusView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var firstSection: UIView = {
        let view = UIView()
        
        let firstLabel = UILabel()
        firstLabel.text = "평가 및 리뷰"
        firstLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        
        let secondLabel = UILabel()
        secondLabel.text = "4.4"
        secondLabel.font = .systemFont(ofSize: 60, weight: .semibold)
        
        let thirdLabel = UILabel()
        thirdLabel.text = "5점 만점"
        thirdLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        thirdLabel.textColor = .gray
        
        view.addSubview(firstLabel)
        view.addSubview(secondLabel)
        view.addSubview(thirdLabel)
        
        firstLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom)
            $0.centerX.equalTo(firstLabel)
        }
        
        thirdLabel.snp.makeConstraints {
            $0.top.equalTo(secondLabel.snp.bottom)
            $0.centerX.equalTo(firstLabel)
        }
        
        return view
    }()
    
    private lazy var viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(viewAllButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var secondSection: UIView = {
        let view = UIView()
        
        // 별 개수만큼 쌓기
        func createStarStackView(count: Int) -> UIStackView {
            let starStackView = UIStackView()
            starStackView.axis = .horizontal
            
            for _ in 0..<count {
                let star = UIImageView(image:UIImage(systemName: "star.fill")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 10)))
                star.contentMode = .scaleAspectFit
                star.tintColor = .gray
                starStackView.addArrangedSubview(star)
            }
            
            return starStackView
        }
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .trailing
        
        for count in 1..<6 {
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            
            let starStackView = createStarStackView(count: 6-count)
            
            let progressView = UIProgressView()
            progressView.trackTintColor = .gray.withAlphaComponent(0.2)
            progressView.tintColor = .gray
            progressView.progress = 1.0 - Float(count)/10
                        
            horizontalStack.addArrangedSubview(starStackView)
            horizontalStack.addArrangedSubview(progressView)
            
            starStackView.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(20)
                $0.height.equalTo(8)
            }
            
            progressView.snp.makeConstraints {
                $0.trailing.equalToSuperview()
                $0.width.equalTo(150)
                $0.height.equalTo(8)
            }
            
            stackView.addArrangedSubview(horizontalStack)
        }
        
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        
        [label, stackView].forEach { view.addSubview($0) }
        
        label.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        return view
    }()
    
    private func setUI() {
        self.addSubview(firstSection)
        self.addSubview(secondSection)
        self.addSubview(viewAllButton)
        
        firstSection.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(120)
        }
        
        viewAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        secondSection.snp.makeConstraints {
            $0.leading.equalTo(firstSection.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.top.equalTo(viewAllButton.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        

    }
    
    func viewController() -> UIViewController? {
        var nextResponder: UIResponder? = self
        while let responder = nextResponder {
            if let vc = responder as? UIViewController {
                return vc
            }
            nextResponder = responder.next
        }
        return nil
    }
    
    @objc private func viewAllButtonTapped() {
        guard let viewController = viewController() else { return }
        let nextViewController = TossExtraReviewViewController()
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
