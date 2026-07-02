# 🛋️ Airtual Showroom - Furniture E-Commerce Platform

A comprehensive Flutter-based furniture online shopping application that bridges suppliers and customers through a modern, user-friendly marketplace. Airtual Showroom enables suppliers to showcase their furniture products and customers to browse, compare, and purchase items seamlessly.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Installation & Setup](#installation--setup)
- [Usage](#usage)
  - [For Customers](#for-customers)
  - [For Suppliers](#for-suppliers)
- [Architecture](#architecture)
- [Key Components](#key-components)
- [Firebase Integration](#firebase-integration)
- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
- [Development](#development)
- [Future Enhancements](#future-enhancements)
- [Contributing](#contributing)
- [License](#license)

---

## 🎯 Overview

**Airtual Showroom** is a dual-role e-commerce platform built with Flutter that allows:

- **Customers** to browse furniture across 8+ categories (beds, chairs, tables, desks, couches, bookcases, cabinetry, and more)
- **Suppliers** to manage their digital storefront, upload products, track orders, and monitor business metrics
- **Real-time** inventory updates and order management through Firebase
- **Wishlist & Cart** functionality for an enhanced shopping experience

The app is designed to work on both Android and iOS devices, providing a unified shopping and selling experience across platforms.

---

## ✨ Features

### 👥 Customer Features
- **User Authentication**: Secure signup and login with Firebase Auth
- **Product Browsing**: Browse furniture across 8 category galleries
- **Search & Filter**: Find products by category, price, and supplier
- **Product Details**: View detailed product information, images, and availability
- **Shopping Cart**: Add/remove items, manage quantities, view total price
- **Wishlist**: Save favorite items for later purchase
- **Order Tracking**: View order history and status
- **User Profile**: Manage account information and delivery addresses
- **Responsive UI**: Optimized for various device sizes

### 🏪 Supplier Features
- **Business Setup**: Create and manage supplier account with business details
- **Product Management**: 
  - Upload products with multiple images
  - Edit product details (name, price, description, stock)
  - Manage inventory and availability
  - Delete outdated products
- **Dashboard Analytics**:
  - View total sales and revenue
  - Monitor order statistics
  - Track business performance
  - View balance and earnings
- **Order Management**: View and process customer orders
- **Store Management**: Edit business profile and store information
- **Statics & Reports**: Track sales trends and performance metrics

---

## 🔧 Tech Stack

### Frontend Framework
- **Flutter** (Dart) - Cross-platform mobile development
- **Material Design** - UI/UX framework

### Backend & Services
- **Firebase Authentication** - User login and signup
- **Firestore Database** - Real-time product and order data
- **Firebase Storage** - Product image hosting
- **Firebase Realtime Database** - Optional for real-time updates

### State Management
- **Provider** (v6.0.4) - Reactive state management pattern
- **ChangeNotifier** - For cart and wishlist state

### Key Libraries
| Library | Version | Purpose |
|---------|---------|---------|
| `firebase_core` | 2.1.1 | Firebase initialization |
| `firebase_auth` | 4.1.1 | User authentication |
| `cloud_firestore` | 4.0.4 | Data persistence |
| `firebase_storage` | 11.0.4 | Image/file storage |
| `provider` | 6.0.4 | State management |
| `image_picker` | 0.8.5+3 | Camera/gallery access |
| `flutter_swiper_null_safety` | 1.0.2 | Image carousel |
| `staggered_grid_view_flutter` | 0.0.4 | Dynamic grid layouts |
| `uuid` | 3.0.6 | Unique identifiers |
| `badges` | 2.0.3 | Badge notifications |
| `font_awesome_flutter` | 10.2.1 | Icon library |
| `cupertino_icons` | 1.0.2 | iOS-style icons |

---

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point & routing
├── app.dart                           # App configuration
├── firebase_options.dart              # Firebase configuration
│
├── auth/                              # Authentication screens
│   ├── customer_login.dart            # Customer login screen
│   ├── customer_signup.dart           # Customer registration
│   ├── supplier_login.dart            # Supplier login screen
│   └── supplier_signup.dart           # Supplier registration
│
├── main_screens/                      # Core app screens
│   ├── welcome_screen.dart            # Role selection & entry point
│   ├── customer_home.dart             # Customer app shell (BottomNavBar)
│   ├── supplier_home.dart             # Supplier app shell
│   ├── home.dart                      # Product gallery with category tabs
│   ├── category.dart                  # Category selection screen
│   ├── cart.dart                      # Shopping cart screen
│   ├── stores.dart                    # Supplier store listing
│   ├── profile.dart                   # User profile management
│   ├── dashboard.dart                 # Supplier dashboard
│   └── upload_product.dart            # Product upload form
│
├── models/                            # Data models & display widgets
│   ├── product_model.dart             # Product card widget
│   ├── cart_model.dart                # Cart item structure
│   └── wish_model.dart                # Wishlist item structure
│
├── providers/                         # State management (Provider pattern)
│   ├── cart_provider.dart             # Cart state (ChangeNotifier)
│   ├── wish_provider.dart             # Wishlist state
│   └── product_class.dart             # Product data class
│
├── customer_screens/                  # Customer-specific features
│   ├── wishlist.dart                  # Saved items display
│   └── customers_orders.dart          # Order history
│
├── galleries/                         # Product category galleries
│   ├── beds_gallery.dart              # Beds category
│   ├── bookcases_gallery.dart         # Bookcases category
│   ├── cabinetry_gallery.dart         # Cabinetry category
│   ├── chairs_gallery.dart            # Chairs category
│   ├── couch_gallery.dart             # Couches category
│   ├── desks_gallery.dart             # Desks category
│   ├── tables_gallery.dart            # Tables category
│   └── others_gallery.dart            # Other furniture
│
├── dashboard_components/              # Supplier admin tools
│   ├── edit_business.dart             # Edit supplier profile
│   ├── manage_products.dart           # Product management
│   ├── supl_balance.dart              # Balance & earnings
│   ├── supl_order.dart                # Order management
│   └── supl_statics.dart              # Sales analytics
│
├── minor_screens/                     # Secondary screens
│   └── product_details.dart           # Detailed product view
│
├── widgets/                           # Reusable UI components
│   ├── auth_widgets.dart              # Login/signup form fields
│   ├── appbar_widgets.dart            # Custom AppBar components
│   ├── categ_widgets.dart             # Category widgets
│   ├── red_button.dart                # Primary action button
│   ├── yellow_button.dart             # Secondary action button
│   ├── fake_search.dart               # Search bar widget
│   ├── alert_dialog.dart              # Confirmation dialogs
│   └── snackbar.dart                  # Toast notifications
│
├── utilities/                         # Helper functions & utilities
│
├── ARscreens/                         # AR features (future expansion)
│
├── categories/                        # Category data (future use)
│
└── images/                            # Asset images
    ├── beds/
    ├── bookcases/
    ├── cabinetry/
    ├── chairs/
    ├── couch/
    ├── desks/
    ├── tables/
    ├── inapp/
    └── guest.jpg
```

---

## 🚀 Installation & Setup

### Prerequisites
- **Flutter SDK**: 2.17.1 or higher
- **Dart**: 2.17.1 or higher
- **Android SDK** (for Android development) or **Xcode** (for iOS)
- **Firebase Project**: Create one at [console.firebase.google.com](https://console.firebase.google.com)

### Step 1: Clone Repository
```bash
git clone https://github.com/rathan-skr/airtual_showroom_proj.git
cd airtual_showroom_proj
```

### Step 2: Install Dependencies
```bash
flutter pub get
```

### Step 3: Firebase Setup
The Firebase configuration is already embedded in `lib/firebase_options.dart`:
- **Project ID**: `classicart-esoft`
- **Storage Bucket**: `classicart-esoft.appspot.com`

If you want to use your own Firebase project:
1. Create a Firebase project
2. Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
3. Replace the existing configuration in `firebase_options.dart`

### Step 4: Run the App

**Android:**
```bash
flutter run -d android
```

**iOS:**
```bash
flutter run -d ios
```

**Web:**
```bash
flutter run -d chrome
```

**Build Release:**
```bash
# Android APK
flutter build apk --release

# iOS App
flutter build ios --release

# Web
flutter build web --release
```

---

## 📱 Usage

### For Customers

1. **Launch App** → Welcome Screen
2. **Sign Up/Login** → Create customer account with email and password
3. **Browse Products**:
   - Tap on category tabs (Beds, Chairs, Tables, etc.)
   - Scroll through product galleries
   - Tap product to view details
4. **Add to Cart**: View product details and add quantity to cart
5. **Wishlist**: Heart icon to save favorite items
6. **Checkout**: Review cart, confirm order, proceed to payment
7. **Track Orders**: View order status in "Orders" section
8. **Profile**: Manage account, delivery addresses, and preferences

### For Suppliers

1. **Launch App** → Welcome Screen
2. **Sign Up/Login** → Create supplier account
3. **Access Dashboard**:
   - **My Store**: View your storefront
   - **Upload Products**: Add new furniture items with images and details
   - **Orders**: View and manage customer orders
   - **Edit Profile**: Update business information
   - **Manage Products**: Edit or delete existing products
   - **Balance**: Check earnings and revenue
   - **Analytics**: View sales statistics and trends

---

## 🏗️ Architecture

### State Management Pattern (Provider)

The app uses the **Provider Pattern** for state management:

```dart
// Cart Provider
class Cart extends ChangeNotifier {
  final List<Product> _list = [];
  
  void addItem(String name, double price, ...) {
    final product = Product(...);
    _list.add(product);
    notifyListeners(); // Rebuild listeners
  }
  
  double get totalPrice {
    // Calculate total dynamically
    return _list.fold(0.0, (sum, item) => sum + (item.price * item.qty));
  }
}

// Usage in Widget
context.read<Cart>().addItem(...); // Modify state
context.watch<Cart>().totalPrice;  // Rebuild on change
```

### Data Flow

```
┌─────────────────────────────────────────────┐
│         Firebase (Backend)                  │
│  • Firestore (Products, Orders, Users)      │
│  • Storage (Product Images)                 │
│  • Auth (User Authentication)               │
└──────────────┬──────────────────────────────┘
               │
        ┌──────▼──────┐
        │   Providers │
        │  (Cart, Wish)│
        └──────┬──────┘
               │
        ┌──────▼──────────────────┐
        │  Widget Tree (Flutter)  │
        │  • Screens              │
        │  • Widgets              │
        │  • UI Components        │
        └─────────────────────────┘
```

### Authentication Flow

```
WelcomeScreen
    ↓
[Customer/Supplier Role Selection]
    ↓
├─→ CustomerLogin/CustomerSignup → CustomerHomeScreen
│
└─→ SupplierLogin/SupplierSignup → SupplierHomeScreen → Dashboard
```

---

## 🔑 Key Components

### 1. **Cart System** (`providers/cart_provider.dart`)
- **Maintains** list of products in cart
- **Calculates** total price dynamically
- **Manages** quantity updates and item removal
- **Persists** state across navigation

```dart
class Cart extends ChangeNotifier {
  final List<Product> _list = [];
  
  double get totalPrice {
    var total = 0.0;
    for (var item in _list) {
      total += item.price * item.qty;
    }
    return total;
  }
}
```

### 2. **Wishlist System** (`providers/wish_provider.dart`)
- **Stores** favorite items
- **Allows** adding/removing items
- **Syncs** with product availability

### 3. **Product Model** (`models/product_model.dart`)
- **Displays** products as cards
- **Shows** product image, name, price
- **Handles** wishlist toggling
- **Supports** product detail navigation

### 4. **Authentication** (`auth/`)
- **Firebase Auth** integration
- **Separate** flows for customers and suppliers
- **Secure** signup with validation
- **Role-based** routing after login

### 5. **Dashboard** (`main_screens/dashboard.dart`)
- **Grid-based** layout for supplier tools
- **Quick access** to all admin functions
- **Order management**, analytics, and product uploads

---

## 🔗 Firebase Integration

### Collections & Documents

**Firestore Structure:**
```
firestore/
├── customers/
│   └── [uid]
│       ├── email
│       ├── name
│       ├── phone
│       └── addresses
│
├── suppliers/
│   └── [uid]
│       ├── businessName
│       ├── email
│       ├── phone
│       ├── storeDescription
│       └── location
│
├── products/
│   └── [productId]
│       ├── proname (product name)
│       ├── price
│       ├── proimages (array)
│       ├── instock (quantity)
│       ├── sid (supplier ID)
│       ├── proid (product ID)
│       └── category
│
└── orders/
    └── [orderId]
        ├── customerId
        ├── supplierId
        ├── items (array)
        ├── totalPrice
        ├── status
        └── timestamp
```

### Storage Structure
```
storage/
└── products/
    └── [supplierId]/
        └── [productId]/
            ├── image_0.jpg
            ├── image_1.jpg
            └── ...
```

### Authentication
- **Email/Password** authentication via Firebase Auth
- **Separate** user collections for customers and suppliers
- **Role** determined at signup and stored in user profile

---

## 📦 Dependencies

### Core Dependencies
```yaml
flutter:
  sdk: flutter

firebase_core: ^2.1.1
firebase_auth: ^4.1.1
cloud_firestore: ^4.0.4
firebase_storage: ^11.0.4

provider: ^6.0.4
uuid: ^3.0.6
```

### UI/UX Dependencies
```yaml
cupertino_icons: ^1.0.2
font_awesome_flutter: ^10.2.1
flutter_swiper_null_safety: ^1.0.2
staggered_grid_view_flutter: ^0.0.4
badges: ^2.0.3
image_picker: ^0.8.5+3
```

### Development Dependencies
```yaml
flutter_test:
  sdk: flutter
flutter_lints: ^2.0.0
```

---

## 🎮 Getting Started

### Quick Start for Development

1. **Clone and setup:**
   ```bash
   git clone https://github.com/rathan-skr/airtual_showroom_proj.git
   cd airtual_showroom_proj
   flutter pub get
   ```

2. **Run on emulator:**
   ```bash
   flutter run
   ```

3. **Test customer flow:**
   - Tap "Customer" → Sign up with email
   - Browse products in Home tab
   - Add items to cart
   - View wishlist

4. **Test supplier flow:**
   - Tap "Supplier" → Sign up with business details
   - Go to Dashboard
   - Upload products with images
   - View order statistics

### Hot Reload
```bash
# Press 'r' during flutter run
# or use keyboard shortcut
flutter run -d <device_id>
```

---

## 🛠️ Development

### Code Style
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` to check code quality
- Format code with `flutter format lib/`

```bash
# Analyze code
flutter analyze

# Format code
flutter format lib/

# Check for issues
flutter doctor
```

### Testing
```bash
# Run tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Debugging
```bash
# Run with debug logs
flutter run -v

# Connect to debugger
flutter attach
```

---

## 🚀 Future Enhancements

### Planned Features
- [ ] **AR Product Preview**: View furniture in real-world using AR (commented out in codebase)
- [ ] **Payment Integration**: Razorpay, Stripe, or UPI
- [ ] **Order Tracking**: Real-time delivery status
- [ ] **Reviews & Ratings**: Customer feedback system
- [ ] **Push Notifications**: Order updates and promotions
- [ ] **Advanced Analytics**: Supplier dashboard with charts
- [ ] **Social Sharing**: Share products on social media
- [ ] **Multi-language Support**: Support for local languages
- [ ] **Dark Mode**: Theme switching
- [ ] **Favorites**: Enhanced wishlist with price drop alerts
- [ ] **Chat Support**: Customer-supplier direct messaging
- [ ] **Video Support**: Product demonstration videos
- [ ] **Recommendation Engine**: AI-based product suggestions
- [ ] **Admin Panel**: Super admin management interface

### AR Features (Commented)
The project has AR framework setup commented out in `main.dart`:
```dart
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
```
To enable AR:
1. Uncomment the imports
2. Add `arcore_flutter_plugin: ^0.0.2+1` to `pubspec.yaml`
3. Configure Android AR Core permissions

---

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/YourFeature`
3. **Commit** changes: `git commit -m 'Add YourFeature'`
4. **Push** to branch: `git push origin feature/YourFeature`
5. **Open** a Pull Request

### Code Guidelines
- Write clear, self-documenting code
- Add comments for complex logic
- Follow existing code patterns
- Update README for new features
- Test thoroughly before submitting PR

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 📞 Support & Contact

For questions, issues, or suggestions:
- **GitHub Issues**: [Create an issue](https://github.com/rathan-skr/airtual_showroom_proj/issues)
- **Email**: rathan.skr@example.com
- **GitHub Profile**: [@rathan-skr](https://github.com/rathan-skr)

---

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Guide](https://dart.dev/guides)
- [Firebase Documentation](https://firebase.google.com/docs)
- [Provider Pattern](https://pub.dev/packages/provider)
- [Material Design](https://material.io/design)

---

## 🎓 Learning Outcomes

This project demonstrates:
- ✅ Cross-platform mobile app development with Flutter
- ✅ Firebase integration (Auth, Firestore, Storage)
- ✅ State management with Provider pattern
- ✅ Dual-role authentication system
- ✅ Complex UI with tabs, grids, and navigation
- ✅ Real-time data synchronization
- ✅ E-commerce functionality
- ✅ Product management systems

---

**Last Updated**: 2024  
**Version**: 1.0.0  
**Status**: ✅ Active Development
