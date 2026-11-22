// ============================================================================
// Karek-Keda: Car Sound Detection AI
// File: lib/core/utils/dart_essentials.dart
// Purpose: Dart Language Essentials Tutorial - Lesson 1.2
// ============================================================================
//
// This file serves as a comprehensive tutorial for Dart programming fundamentals.
// It's designed to teach you the Dart language concepts you'll use throughout
// the Karek-Keda app development.
//
// HOW TO USE THIS FILE:
// 1. Read through each section carefully
// 2. Study the examples and their comments
// 3. Try modifying the examples to experiment
// 4. Use the runDartEssentialsDemo() function to see output
//
// TABLE OF CONTENTS:
// 1. Variables & Data Types
// 2. Functions & Arrow Syntax
// 3. Classes & Constructors
// 4. Null Safety
// 5. Async/Await Patterns
// 6. Collections (List, Map, Set)
// ============================================================================

// ============================================================================
// SECTION 1: VARIABLES & DATA TYPES
// ============================================================================
//
// Dart is a statically-typed language, meaning every variable has a type.
// However, Dart can also infer types automatically.
//
// Key variable declaration keywords:
// - var: Type is inferred, can be reassigned
// - final: Can only be assigned once (runtime constant)
// - const: Compile-time constant (must be known at compile time)
// - Type name: Explicit type declaration
// ============================================================================

/// Demonstrates variable declarations and data types in Dart.
///
/// This function shows all the ways to declare variables and the
/// different primitive data types available in Dart.
void demonstrateVariables() {
  // --------------------------------------------------------------------------
  // VARIABLE DECLARATION STYLES
  // --------------------------------------------------------------------------
  
  // Using 'var' - Type is inferred from the assigned value
  // Dart figures out that this is a String because of the value
  var appName = 'Karek-Keda';  // Inferred as String
  var version = 1.0;           // Inferred as double
  var isActive = true;         // Inferred as bool
  
  // Using explicit types - You specify the type yourself
  // This is more readable and helps catch errors early
  String description = 'Car Sound Detection AI';
  int maxRecordingSeconds = 30;
  double confidenceThreshold = 0.85;
  bool enableNotifications = true;
  
  // Using 'final' - Value can only be set once
  // Use final when you know the value won't change after initialization
  final String userId = 'user_12345';
  final DateTime createdAt = DateTime.now();  // Set at runtime
  
  // Using 'const' - Compile-time constant
  // Use const for values that are known at compile time
  const int maxDetections = 100;
  const double pi = 3.14159;
  const String appVersion = '1.0.0';
  
  // --------------------------------------------------------------------------
  // PRIMITIVE DATA TYPES
  // --------------------------------------------------------------------------
  
  // int - Whole numbers (no decimal points)
  // Used for: counts, indices, IDs
  int recordingCount = 42;
  int negativeNumber = -10;
  
  // double - Floating-point numbers (with decimals)
  // Used for: measurements, percentages, prices
  double accuracy = 0.95;
  double temperature = 23.5;
  
  // num - Can be either int or double
  // Useful when you don't care about the specific numeric type
  num genericNumber = 10;      // Currently int
  genericNumber = 10.5;        // Now it's double
  
  // String - Text data
  // Can use single quotes ' ' or double quotes " "
  String singleQuote = 'Hello';
  String doubleQuote = "World";
  
  // String interpolation - Embed variables in strings
  // Use $variableName or ${expression} syntax
  String greeting = 'Welcome to $appName!';
  String message = 'You have ${recordingCount + 1} recordings';
  
  // Multi-line strings - Use triple quotes
  String multiLine = ''' 
    This is a multi-line string.
    It preserves line breaks and formatting.
    Great for long text or documentation.
  ''';
  
  // bool - Boolean (true/false)
  // Used for: conditions, flags, toggles
  bool isRecording = false;
  bool hasPermission = true;
  
  // dynamic - Type can change at runtime
  // AVOID using dynamic unless absolutely necessary
  // It bypasses Dart's type safety
  dynamic flexibleValue = 'I am a string';
  flexibleValue = 42;  // Now I'm an int (not recommended!)
  
  // Print some values to demonstrate
  print('App: $appName v$appVersion');
  print('Recordings: $recordingCount');
  print('Accuracy: ${(accuracy * 100).toStringAsFixed(1)}%');
}

