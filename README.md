<h1 align="center" style="font-weight: bold;">Trello Clone Backend API 💻</h1>

<p align="center">
 <a href="#tech">Technologies</a> • 
 <a href="#started">Getting Started</a> • 
  <a href="#routes">API Endpoints</a> •
 <a href="#colab">Collaborators</a> •
 <a href="#contribute">Contribute</a>
</p>

<p align="center">
    <b>Backend RESTful API cho ứng dụng Trello Clone, hỗ trợ xác thực OAuth2, quản lý bảng, thẻ, phân quyền chi tiết và tích hợp Docker.</b>
</p>

<h2 id="tech">💻 Technologies</h2>

Dự án này được xây dựng dựa trên các công nghệ sau:

- Node.js & Express.js
- TypeScript
- PostgreSQL (với TypeORM)
- Redis
- Docker & Docker Compose
- JSON Web Tokens (JWT) & Passport.js (Google OAuth2)
- Cloudinary & Multer (Lưu trữ file đính kèm)
- Nodemailer
- Swagger UI

<h2 id="started">🚀 Getting started</h2>

Dưới đây là hướng dẫn để cài đặt và chạy dự án ở môi trường máy tính cục bộ (local).

<h3>Prerequisites</h3>

Để chạy dự án, hệ thống của bạn cần cài đặt sẵn:

- [NodeJS](https://nodejs.org/) (phiên bản 20+)
- [Git](https://git-scm.com/)
- [Docker](https://www.docker.com/) và Docker Compose (Khuyên dùng)
- PostgreSQL và Redis (Nếu không sử dụng Docker)

<h3>Cloning</h3>

Đầu tiên, clone dự án về máy:

```bash
git clone https://github.com/chiennguyencoder/trello-clone-backend.git
cd backend
```

<h3>Config .env variables</h3>

Tạo file `.env` ở thư mục gốc để chứa các biến môi trường cấu hình hệ thống:

```yaml
NODE_ENV=development
PORT=3000

POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_db_password
POSTGRES_DB=dbtrello
DB_HOST=localhost
DATABASE_PORT=5432

REDIS_HOST=redis
REDIS_PORT=6379

ACCESS_TOKEN_SECRET=your_jwt_secret
REFRESH_TOKEN_SECRET=your_jwt_refresh_secret

GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
GOOGLE_REDIRECT_URI=http://localhost:3000/api/auth/google/callback

CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_cloudinary_api_key
CLOUDINARY_API_SECRET=your_cloudinary_api_secret

SMTP_USER=your_email@gmail.com
SMTP_PASS=your_app_password
```

<h3>Starting</h3>

Cách khởi chạy dự án:

**Cách 1: Sử dụng Docker (Khuyên dùng):**
Hệ thống bao gồm API, Database và Redis sẽ được thiết lập tự động.

```bash
docker compose up -d --build
```

**Cách 2: Chạy trực tiếp trên máy local (Không Docker):**

```bash
npm install
npm run dev
```

**Seed Dữ Liệu (Tùy chọn):**
Dự án có sẵn script khởi tạo dữ liệu mẫu.

```bash
npm run seed:all
```

_Ghi chú: Mật khẩu mặc định cho các tài khoản test là `Test@123456`._

<h2 id="routes">📍 API Endpoints</h2>

Dưới đây là một số endpoints minh họa của ứng dụng. (Tài liệu Swagger UI đầy đủ nằm tại `/api-docs`).

| Endpoint                           | Mô tả                                                                |
| ---------------------------------- | -------------------------------------------------------------------- |
| <kbd>POST /api/auth/login</kbd>    | Đăng nhập vào hệ thống                                               |
| <kbd>POST /api/auth/register</kbd> | Đăng ký tài khoản mới                                                |
| <kbd>POST /api/auth/logout</kbd>   | Đăng xuất người dùng                                                 |
| <kbd>GET /api/users/me</kbd>       | Lấy thông tin người dùng hiện tại                                    |
| <kbd>GET /api/workspaces</kbd>     | Truy xuất danh sách workspace của user                               |
| <kbd>POST /api/workspaces</kbd>    | Tạo mới workspace                                                    |
| <kbd>GET /api/boards/:id</kbd>     | Lấy thông tin chi tiết một bảng                                      |
| <kbd>POST /api/boards</kbd>        | Tạo mới một bảng                                                     |
| <kbd>GET /api/lists</kbd>          | Lấy tất cả danh sách (list) trong một bảng                           |
| <kbd>POST /api/lists</kbd>         | Tạo mới danh sách                                                    |
| <kbd>GET /api/cards/:id</kbd>      | Lấy thông tin chi tiết thẻ (card)                                    |
| <kbd>POST /api/cards</kbd>         | Tạo mới một thẻ                                                      |
| <kbd>PUT /api/cards/:id</kbd>      | Cập nhật thông tin thẻ (tiêu đề, mô tả, vị trí...)                   |
| <kbd>DELETE /api/cards/:id</kbd>   | Xóa một thẻ                                                          |
| <kbd>POST /api/comments</kbd>      | Thêm bình luận vào thẻ                                               |

<h2 id="contribute">📫 Contribute</h2>

Để đóng góp vào dự án, bạn có thể thực hiện theo các bước sau:

1. `git clone https://github.com/chiennguyencoder/trello-clone-backend.git`
2. `git checkout -b feature/NAME_FEATURE`
3. Tuân thủ commit pattern của dự án
4. Mở một Pull Request giải thích rõ tính năng mới hoặc lỗi đã sửa. Ghi chú các thay đổi và chờ code review!

<h3>Documentations that might help</h3>

[📝 How to create a Pull Request](https://www.atlassian.com/br/git/tutorials/making-a-pull-request)

[💾 Commit pattern](https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716)
