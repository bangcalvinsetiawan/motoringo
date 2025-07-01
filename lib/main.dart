import 'package:flutter/material.dart';


void main() {
  runApp(MotorcycleShopApp());
}

class MotorcycleShopApp extends StatelessWidget {
  const MotorcycleShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotorIN-Go',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
          primary: Colors.black,
          secondary: const Color.fromARGB(255, 0, 0, 0),
        ),
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          fontFamily: 'Roboto',
        ),
      ),
      home: SplashScreen(),
    );
  }
}

// splash_screen.dart
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tambahkan logo di sini
            Image.asset(
              'lib/picture/logo.png',
              width: 500,
              height: 500,
            ),
            // SizedBox(height: 20),
            // Text(
            //   'MotorIN-GO',
            //   style: TextStyle(
            //     fontSize: 28,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //   ),
            // ),
            Text(
              'Your Motorcycle Care Partner',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            // SizedBox(height: 50),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// login_screen.dart
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 60),
                 Image.asset(
              'lib/picture/logo.png',
              width: 100,
              height: 100,
            ),
                SizedBox(height: 20),
                Text(
                  'Welcome Back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                Text(
                  'Sign in to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF718096),
                  ),
                ),
                SizedBox(height: 40),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                SizedBox(height: 24),
                _buildLoginButton(),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Color(0xFFFF6B35)),
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFFFF6B35),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFFFF6B35)),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFFF6B35), width: 2),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFFF6B35),
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Sign In',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

// register_screen.dart
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xFF2D3748),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Text(
                //   'Join MotorIN-GO',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Color(0xFF2D3748),
                //   ),
                // ),
                // Tambahkan logo di sini
            Image.asset(
              'lib/picture/logo.png',
              width: 100,
              height: 100,
            ),
                Text(
                  'Create your account to get started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF718096),
                  ),
                ),
                SizedBox(height: 32),
                _buildTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _phoneController,
                  label: 'Phone Number',
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16),
                _buildTextField(
                  controller: _passwordController,
                  label: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF6B35),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account? '),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFFFF6B35),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFFFF6B35)),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFFF6B35), width: 2),
        ),
      ),
    );
  }
}