// ============================================================================
// SECTION 2: FUNCTIONS & ARROW SYNTAX
// ============================================================================
//
// Functions are reusable blocks of code that perform specific tasks.
// Dart functions are first-class objects - they can be passed around like values.
//
// Function components:
// - Return type: What the function returns (void if nothing)
// - Name: How you call the function
// - Parameters: Input values the function accepts
// - Body: The code that runs when the function is called
// ============================================================================

/// A basic function with explicit return type.
///
/// [soundType] is the detected sound category.
/// [confidence] is the detection confidence (0.0 to 1.0).
/// Returns a formatted result string.
String formatDetectionResult(String soundType, double confidence) {
  // Convert confidence to percentage
  int percentage = (confidence * 100).round();
  
  // Return formatted string
  return 'Detected: $soundType (${percentage}% confidence)';
}

/// Arrow syntax for simple, single-expression functions.
///
/// When a function body is just one expression, use => instead of { return ... }
/// This is called "arrow syntax" or "fat arrow" syntax.
double calculateConfidencePercentage(double raw) => raw * 100;

/// Function with optional positional parameters.
///
/// Optional parameters are wrapped in square brackets [].
/// They can have default values.
String createLog(String message, [String? level, String? timestamp]) {
  // Use ?? to provide default value for null
  final logLevel = level ?? 'INFO';
  final time = timestamp ?? DateTime.now().toString();
  
  return '[$logLevel] $time: $message';
}

/// Function with named parameters.
///
/// Named parameters are wrapped in curly braces {}.
/// They make function calls more readable, especially with many parameters.
/// 'required' keyword means the parameter must be provided.
void saveDetection({
  required String soundType,
  required double confidence,
  String? notes,
  bool notify = false,  // Default value
}) {
  print('Saving: $soundType');
  print('Confidence: $confidence');
  if (notes != null) {
    print('Notes: $notes');
  }
  if (notify) {
    print('Sending notification...');
  }
}

/// Higher-order function - A function that takes another function as parameter.
///
/// This is a powerful pattern used extensively in Dart/Flutter.
/// [numbers] is the list to process.
/// [processor] is a function that transforms each number.
List<int> processNumbers(List<int> numbers, int Function(int) processor) {
  return numbers.map(processor).toList();
}

/// Anonymous function (lambda) example.
///
/// Anonymous functions don't have a name.
/// They're often used as callbacks or passed to higher-order functions.
void demonstrateLambdas() {
  List<int> numbers = [1, 2, 3, 4, 5];
  
  // Anonymous function with full syntax
  var doubled = numbers.map((number) {
    return number * 2;
  }).toList();
  
  // Anonymous function with arrow syntax (preferred for simple operations)
  var tripled = numbers.map((n) => n * 3).toList();
  
  print('Doubled: $doubled');  // [2, 4, 6, 8, 10]
  print('Tripled: $tripled');  // [3, 6, 9, 12, 15]
}

// ============================================================================
// SECTION 3: CLASSES & CONSTRUCTORS
// ============================================================================
//
// Classes are blueprints for creating objects. They encapsulate data
// (properties) and behavior (methods) together.
//
// Key OOP concepts:
// - Encapsulation: Bundling data and methods together
// - Inheritance: Creating new classes based on existing ones
// - Polymorphism: Objects of different classes responding to same method
// ============================================================================

/// DetectionResult represents a single sound detection event.
///
/// This class demonstrates:
/// - Properties (instance variables)
/// - Constructors (including named constructors)
/// - Methods (instance and static)
/// - Getters and setters
class DetectionResult {
  // --------------------------------------------------------------------------
  // PROPERTIES (Instance Variables)
  // --------------------------------------------------------------------------
  
