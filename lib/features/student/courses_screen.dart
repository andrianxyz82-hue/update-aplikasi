import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('My Courses', style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : AppTheme.textDark)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list, color: Theme.of(context).brightness == Brightness.dark ? Colors.white : AppTheme.textDark),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildCourseCard(context, index);
        },
      ),
    );
  }

  Widget _buildCourseCard(BuildContext context, int index) {
    final courses = [
      {'title': 'UI/UX Design Essentials', 'instructor': 'Benjamin Lewis', 'progress': 0.65, 'duration': '14h'},
      {'title': 'Flutter Development', 'instructor': 'Sarah Johnson', 'progress': 0.40, 'duration': '20h'},
      {'title': 'Digital Marketing', 'instructor': 'Mike Chen', 'progress': 0.80, 'duration': '10h'},
      {'title': 'Photography Basics', 'instructor': 'Emma Wilson', 'progress': 0.25, 'duration': '8h'},
      {'title': 'Accounting 101', 'instructor': 'David Brown', 'progress': 0.90, 'duration': '12h'},
    ];

    final course = courses[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF2D2D44) : Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF7C7CFF).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.play_circle_outline,
                  size: 40,
                  color: Color(0xFF7C7CFF),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['title'] as String,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Theme.of(context).brightness == Brightness.dark ? Colors.white : AppTheme.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Created by ${course['instructor']}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Duration: ${course['duration']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: course['progress'] as double,
                    backgroundColor: const Color(0xFF7C7CFF).withOpacity(0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7C7CFF)),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${((course['progress'] as double) * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF7C7CFF),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to course detail or start course
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Starting ${course['title']}...'),
                    backgroundColor: const Color(0xFF7C7CFF),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7C7CFF),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                (course['progress'] as double) > 0 ? 'Continue Learning' : 'Enroll Now',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
