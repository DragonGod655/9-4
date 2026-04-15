# System Design: E-Commerce BDD/Cucumber Demo

## 1. Architecture
- **Language:** Java
- **Framework:** Cucumber BDD, JUnit
- **Build Tool:** Maven

## 2. BCE Pattern (Boundary - Control - Entity)
Hệ thống được cân nhắc cấu trúc theo mô hình BCE nhằm phân tách rõ ràng luồng tương tác, logic nghiệp vụ chuyên sâu và các đối tượng dữ liệu.

```mermaid
%%{init: {'theme': 'base', 'themeVariables': { 'primaryColor': '#ffffff'}}}%%
classDiagram
    direction LR

    %% BOUNDARY
    namespace Boundary_B {
        class AdminSteps
        class CustomerSteps
        class GuestSteps
    }

    %% CONTROL
    namespace Control_C {
        class ProductService
        class CategoryService
        class UserService
        class OrderService
        class CartService
    }

    %% ENTITY
    namespace Entity_E {
        class Product
        class Category
        class User
        class Order
        class OrderItem
        class Cart
    }

    AdminSteps --> ProductService : request
    AdminSteps --> CategoryService : request
    AdminSteps --> UserService : request
    AdminSteps --> OrderService : request

    CustomerSteps --> OrderService : checkout()

    GuestSteps --> ProductService : view()
    GuestSteps --> CartService : manage()
    GuestSteps --> UserService : register()

    ProductService --> Product : manipulates
    CategoryService --> Category : manipulates
    UserService --> User : manipulates
    OrderService --> Order : manipulates
    OrderService --> OrderItem : manipulates
    CartService --> Cart : manipulates
```
## 3. Class Diagram (Cấu trúc Entities và Data Models)

```mermaid
classDiagram
    direction TB

    class User {
        +String id
        +String email
        +String password
        +String role
    }

    class Product {
        +String id
        +String name
        +double price
        +String description
        +String categoryId
    }

    class Category {
        +String id
        +String name
    }

    class Order {
        +String id
        +String userId
        +Date orderDate
        +double totalAmount
        +calculateTotal()
    }

    class OrderItem {
        +String productId
        +int quantity
        +double price
    }

    class Cart {
        +Map~String, Integer~ items
        +addProduct(productId, quantity)
        +updateQuantity(productId, quantity)
        +removeProduct(productId)
    }

    User "1" -- "*" Order : places
    Order "1" *-- "*" OrderItem : contains
    OrderItem "*" -- "1" Product : details
    Product "*" -- "1" Category : belongs to
```

## 4. Sequence Diagrams
Dưới đây là một số luồng Sequence Diagram điển hình phản ánh trực tiếp quá trình kết nối B-C-E.

### 4.1. Admin Thêm Sản Phẩm Mới
```mermaid
sequenceDiagram
    actor Admin
    participant Boundary as AdminSteps (B)
    participant Control as ProductService (C)
    participant DB as List/DB (E)

    Admin->>Boundary: Nhập thông tin SP\n(Tên, Giá)
    Boundary->>Control: addProduct(name, price)
    
    alt Đầy đủ thông tin
        Control->>DB: save(new Product)
        DB-->>Control: success
        Control-->>Boundary: result = true
        Boundary-->>Admin: Xác nhận thêm thành công (Assert)
    else Thiếu thông tin
        Control-->>Boundary: error / false
        Boundary-->>Admin: Báo lỗi thông tin (Assert Error)
    end
```

### 4.2. Guest Đăng ký Tài Khoản
```mermaid
sequenceDiagram
    actor Guest
    participant Boundary as GuestSteps (B)
    participant Control as UserService (C)
    participant DB as List/DB (E)

    Guest->>Boundary: Đăng ký\n(email, password)
    Boundary->>Control: registerUser(email, password)
    Control->>DB: checkExists(email)
    
    alt Đã tồn tại
        DB-->>Control: true
        Control-->>Boundary: Error: Email exists
        Boundary-->>Guest: Lỗi đăng ký (Assert Mismatch)
    else Hợp lệ
        DB-->>Control: false
        Control->>DB: save(User)
        DB-->>Control: success
        Control-->>Boundary: OK
        Boundary-->>Guest: Đăng ký thành công (Assert Match)
    end
```

### 4.3. Customer Thực Hiện Thanh Toán Phức Tạp
```mermaid
sequenceDiagram
    actor Customer
    participant Boundary as CustomerSteps (B)
    participant Cart as CartSession (E)
    participant Control as OrderService (C)
    participant DB as List/DB (E)

    Customer->>Boundary: Yêu cầu thanh toán
    Boundary->>Cart: getItems()
    Cart-->>Boundary: Map<Product, qty>
    
    alt Giỏ có sản phẩm
        Boundary->>Control: checkout(userId, CartItems)
        Control->>DB: insert(new Order)
        DB-->>Control: success
        Control->>Cart: clear()
        Control-->>Boundary: OK (Trigger Email)
        Boundary-->>Customer: Hoàn tất (Assert True)
    else Giỏ trống
        Boundary->>Control: checkout(userId, Empty)
        Control-->>Boundary: Error: No items
        Boundary-->>Customer: Cảnh báo rỗng (Assert False)
    end
```