  // Public properties - Accessible from anywhere
  final String id;           // Unique identifier (immutable)
  final String soundType;    // Type of sound detected
  final double confidence;   // Confidence score (0.0 to 1.0)
  final DateTime timestamp;  // When the detection occurred
  
  // Private property - Prefix with underscore
  // Only accessible within this class and library
  String? _notes;
  
  // --------------------------------------------------------------------------
  // CONSTRUCTORS
  // --------------------------------------------------------------------------
  
  /// Primary constructor with required parameters.
  ///
  /// Using 'this.propertyName' in parameters automatically assigns
  /// the value to the instance property - a Dart shorthand.
  DetectionResult({
    required this.id,
    required this.soundType,
    required this.confidence,
    DateTime? timestamp,
    String? notes,
  }) : timestamp = timestamp ?? DateTime.now(),  // Initializer list
       _notes = notes;
  
  /// Named constructor for creating from JSON data.
  ///
  /// Named constructors provide alternative ways to create objects.
  /// Common pattern: ClassName.fromJson(), ClassName.empty()
  DetectionResult.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        soundType = json['soundType'] as String,
        confidence = (json['confidence'] as num).toDouble(),
        timestamp = DateTime.parse(json['timestamp'] as String),
        _notes = json['notes'] as String?;
  
  /// Factory constructor for creating with generated ID.
  ///
  /// Factory constructors can return existing instances or
  /// create new ones based on conditions. They don't have 'this'.
  factory DetectionResult.create({
    required String soundType,
    required double confidence,
    String? notes,
  }) {
    // Generate a unique ID
    final id = 'det_${DateTime.now().millisecondsSinceEpoch}';
    
    return DetectionResult(
      id: id,
      soundType: soundType,
      confidence: confidence,
      notes: notes,
    );
  }
  
  // --------------------------------------------------------------------------
  // GETTERS & SETTERS
  // --------------------------------------------------------------------------
  
  /// Getter - Computed property that returns a value.
  ///
  /// Getters look like properties but compute their value.
  /// Use when you want to derive a value from existing properties.
  String get notes => _notes ?? 'No notes';
  
  /// Setter - Validates and sets a value.
  ///
  /// Setters allow you to add logic when a property is set.
  set notes(String value) {
    if (value.isEmpty) {
      _notes = null;
    } else {
      _notes = value;
    }
  }
  
  /// Getter for confidence as percentage.
  int get confidencePercent => (confidence * 100).round();
  
  /// Getter to check if detection is high confidence.
  bool get isHighConfidence => confidence >= 0.8;
  
  // --------------------------------------------------------------------------
  // METHODS
  // --------------------------------------------------------------------------
  
  /// Instance method - Operates on the specific instance.
  ///
  /// Instance methods have access to 'this' and all instance properties.
  String toDisplayString() {
    return '$soundType - $confidencePercent% confidence';
  }
  
  /// Converts the object to JSON format.
  ///
  /// Common pattern for serialization/deserialization.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'soundType': soundType,
      'confidence': confidence,
      'timestamp': timestamp.toIso8601String(),
      'notes': _notes,
    };
  }
  
  /// Static method - Belongs to the class, not instances.
  ///
  /// Static methods don't have access to instance properties.
  /// Use for utility functions related to the class.
  static bool isValidConfidence(double value) {
    return value >= 0.0 && value <= 1.0;
  }
  
  /// Override toString for better debugging output.
  @override
  String toString() {
    return 'DetectionResult(id: $id, type: $soundType, confidence: $confidencePercent%)';
  }
}

// ============================================================================
// SECTION 4: NULL SAFETY
// ============================================================================
//
// Dart uses sound null safety to prevent null reference errors.
// By default, variables cannot be null unless explicitly marked.
//
// Key operators:
// - Type? : Nullable type (can be null)
// - !     : Null assertion (tells Dart a value is not null)
// - ??    : Null-aware operator (provide default if null)
// - ?.    : Null-aware access (only access if not null)
// - ??=   : Null-aware assignment (assign only if null)
// ============================================================================