// forgot_password_screen.dart
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _inputController = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'lib/picture/logo.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Enter your registered email or phone number. We will send you a link to reset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _inputController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email or Phone Number',
                    labelStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFFFF6B35)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFFF6B35), width: 2),
                    ),
                    errorText: _errorText,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email or phone number';
                    }
                    // Simple validation for email or phone
                    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}');
                    final phoneRegex = RegExp(r'^[0-9]{8,}');
                    if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
                      return 'Enter a valid email or phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    setState(() => _errorText = null);
                    if (_formKey.currentState!.validate()) {
                      // Simulasi pengiriman link reset
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.black,
                          title: const Text('Reset Link Sent', style: TextStyle(color: Colors.white)),
                          content: const Text('A reset link has been sent to your email or phone number if it is registered.', style: TextStyle(color: Colors.white70)),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK', style: TextStyle(color: Colors.orange)),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6B35),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Send Reset Link',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// main_screen.dart
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    HomeScreen(),
    ServicesScreen(),
    BookingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFFF6B35),
        unselectedItemColor: Color(0xFF718096),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// home_screen.dart
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'lib/picture/logo.png',
          width: 100,
          height: 100,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeCard(context),
            SizedBox(height: 20),
            _buildMembershipCard(),
            SizedBox(height: 20),
            _buildQuickActions(context),
            SizedBox(height: 20),
            _buildRecentBookings(),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF181818),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back, John!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your next service is in 2 weeks',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookServiceScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Book Now', style: TextStyle(fontWeight: FontWeight.bold)),
            
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFE55C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.2),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.card_membership, color: Color(0xFFFFB300), size: 32),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gold Member',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'Member since Jan 2023',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.verified, color: Color(0xFFFFB300), size: 28),
            ],
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBenefitIcon(Icons.star, '1,250', 'Points'),
              _buildBenefitIcon(Icons.discount, '15%', 'Discount'),
              _buildBenefitIcon(Icons.build, '12', 'Services'),
            ],
          ),
          SizedBox(height: 18),
          LinearProgressIndicator(
            value: 0.75,
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFB300)),
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '750 points to Platinum',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                'Platinum',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB3A369),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitIcon(IconData icon, String value, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withOpacity(0.08),
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: Color(0xFFFFB300), size: 22),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Roboto',
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.black54,
            fontFamily: 'Roboto',
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildActionCard(context, 'Book Service', Icons.calendar_today, Colors.orange)),
            SizedBox(width: 12),
            Expanded(child: _buildActionCard(context, 'Emergency', Icons.warning, Colors.red)),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildActionCard(context, 'My Bikes', Icons.motorcycle, Colors.green)),
            SizedBox(width: 12),
            Expanded(child: _buildActionCard(context, 'History', Icons.history, Colors.purple)),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard(BuildContext context, String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        if (title == 'Book Service') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookServiceScreen()),
          );
        } else if (title == 'My Bikes') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MotorcycleListScreen()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFF232323),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFF333333)),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentBookings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Bookings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
        SizedBox(height: 12),
        _buildBookingItem('Oil Change', 'Completed', '2024-01-15', Colors.green),
        _buildBookingItem('Brake Service', 'In Progress', '2024-01-20', Colors.orange),
        _buildBookingItem('Full Service', 'Scheduled', '2024-01-25', Colors.blue),
      ],
    );
  }

  Widget _buildBookingItem(String service, String status, String date, Color statusColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF232323),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF333333)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: statusColor,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// services_screen.dart
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Services', style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 16),
            _buildServiceCategories(),
            SizedBox(height: 16),
            Expanded(child: _buildServicesList(context)),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      style: TextStyle(color: Colors.white, fontFamily: 'Roboto'),
      decoration: InputDecoration(
        hintText: 'Search services...',
        hintStyle: TextStyle(color: Colors.white54, fontFamily: 'Roboto'),
        prefixIcon: Icon(Icons.search, color: Colors.white54),
        filled: true,
        fillColor: Color(0xFF232323),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF333333)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.orange, width: 2),
        ),
      ),
    );
  }

  Widget _buildServiceCategories() {
    final categories = ['All', 'Maintenance', 'Repair', 'Emergency', 'Upgrade'];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == 0;
          return Container(
            margin: EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(categories[index], style: TextStyle(fontFamily: 'Roboto')),
              selected: isSelected,
              onSelected: (selected) {},
              selectedColor: Colors.orange,
              backgroundColor: Color(0xFF232323),
              labelStyle: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServicesList(BuildContext context) {
    final services = [
      {'name': 'Oil Change', 'price': 'IDR 65,000', 'discount': 'IDR 50,000', 'duration': '30 min', 'rating': 4.8},
      {'name': 'Brake Service', 'price': 'IDR 100,000', 'discount': 'IDR 80,000', 'duration': '90 min', 'rating': 4.9},
      {'name': 'Full Service', 'price': 'IDR 100,000', 'duration': '3 hours', 'rating': 4.7},
      {'name': 'Tire Change', 'price': 'IDR 250,000', 'discount': 'IDR 200,000', 'duration': '45 min', 'rating': 4.6},
      {'name': 'Engine Tuning', 'price': 'IDR 75,000', 'duration': '2 hours', 'rating': 4.8},
    ];
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return _buildServiceCard(context, service);
      },
    );
  }

  Widget _buildServiceCard(BuildContext context, Map<String, dynamic> service) {
    final hasDiscount = service['discount'] != null;
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF232323),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF333333)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.build,
              color: Colors.orange,
              size: 30,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 14, color: Colors.white54),
                    SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        service['duration'],
                        style: TextStyle(fontSize: 12, color: Colors.white54, fontFamily: 'Roboto'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.star, size: 14, color: Colors.amber),
                    SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        service['rating'].toString(),
                        style: TextStyle(fontSize: 12, color: Colors.white54, fontFamily: 'Roboto'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: hasDiscount
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        service['price'],
                                        style: TextStyle(
                                          fontSize: 12, // Harga coret kecil
                                          color: Colors.white54,
                                          fontFamily: 'Roboto',
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        service['discount'],
                                        style: TextStyle(
                                          fontSize: 16, // Harga diskon sedikit lebih besar
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                          fontFamily: 'Roboto',
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8),
                                // Persentase diskon di kanan, digeser ke tengah dengan margin
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 8, right: 8), // Tambah margin kiri-kanan agar lebih ke tengah
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        String priceStr = (service['price'] as String).replaceAll(RegExp(r'[^0-9]'), '');
                                        String discountStr = (service['discount'] as String).replaceAll(RegExp(r'[^0-9]'), '');
                                        if (priceStr.isEmpty || discountStr.isEmpty) return SizedBox();
                                        int price = int.tryParse(priceStr) ?? 0;
                                        int discount = int.tryParse(discountStr) ?? 0;
                                        if (price == 0 || discount == 0) return SizedBox();
                                        int percent = ((price - discount) / price * 100).round();
                                        return Text(
                                          '-$percent%',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              service['price'],
                              style: TextStyle(
                                fontFamily: 'Roboto',
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookServiceScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: Text(
                        'Book',
                        style: TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Roboto'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// booking_screen.dart
class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('My Bookings', style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: TabBar(
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.white54,
                indicatorColor: Colors.orange,
                tabs: [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
                labelStyle: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildBookingList(context, 'upcoming'),
                  _buildBookingList(context, 'completed'),
                  _buildBookingList(context, 'cancelled'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.black),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildBookingList(BuildContext context, String type) {
    // Simulasi: 1 booking menunggu pembayaran, sisanya status lain
    final bookings = <Map<String, String>>[];
    if (type == 'upcoming') {
      bookings.add({
        'service': 'Full Service',
        'date': '2024-07-05',
        'time': '09:00 AM',
        'motorcycle': 'Honda CBR 150R',
        'status': 'Menunggu Pembayaran',
      });
      bookings.add({
        'service': 'Oil Change',
        'date': '2024-07-10',
        'time': '10:00 AM',
        'motorcycle': 'Yamaha R15 V4',
        'status': 'Confirmed',
      });
    } else if (type == 'completed') {
      bookings.add({
        'service': 'Brake Service',
        'date': '2024-06-20',
        'time': '11:00 AM',
        'motorcycle': 'Honda CBR 150R',
        'status': 'Completed',
      });
    } else {
      bookings.add({
        'service': 'Tire Change',
        'date': '2024-06-15',
        'time': '01:00 PM',
        'motorcycle': 'Yamaha R15 V4',
        'status': 'Cancelled',
      });
    }
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return _buildBookingCard(context, bookings[index]);
      },
    );
  }

  Widget _buildBookingCard(BuildContext context, Map<String, String> booking) {
    Color statusColor;
    if (booking['status'] == 'Menunggu Pembayaran') {
      statusColor = Colors.orange;
    } else if (booking['status'] == 'Confirmed') {
      statusColor = Colors.blue;
    } else if (booking['status'] == 'Completed') {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.red;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF232323),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF333333)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booking['service']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                ),
              ),
              GestureDetector(
                onTap: booking['status'] == 'Menunggu Pembayaran'
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentScreen(
                              bookingInfo: booking,
                            ),
                          ),
                        );
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    booking['status']!,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: statusColor,
                      fontFamily: 'Roboto',
                      decoration: booking['status'] == 'Menunggu Pembayaran'
                          ? TextDecoration.underline
                          : null,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.motorcycle, size: 16, color: Colors.white54),
              SizedBox(width: 8),
              Text(
                booking['motorcycle']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.white54),
              SizedBox(width: 8),
              Text(
                '${booking['date']} at ${booking['time']}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
          if (booking['status'] == 'Confirmed') ...[
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.orange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      foregroundColor: Colors.orange,
                    ),
                    child: Text(
                      'Reschedule',
                      style: TextStyle(color: Colors.orange, fontFamily: 'Roboto'),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// profile_screen.dart
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: Colors.white, fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileHeader(),
            SizedBox(height: 24),
            _buildMembershipSection(),
            SizedBox(height: 24),
            _buildMyMotorcycles(context),
            SizedBox(height: 24),
            _buildMenuItems(),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFF232323),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF333333)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.orange,
            child: Text(
              'JD',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Roboto',
            ),
          ),
          Text(
            'john.doe@email.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              fontFamily: 'Roboto',
            ),
          ),
          Text(
            '+1 234 567 8900',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black, fontFamily: 'Roboto'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFD700), Color(0xFFFFE55C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.card_membership, color: Colors.black, size: 32),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gold Member',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      'Member since Jan 2023',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.verified,
                color: Colors.black,
                size: 28,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.stars, color: Colors.black, size: 22),
              SizedBox(width: 8),
              Text(
                '1,250 Points',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: LinearProgressIndicator(
                  value: 0.625, // 1250/2000 for example
                  backgroundColor: Colors.black12,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Platinum',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '750 points to Platinum',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildBenefitIcon(Icons.percent, '15%\nDiscount'),
              _buildBenefitIcon(Icons.build, '12\nServices'),
              _buildBenefitIcon(Icons.card_giftcard, 'Special\nGifts'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
              ),
            ],
          ),
          child: Icon(icon, color: Color(0xFFFFB300), size: 22),
        ),
        SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildMyMotorcycles(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Motorcycles',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Roboto',
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MotorcycleListScreen()),
                );
              },
              child: Text(
                'Add New',
                style: TextStyle(color: Colors.orange, fontFamily: 'Roboto'),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        _buildMotorcycleCard('Honda CBR 150R', 'ABC 1234', '2022'),
        SizedBox(height: 8),
        _buildMotorcycleCard('Yamaha R15 V4', 'XYZ 5678', '2023'),
      ],
    );
  }

  Widget _buildMotorcycleCard(String model, String plate, String year) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF232323),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF333333)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.motorcycle,
              color: Colors.orange,
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
                Text(
                  '$plate • $year',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white38,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    final menuItems = [
      {'title': 'Service History', 'icon': Icons.history, 'color': Colors.blue},
      // {'title': 'Payment Methods', 'icon': Icons.payment, 'color': Colors.green},
      {'title': 'Notifications', 'icon': Icons.notifications, 'color': Colors.orange},
      {'title': 'Help & Support', 'icon': Icons.help, 'color': Colors.purple},
      {'title': 'Terms & Conditions', 'icon': Icons.description, 'color': Colors.grey},
      {'title': 'Logout', 'icon': Icons.logout, 'color': Colors.red},
    ];

    return Column(
      children: menuItems.map((item) => _buildMenuItem(
        item['title'] as String,
        item['icon'] as IconData,
        item['color'] as Color,
      )).toList(),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'Roboto',
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white38,
          size: 16,
        ),
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: Color(0xFF232323),
      ),
    );
  }
}

