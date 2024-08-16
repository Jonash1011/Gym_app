import 'package:flutter/material.dart';

void main() {
  runApp(const GymApp());
}

class GymApp extends StatelessWidget {
  const GymApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitZone Gym',
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),
        fontFamily: 'Roboto',
      ),
      home: const GymLandingPage(),
    );
  }
}

class GymLandingPage extends StatelessWidget {
  const GymLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('FitZone Gym'),
              background: Image.asset(
                'assets/2997341.jpg',
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              _buildNavButton('Home'),
              _buildNavButton('Services'),
              _buildNavButton('Pricing'),
              _buildNavButton('Contact'),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const HeroSection(),
              const ServicesSection(),
              const TestimonialsSection(),
              const PricingSection(),
              const ContactSection(),
              const Footer(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {},
        child: Text(title, style: const TextStyle(color: Colors.white)),
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.red.withOpacity(0.3)),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Transform Your Body',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          const Text(
            'Join FitZone Gym and start your fitness journey today!',
            style: TextStyle(fontSize: 18, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildAnimatedButton('Get Started'),
        ],
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Our Services',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              ServiceCard(
                icon: Icons.fitness_center,
                title: 'Personal Training',
                description: 'One-on-one sessions with certified trainers',
              ),
              ServiceCard(
                icon: Icons.group,
                title: 'Group Classes',
                description: 'Yoga, Zumba, HIIT, and more',
              ),
              ServiceCard(
                icon: Icons.pool,
                title: 'Swimming Pool',
                description: 'Olympic-sized pool for lap swimming',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 300,
        child: Card(
          elevation: _isHovered ? 16 : 8,
          color: Colors.grey[850],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(widget.icon, size: 48, color: Colors.red),
                const SizedBox(height: 8),
                Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text(widget.description, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[300])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'What Our Members Say',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              TestimonialCard(
                name: 'John Doe',
                quote: 'FitZone Gym changed my life. I\'ve never been in better shape!',
              ),
              TestimonialCard(
                name: 'Jane Smith',
                quote: 'The trainers here are amazing. They really know their stuff!',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatefulWidget {
  final String name;
  final String quote;

  const TestimonialCard({
    Key? key,
    required this.name,
    required this.quote,
  }) : super(key: key);

  @override
  _TestimonialCardState createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 300,
        child: Card(
          elevation: _isHovered ? 16 : 8,
          color: Colors.grey[850],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.quote, style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey[300])),
                const SizedBox(height: 8),
                Text('- ${widget.name}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PricingSection extends StatelessWidget {
  const PricingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Membership Plans',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: const [
              PricingCard(
                title: 'Basic',
                price: '\$29.99',
                features: ['Access to gym equipment', 'Locker room access'],
              ),
              PricingCard(
                title: 'Premium',
                price: '\$49.99',
                features: ['All Basic features', 'Group classes', 'Personal trainer (1 session/month)'],
              ),
              PricingCard(
                title: 'VIP',
                price: '\$99.99',
                features: ['All Premium features', 'Unlimited personal training', 'Nutrition consultation'],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PricingCard extends StatefulWidget {
  final String title;
  final String price;
  final List<String> features;

  const PricingCard({
    Key? key,
    required this.title,
    required this.price,
    required this.features,
  }) : super(key: key);

  @override
  _PricingCardState createState() => _PricingCardState();
}

class _PricingCardState extends State<PricingCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 300,
        child: Card(
          elevation: _isHovered ? 16 : 8,
          color: Colors.grey[850],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(widget.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                const SizedBox(height: 8),
                Text(widget.price, style: const TextStyle(fontSize: 24, color: Colors.red)),
                const SizedBox(height: 8),
                ...widget.features.map((feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(feature, style: TextStyle(color: Colors.grey[300])),
                )),
                const SizedBox(height: 16),
                _buildAnimatedButton('Choose Plan'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Contact Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _buildTextField('Name'),
          const SizedBox(height: 10),
          _buildTextField('Email'),
          const SizedBox(height: 10),
          _buildTextField('Message', maxLines: 3),
          const SizedBox(height: 20),
          _buildAnimatedButton('Send Message'),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[300]),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[700]!),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
    color: Colors.black,
    child: Wrap(
    spacing: 20,
    runSpacing: 20,
    alignment: WrapAlignment.spaceAround,
    children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
    Text('FitZone Gym', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    SizedBox(height: 8),
    Text('123 Fitness Street', style: TextStyle(color: Colors.grey)),
    Text('Healthyville, FT 12345', style: TextStyle(color: Colors.grey)),
    Text('Phone: (555) 123-4567', style: TextStyle(color: Colors.grey)),
    ],
    ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Quick Links', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 8),
          _buildFooterLink('Home'),
          _buildFooterLink('Services'),
          _buildFooterLink('Pricing'),
          _buildFooterLink('Contact'),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Follow Us', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 8),
          _buildFooterLink('Facebook'),
          _buildFooterLink('Twitter'),
          _buildFooterLink('Instagram'),
          _buildFooterLink('LinkedIn'),
        ],
      ),
    ],
    ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {},
        child: Text(text, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}

Widget _buildAnimatedButton(String text) {
  return ElevatedButton(
    onPressed: () {},
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.red),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered))
            return Colors.red[700];
          return null;
        },
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(fontSize: 16),
    ),
  );
}