/// Demonstrates null safety features in Dart.
void demonstrateNullSafety() {
  // --------------------------------------------------------------------------
  // NULLABLE vs NON-NULLABLE TYPES
  // --------------------------------------------------------------------------
  
  // Non-nullable - Cannot be null, must be initialized
  String name = 'Karek-Keda';
  // name = null;  // ERROR: Can't assign null to non-nullable type
  
  // Nullable - Can be null, marked with ?
  String? optionalName;  // Defaults to null
  optionalName = 'Optional';
  optionalName = null;   // OK: nullable type can be null
  
  // --------------------------------------------------------------------------
  // NULL-AWARE OPERATORS
  // --------------------------------------------------------------------------
  
  String? userInput;
  
  // ?? : Provide default value if null
  // "If userInput is null, use 'default' instead"
  String displayName = userInput ?? 'Guest';
  print('Display name: $displayName');  // Output: Guest
  
  // ??= : Assign value only if currently null
  // "If userInput is null, assign 'default' to it"
  userInput ??= 'default';
  print('User input: $userInput');  // Output: default
  
  // ?. : Safe navigation (null-aware access)
  // "Only call method if object is not null"
  String? text;
  int? length = text?.length;  // null (doesn't crash!)
  
  text = 'Hello';
  length = text?.length;  // 5
  
  // Chaining null-aware operators
  String? result = text?.toUpperCase().toLowerCase();
  
  // --------------------------------------------------------------------------
  // NULL ASSERTION OPERATOR (!)
  // --------------------------------------------------------------------------
  
  // ! : Assert that value is not null
  // USE WITH CAUTION - Will throw error if value is null!
  String? maybeNull = 'I am definitely not null';
  String definitelyNotNull = maybeNull!;  // OK: we're sure it's not null
  
  // --------------------------------------------------------------------------
  // LATE KEYWORD
  // --------------------------------------------------------------------------
  
  // 'late' promises the variable will be initialized before use
  // Useful for:
  // 1. Variables initialized after declaration
  // 2. Lazy initialization (computed only when first accessed)
  
  late String lateInitialized;
  // Do some work...
  lateInitialized = 'I was set later';
  print(lateInitialized);
  
  // Lazy initialization - computed only when first accessed
  late final expensiveValue = _computeExpensiveValue();
}

String _computeExpensiveValue() {
  print('Computing expensive value...');
  return 'expensive';
}

// ============================================================================
// SECTION 5: ASYNC/AWAIT PATTERNS
// ============================================================================
//
// Dart is single-threaded but supports asynchronous programming.
// This allows non-blocking operations like network requests, file I/O, etc.
//
// Key concepts:
// - Future<T>: Represents a value that will be available later
// - async: Marks a function as asynchronous
// - await: Pauses execution until a Future completes
// - Stream<T>: A sequence of asynchronous events
// ============================================================================

/// Simulates fetching detection history from a database.
///
/// Returns a Future that completes with a list of results.
/// The 'async' keyword allows use of 'await' inside the function.
Future<List<String>> fetchDetectionHistory() async {
  // Simulate network delay
  await Future.delayed(const Duration(seconds: 2));
  
  // Return mock data
  return [
    'Engine Running',
    'Horn Honk',
    'Brake Squeal',
    'Door Close',
  ];
}

/// Simulates saving a detection to a database.
///
/// Returns a Future<void> - the operation completes but returns nothing.
Future<void> saveDetectionAsync(String soundType) async {
  print('Saving $soundType...');
  
  // Simulate database write
  await Future.delayed(const Duration(milliseconds: 500));
  
  print('$soundType saved successfully!');
}

