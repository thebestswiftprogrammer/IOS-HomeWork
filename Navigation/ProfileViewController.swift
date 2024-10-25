import UIKit

struct PostSecond {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
}

class ProfileViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private let posts: [PostSecond] = [
        PostSecond(author: "Котолюб", description: "Милый котик ждет своей очереди к ветеринару.Милый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринаруМилый котик ждет своей очереди к ветеринару", image: "cat1", likes: 240, views: 312),
        PostSecond(author: "Собакалюб", description: "Собака учится плавать в озере.", image: "dog1", likes: 766, views: 893)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCell")
        
        // Настройки для автоматической высоты ячеек
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        // Устанавливаем ProfileHeaderView как headerView для таблицы
        let headerView = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 220))
        tableView.tableHeaderView = headerView
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            return UITableViewCell()
        }
        
        let post = posts[indexPath.row]
        cell.configure(with: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}

class PostTableViewCell: UITableViewCell {
    
    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentStackView.addArrangedSubview(authorLabel)
        contentStackView.addArrangedSubview(postImageView)
        
        contentView.addSubview(contentStackView)
        contentView.addSubview(descriptionLabel)

        bottomStackView.addArrangedSubview(likesLabel)
        bottomStackView.addArrangedSubview(viewsLabel)
        
        contentView.addSubview(bottomStackView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 16),
            
            bottomStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bottomStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bottomStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            bottomStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            postImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    
    func configure(with post: PostSecond) {
        authorLabel.text = post.author
        authorLabel.textColor = .black
        
        descriptionLabel.text = post.description
        
        postImageView.image = UIImage(named: post.image)
        
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }
}

