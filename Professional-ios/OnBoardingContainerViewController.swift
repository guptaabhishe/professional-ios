
import UIKit

protocol OnboardingContainerViewControllerDelegate : AnyObject {
    func didCompleteOnBoarding()
}

class OnboardingContainerViewController:UIViewController{
    var viewControllers :[UIViewController] = []
    var pageViewController = UIPageViewController()
    var index:Int = 0
    var closeButton = UIButton(type: .system)
    weak var delegate : OnboardingContainerViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUp()
        style()
        layout()
        
    }
    
    private func setUp() {
        let viewC1 = OnBoardingViewController(imageName: "delorean", text: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
        let viewC2 = OnBoardingViewController(imageName: "thumbs", text: "Learn more at www.bankey.com.")
        let viewC3 = OnBoardingViewController(imageName: "world", text: "Move your money around the world quickly and securely.")
        viewControllers.append(viewC1)
        viewControllers.append(viewC3)
        viewControllers.append(viewC2)
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.didMove(toParent: self)
        pageViewController.dataSource = self
    }
    private func style(){
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: false,completion: nil)
        let pageControl = UIPageControl.appearance()
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .systemMint
        
        closeButton.setTitle("Close", for: [])
        closeButton.titleLabel?.font = .systemFont(ofSize: 20)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    private func layout(){
        view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        addChild(pageViewController)
        
        view.addSubview(pageViewController.view)
        view.addSubview(closeButton)
        
        pageViewController.view.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
          
        ])
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        ])
    }
}


extension OnboardingContainerViewController:UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let ind = viewControllers.firstIndex(of: viewController) , ind-1 >= 0 else{
           return nil
        }
        return viewControllers[ind-1]
}

func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    let size:Int = viewControllers.count
    guard let ind = viewControllers.firstIndex(of: viewController) , ind+1 < size else{
       return nil
    }
    return viewControllers[ind+1]
}
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return viewControllers.firstIndex(of: pageViewController) ?? 0
    }

}

extension OnboardingContainerViewController {
    @objc func closeButtonTapped(_ for:UIButton){
        //print("The close Button Tapped")
        delegate?.didCompleteOnBoarding()
    }
}



class viewController1:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

class viewController2:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
}

class viewController3:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
}