/// Demonstrates error handling with async/await.
///
/// Uses try-catch-finally for robust error handling.
Future<void> fetchWithErrorHandling() async {
  try {
    // Attempt the async operation
    print('Fetching data...');
    await Future.delayed(const Duration(seconds: 1));
    
    // Simulate an error condition
    bool hasError = false;
    if (hasError) {
      throw Exception('Network error occurred');
    }
    
    print('Data fetched successfully!');
    
  } catch (e) {
    // Handle any errors that occurred
    print('Error: $e');
    
  } finally {
    // Always runs, whether success or failure
    // Great for cleanup operations
    print('Fetch operation completed.');
  }
}

/// Running multiple async operations in parallel.
///
/// Use Future.wait() when you need multiple independent operations
/// to complete before continuing.
Future<void> fetchMultipleInParallel() async {
  print('Starting parallel fetches...');
  
  // These run concurrently, not sequentially!
  final results = await Future.wait([
    Future.delayed(const Duration(seconds: 1), () => 'Result 1'),
    Future.delayed(const Duration(seconds: 2), () => 'Result 2'),
    Future.delayed(const Duration(seconds: 1), () => 'Result 3'),
  ]);
  
  // Total time: ~2 seconds (not 4!)
  print('All results: $results');
}

/// Stream example - Continuous data flow.
///
/// Streams are like Futures but for multiple values over time.
/// Perfect for: audio data, sensor readings, realtime updates.
Stream<int> countDown(int from) async* {
  for (int i = from; i >= 0; i--) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;  // Emit a value to the stream
  }
}

/// Listening to a Stream.
void demonstrateStreams() async {
  print('Countdown starting...');
  
  // Listen to each value as it arrives
  await for (final count in countDown(5)) {
    print('Count: $count');
  }
  
  print('Countdown complete!');
}

// ============================================================================
// SECTION 6: COLLECTIONS (List, Map, Set)
// ============================================================================
//
// Dart provides three main collection types:
// - List: Ordered collection of items (like array)
// - Set: Unordered collection of unique items
// - Map: Key-value pairs (like dictionary/hash)
// ============================================================================

/// Demonstrates List operations and methods.
void demonstrateLists() {
  // --------------------------------------------------------------------------
  // CREATING LISTS
  // --------------------------------------------------------------------------
  
  // List literal - Most common way
  List<String> soundTypes = ['Engine', 'Horn', 'Brakes'];
  
  // Empty list with type
  List<int> scores = [];
  
  // List with initial capacity (optimization for large lists)
  List<double> readings = List.filled(10, 0.0);
  
  // Growable list from generator
  List<int> numbers = List.generate(5, (index) => index * 2);
  // Result: [0, 2, 4, 6, 8]
  
  // --------------------------------------------------------------------------
  // LIST OPERATIONS
  // --------------------------------------------------------------------------
  
  // Add items
  soundTypes.add('Exhaust');           // Add to end
  soundTypes.insert(0, 'Startup');     // Insert at index
  
  // Access items
  String first = soundTypes[0];        // By index
  String last = soundTypes.last;       // Last item
  int count = soundTypes.length;       // Number of items
  
  // Check contents
  bool hasHorn = soundTypes.contains('Horn');
  int hornIndex = soundTypes.indexOf('Horn');
  
  // Remove items
  soundTypes.remove('Exhaust');        // By value
  soundTypes.removeAt(0);              // By index
  
  // --------------------------------------------------------------------------
  // LIST TRANSFORMATIONS
  // --------------------------------------------------------------------------
  
  List<String> items = ['apple', 'banana', 'cherry'];
  
  // map - Transform each item
  List<String> upperItems = items.map((s) => s.toUpperCase()).toList();
  // Result: ['APPLE', 'BANANA', 'CHERRY']
  
  // where - Filter items
  List<String> longItems = items.where((s) => s.length > 5).toList();
  // Result: ['banana', 'cherry']
  
  // forEach - Execute code for each item
  items.forEach((item) => print('Item: $item'));
  
  // reduce - Combine all items into one value
  String combined = items.reduce((a, b) => '$a, $b');
  // Result: 'apple, banana, cherry'
  
  // any / every - Check conditions
  bool hasLongItem = items.any((s) => s.length > 5);     // true
  bool allShort = items.every((s) => s.length < 10);     // true
  
  // Spread operator - Combine lists
  List<String> more = ['date', 'elderberry'];
  List<String> all = [...items, ...more];
  // Result: ['apple', 'banana', 'cherry', 'date', 'elderberry']
  
  print('Sounds: $soundTypes');
  print('Upper: $upperItems');
}

