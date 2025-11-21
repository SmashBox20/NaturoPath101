import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/medicine_cabinet_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Load sample data for demonstration
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final service = context.read<MedicineCabinetService>();
      if (service.itemCount == 0) {
        service.loadSampleData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NaturoPath:101'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {
              // TODO: Implement profile
            },
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_florist_outlined),
            selectedIcon: Icon(Icons.local_florist),
            label: 'Plants',
          ),
          NavigationDestination(
            icon: Icon(Icons.medical_services_outlined),
            selectedIcon: Icon(Icons.medical_services),
            label: 'Cabinet',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return _buildExploreContent();
      case 2:
        return _buildPlantsContent();
      case 3:
        return _buildMedicineCabinetContent();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting
          Text(
            'Good ${_getGreeting()}! 🌅',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Welcome to your natural health companion',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          // Search Bar
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search conditions, plants...',
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            onTap: () {
              // TODO: Navigate to search
            },
            readOnly: true,
          ),
          const SizedBox(height: 24),

          // Quick Access
          Text(
            'QUICK ACCESS',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildQuickAccessCard(
                  icon: Icons.medical_services,
                  title: 'Medicine\nCabinet',
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildQuickAccessCard(
                  icon: Icons.assignment,
                  title: 'Symptoms\nChecker',
                  onTap: () {
                    // TODO: Navigate to symptom checker
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Featured Section
          Text(
            'FEATURED TODAY',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 12),
          _buildFeaturedCard(
            title: 'Chamomile for Better Sleep',
            subtitle: 'Learn about this calming herb and how it can help',
            imageIcon: Icons.local_florist,
          ),
          const SizedBox(height: 16),

          // Disclaimer
          Card(
            color: Colors.orange.shade50,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: Colors.orange.shade700),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Educational information only. Always consult healthcare providers.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.orange.shade900,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(
                icon,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedCard({
    required String title,
    required String subtitle,
    required IconData imageIcon,
  }) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Navigate to article
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Center(
                child: Icon(
                  imageIcon,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExploreContent() {
    return const Center(
      child: Text('Explore Content\n(Coming Soon)'),
    );
  }

  Widget _buildPlantsContent() {
    return const Center(
      child: Text('Plants Database\n(Coming Soon)'),
    );
  }

  Widget _buildMedicineCabinetContent() {
    return Consumer<MedicineCabinetService>(
      builder: (context, service, child) {
        if (service.itemCount == 0) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.medical_services_outlined,
                  size: 80,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Your Medicine Cabinet is Empty',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  'Start tracking your herbal remedies',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: Add item functionality
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add First Item'),
                ),
              ],
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Remedies (${service.activeItems.length})',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // TODO: Add item functionality
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Expiring soon warning
            if (service.itemsExpiringSoon.isNotEmpty) ...[
              Card(
                color: Colors.orange.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.orange.shade700),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '${service.itemsExpiringSoon.length} item(s) expiring soon',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.orange.shade900,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Medicine cabinet items
            ...service.activeItems.map((item) => _buildMedicineCabinetItem(item)),
          ],
        );
      },
    );
  }

  Widget _buildMedicineCabinetItem(MedicineCabinetItem item) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.local_florist, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.plantName,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '${item.form}${item.brand != null ? ' • ${item.brand}' : ''}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (item.purpose != null) ...[
              const SizedBox(height: 8),
              Text('For: ${item.purpose}', style: Theme.of(context).textTheme.bodyMedium),
            ],
            if (item.dosage != null && item.frequency != null) ...[
              const SizedBox(height: 4),
              Text(
                'Dose: ${item.dosage} ${item.frequency}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            if (item.effectivenessRating != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  ...List.generate(
                    5,
                    (index) => Icon(
                      index < item.effectivenessRating!
                          ? Icons.star
                          : Icons.star_border,
                      size: 16,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('Effectiveness', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
            if (item.expirationDate != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    item.isExpiringSoon ? Icons.warning_amber : Icons.event,
                    size: 16,
                    color: item.isExpiringSoon ? Colors.orange : Colors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Expires: ${_formatDate(item.expirationDate!)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: item.isExpiringSoon ? Colors.orange : null,
                        ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'morning';
    if (hour < 17) return 'afternoon';
    return 'evening';
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