// BookServiceScreen
class BookServiceScreen extends StatefulWidget {
  final Map<String, dynamic>? initialService;
  const BookServiceScreen({super.key, this.initialService});

  @override
  State<BookServiceScreen> createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'John Doe');
  final _phoneController = TextEditingController(text: '+1 234 567 8900');
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  final List<String> _motorcycles = [
    'Honda CBR 150R - ABC 1234',
    'Yamaha R15 V4 - XYZ 5678',
  ];
  String? _selectedMotorcycle;

  final List<Map<String, dynamic>> _serviceTypes = [
    {'name': 'Oil Change', 'price': 65000, 'discount': 15000},
    {'name': 'Brake Service', 'price': 100000, 'discount': 20000},
    {'name': 'Full Service', 'price': 100000, 'discount': 0},
    {'name': 'Tire Change', 'price': 250000, 'discount': 50000},
    {'name': 'Engine Tuning', 'price': 75000, 'discount': 0},
    {'name': 'General Checkup', 'price': 50000, 'discount': 0},
    {'name': 'Battery Replacement', 'price': 120000, 'discount': 10000},
    {'name': 'Chain Adjustment', 'price': 40000, 'discount': 0},
    {'name': 'Other', 'price': 50000, 'discount': 0},
  ];
  final List<String> _selectedServiceTypes = [];

  final List<String> _workshopLocations = [
    'Bengkel MotorIN-GO Pusat',
    'Bengkel MotorIN-GO Cabang A',
    'Bengkel MotorIN-GO Cabang B',
    'Bengkel MotorIN-GO Cabang C',
    'Bengkel Mitra Terdekat',
  ];
  String? _selectedWorkshopLocation;

  @override
  void initState() {
    super.initState();
    _selectedMotorcycle = _motorcycles.first;
    _selectedWorkshopLocation = _workshopLocations.first;
    if (widget.initialService != null) {
      _selectedServiceTypes.add(widget.initialService!['name']);
    }
  }

  int get _totalHarga {
    int total = 0;
    for (var name in _selectedServiceTypes) {
      final s = _serviceTypes.firstWhere((e) => e['name'] == name, orElse: () => {'price': 0});
      total += s['price'] as int;
    }
    return total;
  }

  int get _totalDiskon {
    int total = 0;
    for (var name in _selectedServiceTypes) {
      final s = _serviceTypes.firstWhere((e) => e['name'] == name, orElse: () => {'discount': 0});
      total += s['discount'] as int;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    int totalHarga = _totalHarga;
    int totalDiskon = _totalDiskon;
    int totalBayar = totalHarga - totalDiskon;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Service'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    labelStyle: TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  style: TextStyle(color: Colors.white),
                  validator: (v) => v == null || v.isEmpty ? 'Nama wajib diisi' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'No. Telepon',
                    labelStyle: TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  style: TextStyle(color: Colors.white),
                  validator: (v) => v == null || v.isEmpty ? 'No. telepon wajib diisi' : null,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedMotorcycle,
                  items: _motorcycles.map((m) => DropdownMenuItem(value: m, child: Text(m, style: TextStyle(color: Colors.white)))).toList(),
                  onChanged: (v) => setState(() => _selectedMotorcycle = v),
                  decoration: InputDecoration(
                    labelText: 'Pilih Motor',
                    labelStyle: TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  dropdownColor: Colors.black,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                Text('Pilih Jenis Service', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                ..._serviceTypes.map((s) => CheckboxListTile(
                  value: _selectedServiceTypes.contains(s['name']),
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _selectedServiceTypes.add(s['name']);
                      } else {
                        _selectedServiceTypes.remove(s['name']);
                      }
                    });
                  },
                  title: Text(s['name'], style: TextStyle(color: Colors.white)),
                  subtitle: Text('Rp${s['price']} (Diskon: Rp${s['discount']})', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.orange,
                  checkColor: Colors.black,
                )),
                SizedBox(height: 16),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Tanggal',
                    labelStyle: TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  style: TextStyle(color: Colors.white),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (picked != null) {
                      _dateController.text = '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}' ;
                    }
                  },
                  readOnly: true,
                  validator: (v) => v == null || v.isEmpty ? 'Tanggal wajib diisi' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _timeController,
                  decoration: InputDecoration(
                    labelText: 'Jam',
                    labelStyle: TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  style: TextStyle(color: Colors.white),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      _timeController.text = picked.format(context);
                    }
                  },
                  readOnly: true,
                  validator: (v) => v == null || v.isEmpty ? 'Jam wajib diisi' : null,
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedWorkshopLocation,
                  items: _workshopLocations.map((w) => DropdownMenuItem(value: w, child: Text(w, style: TextStyle(color: Colors.white)))).toList(),
                  onChanged: (v) => setState(() => _selectedWorkshopLocation = v),
                  decoration: InputDecoration(
                    labelText: 'Pilih Lokasi Bengkel',
                    labelStyle: TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  dropdownColor: Colors.black,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 24),
                Divider(color: Colors.white24),
                Text('Rincian Pembayaran', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Harga', style: TextStyle(color: Colors.white)),
                    Text('Rp$totalHarga', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Diskon', style: TextStyle(color: Colors.white)),
                    Text('- Rp$totalDiskon', style: TextStyle(color: Colors.orange)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Bayar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('Rp$totalBayar', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _selectedServiceTypes.isNotEmpty) {
                      // Redirect ke PaymentScreen dengan data booking
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                            bookingInfo: {
                              'name': _nameController.text,
                              'phone': _phoneController.text,
                              'motorcycle': _selectedMotorcycle,
                              'services': _selectedServiceTypes,
                              'date': _dateController.text,
                              'time': _timeController.text,
                              'workshop': _selectedWorkshopLocation,
                              'totalHarga': totalHarga,
                              'totalDiskon': totalDiskon,
                              'totalBayar': totalBayar,
                            },
                          ),
                        ),
                      );
                    } else if (_selectedServiceTypes.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Pilih minimal satu jenis service!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text('Book Now', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// PaymentScreen
class PaymentScreen extends StatelessWidget {
  final Map<String, dynamic> bookingInfo;
  PaymentScreen({super.key, required this.bookingInfo});

  final List<Map<String, dynamic>> paymentMethods = [
    {'name': 'Virtual Account', 'icon': Icons.account_balance},
    {'name': 'Dana', 'icon': Icons.account_balance_wallet},
    {'name': 'Gopay', 'icon': Icons.qr_code},
    {'name': 'OVO', 'icon': Icons.phone_iphone},
    {'name': 'ShopeePay', 'icon': Icons.shopping_bag},
    {'name': 'LinkAja', 'icon': Icons.link},
    {'name': 'Alfamart/Indomaret', 'icon': Icons.store},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pilih Metode Pembayaran', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 16),
            ...paymentMethods.map((method) => Card(
              color: Colors.black,
              child: ListTile(
                leading: Icon(method['icon'], color: Colors.orange),
                title: Text(method['name'], style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Simulasi pembayaran sukses
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: Colors.black,
                      title: const Text('Pembayaran Berhasil', style: TextStyle(color: Colors.white)),
                      content: Text('Booking untuk ${bookingInfo['motorcycle']} telah dibayar.', style: TextStyle(color: Colors.white70)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('OK', style: TextStyle(color: Colors.orange)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// ================== MOTORCYCLE LIST & FORM ==================
class Motorcycle {
  String plate;
  String yearMonth;
  String brand;
  String type;
  Motorcycle({required this.plate, required this.yearMonth, required this.brand, required this.type});
}

class MotorcycleListScreen extends StatefulWidget {
  const MotorcycleListScreen({super.key});
  @override
  State<MotorcycleListScreen> createState() => _MotorcycleListScreenState();
}

class _MotorcycleListScreenState extends State<MotorcycleListScreen> {
  List<Motorcycle> motorcycles = [
    Motorcycle(plate: 'ABC 1234', yearMonth: '2022/01', brand: 'Honda', type: 'CBR 150R'),
    Motorcycle(plate: 'XYZ 5678', yearMonth: '2023/05', brand: 'Yamaha', type: 'R15 V4'),
  ];

  void _addMotorcycle() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MotorcycleFormScreen()),
    );
    if (result is Motorcycle) {
      setState(() => motorcycles.add(result));
    }
  }

  void _editMotorcycle(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MotorcycleFormScreen(motorcycle: motorcycles[index])),
    );
    if (result is Motorcycle) {
      setState(() => motorcycles[index] = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Motor'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: motorcycles.length,
        itemBuilder: (context, i) {
          final m = motorcycles[i];
          return ListTile(
            leading: Icon(Icons.motorcycle, color: Colors.orange),
            title: Text('${m.brand} ${m.type}', style: TextStyle(color: Colors.white)),
            subtitle: Text('${m.plate} • ${m.yearMonth}', style: TextStyle(color: Colors.white70)),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: Colors.orange),
              onPressed: () => _editMotorcycle(i),
            ),
            tileColor: Color(0xFF232323),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMotorcycle,
        backgroundColor: Colors.orange,
        child: Icon(Icons.add, color: Colors.black),
        tooltip: 'Input New Motor',
      ),
      backgroundColor: Colors.black,
    );
  }
}

class MotorcycleFormScreen extends StatefulWidget {
  final Motorcycle? motorcycle;
  const MotorcycleFormScreen({super.key, this.motorcycle});
  @override
  State<MotorcycleFormScreen> createState() => _MotorcycleFormScreenState();
}

class _MotorcycleFormScreenState extends State<MotorcycleFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _plateController;
  late TextEditingController _yearMonthController;
  late TextEditingController _brandController;
  late TextEditingController _typeController;

  @override
  void initState() {
    super.initState();
    _plateController = TextEditingController(text: widget.motorcycle?.plate ?? '');
    _yearMonthController = TextEditingController(text: widget.motorcycle?.yearMonth ?? '');
    _brandController = TextEditingController(text: widget.motorcycle?.brand ?? '');
    _typeController = TextEditingController(text: widget.motorcycle?.type ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.motorcycle != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Motor' : 'Input New Motor'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _plateController,
                decoration: InputDecoration(
                  labelText: 'Nomor Plat',
                  labelStyle: TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                style: TextStyle(color: Colors.white),
                validator: (v) => v == null || v.isEmpty ? 'Nomor plat wajib diisi' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _yearMonthController,
                decoration: InputDecoration(
                  labelText: 'Tahun/Bulan Plat (YYYY/MM)',
                  labelStyle: TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.black,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                style: TextStyle(color: Colors.white),
                validator: (v) => v == null || v.isEmpty ? 'Tahun/bulan wajib diisi' : null,
              ),
              SizedBox(height: 16),
              if (!isEdit) ...[
                TextFormField(
                  controller: _brandController,
                  decoration: InputDecoration(
                    labelText: 'Merk Motor',
                    labelStyle: TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  style: TextStyle(color: Colors.white),
                  validator: (v) => v == null || v.isEmpty ? 'Merk wajib diisi' : null,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _typeController,
                  decoration: InputDecoration(
                    labelText: 'Jenis Motor',
                    labelStyle: TextStyle(color: Colors.orange),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  style: TextStyle(color: Colors.white),
                  validator: (v) => v == null || v.isEmpty ? 'Jenis motor wajib diisi' : null,
                ),
                SizedBox(height: 16),
              ],
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final m = Motorcycle(
                      plate: _plateController.text,
                      yearMonth: _yearMonthController.text,
                      brand: _brandController.text,
                      type: _typeController.text,
                    );
                    Navigator.pop(context, m);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(isEdit ? 'Simpan Perubahan' : 'Tambah Motor', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

// Extension for string capitalization
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}