/// Demonstrates Set operations.
void demonstrateSets() {
  // Sets contain only unique values
  
  // Creating sets
  Set<String> detected = {'Engine', 'Horn', 'Engine'};  // Only 2 items!
  
  // Add items (duplicates ignored)
  detected.add('Brakes');
  detected.add('Horn');  // Already exists, not added
  
  // Set operations
  Set<String> common = {'Engine', 'Horn', 'Click'};
  
  Set<String> union = detected.union(common);            // All items from both
  Set<String> intersection = detected.intersection(common); // Only shared items
  Set<String> difference = detected.difference(common);  // In detected, not in common
  
  print('Detected: $detected');
  print('Union: $union');
  print('Intersection: $intersection');
}

/// Demonstrates Map operations.
void demonstrateMaps() {
  // Maps store key-value pairs
  
  // --------------------------------------------------------------------------
  // CREATING MAPS
  // --------------------------------------------------------------------------
  
  // Map literal
  Map<String, double> confidences = {
    'Engine': 0.95,
    'Horn': 0.87,
    'Brakes': 0.72,
  };
  
  // Empty map with types
  Map<String, int> counts = {};
  
  // --------------------------------------------------------------------------
  // MAP OPERATIONS
  // --------------------------------------------------------------------------
  
  // Add or update entries
  confidences['Exhaust'] = 0.65;       // Add new
  confidences['Engine'] = 0.98;        // Update existing
  
  // Access values
  double? hornConf = confidences['Horn'];  // 0.87 (nullable!)
  double engineConf = confidences['Engine'] ?? 0.0;  // With default
  
  // Check contents
  bool hasHorn = confidences.containsKey('Horn');
  bool has90Plus = confidences.containsValue(0.95);
  
  // Remove entries
  confidences.remove('Brakes');
  
  // Iterate over entries
  confidences.forEach((sound, conf) {
    print('$sound: ${(conf * 100).round()}%');
  });
  
  // Get all keys or values
  List<String> allSounds = confidences.keys.toList();
  List<double> allConfs = confidences.values.toList();
  
  // Transform to list of entries
  var entries = confidences.entries.map((e) {
    return '${e.key}: ${e.value}';
  }).toList();
  
  print('All sounds: $allSounds');
  print('Entries: $entries');
}

// ============================================================================
// MAIN DEMO FUNCTION
// ============================================================================

/// Run this function to see all the Dart essentials in action.
///
/// Call this from main.dart to test the examples:
/// ```dart
/// import 'core/utils/dart_essentials.dart';
/// runDartEssentialsDemo();
/// ```
void runDartEssentialsDemo() {
  print('=' * 60);
  print('DART LANGUAGE ESSENTIALS DEMO');
  print('=' * 60);
  
  print('\n--- Variables Demo ---');
  demonstrateVariables();
  
  print('\n--- Functions Demo ---');
  String result = formatDetectionResult('Engine Running', 0.95);
  print(result);
  
  demonstrateLambdas();
  
  // Named parameters example
  saveDetection(
    soundType: 'Horn',
    confidence: 0.87,
    notes: 'Detected at intersection',
    notify: true,
  );
  
  print('\n--- Classes Demo ---');
  var detection = DetectionResult.create(
    soundType: 'Engine Running',
    confidence: 0.95,
    notes: 'Steady idle',
  );
  print(detection);
  print('Is high confidence: ${detection.isHighConfidence}');
  print('JSON: ${detection.toJson()}');
  
  print('\n--- Collections Demo ---');
  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  
  print('\n--- Null Safety Demo ---');
  demonstrateNullSafety();
  
  print('\n' + '=' * 60);
  print('DEMO COMPLETE!');
  print('=' * 60);
}
