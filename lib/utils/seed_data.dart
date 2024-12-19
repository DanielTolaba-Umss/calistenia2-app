// lib/utils/seed_data.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class DatabaseSeeder {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> seedExercises() async {
    try {
      debugPrint('Iniciando seedExercises...');

      // Verificar si el usuario está autenticado
      if (_auth.currentUser == null) {
        debugPrint('❌ Error: Usuario no autenticado en seedExercises');
        throw Exception('Usuario no autenticado');
      }
      debugPrint('✅ Usuario autenticado con ID: ${_auth.currentUser!.uid}');

      // Verificar si ya existen ejercicios
      debugPrint('Verificando ejercicios existentes...');
      final existingExercises = await _firestore.collection('exercises').limit(1).get();
      if (existingExercises.docs.isNotEmpty) {
        debugPrint('ℹ️ Los ejercicios ya están cargados');
        return;
      }
      debugPrint('✅ No se encontraron ejercicios previos');

      final exercises = [
        {
          "name": "Puente de Glúteos",
          "description": "Ejercicio básico que trabaja los glúteos y el core. Ideal para principiantes.",
          "iconName": "accessibility_new",
          "difficulty": "Principiante",
          "category": "Glúteos",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Glúteos", "Core", "Piernas"],
          "images": [
            "assets/images/exercises/puente_gluteos1.jpg",
            "assets/images/exercises/puente_gluteos2.jpg"
          ],
          "repetitions": 12,
          "sets": 3,
          "restTime": 60,
        },
        {
          "name": "Dominadas",
          "description": "Ideal para trabajar la espalda y los músculos del tren superior. Ejercicio fundamental para desarrollar fuerza y masa muscular.",
          "iconName": "fitness_center",
          "difficulty": "Principiante",
          "category": "Espalda",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Dorsales", "Bíceps", "Antebrazos", "Hombros"],
          "images": [
            "assets/images/exercises/dominadas1.jpg",
            "assets/images/exercises/dominadas2.jpg",

          ],
          "repetitions": 8,
          "sets": 3,
          "restTime": 90,
        },
        {
          "name": "Fondo en Banco",
          "description": "Ejercicio enfocado en tríceps y pecho. Ideal para principiantes e intermedios. Se realiza colocando las manos en un banco detrás del cuerpo.",
          "iconName": "bench",
          "difficulty": "Principiante",
          "category": "Tríceps",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Tríceps", "Pectorales", "Hombros"],
          "images": [
            "assets/images/exercises/fondo-bancas1.jpg",
            "assets/images/exercises/fondo-bancas2.jpg"
          ],
          "repetitions": 12,
          "sets": 3,
          "restTime": 60
        },
        {
          "name": "Flexiones",
          "description": "Ejercicio fundamental para el pecho y los tríceps. Excelente para construir fuerza en el tren superior.",
          "iconName": "push_pin",
          "difficulty": "Principiante",
          "category": "Pecho",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Pectorales", "Tríceps", "Hombros"],
          "images": [
            "assets/images/exercises/flexiones1.jpg",
            "assets/images/exercises/flexiones2.jpg",
          ],
          "repetitions": 12,
          "sets": 4,
          "restTime": 60,
        },
        {
          "name": "Plancha Abdominal",
          "description": "Ejercicio isométrico básico para fortalecer el core y la estabilidad general. Ideal para todos los niveles.",
          "iconName": "timelapse",
          "difficulty": "Principiante",
          "category": "Core",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Core", "Espalda baja", "Hombros"],
          "images": [
            "assets/images/exercises/plancha abdomi nal.gif",
          ],
          "repetitions": null, // Es un ejercicio por tiempo
          "sets": 3,
          "restTime": 60,
          "duration": 30 // Duración en segundos
        },
        {
          "name": "Flexiones Inclinadas",
          "description": "Las flexiones inclinadas se realizan con las manos en una superficie elevada. Son una variación más fácil de las flexiones tradicionales, enfocadas en el pecho y los tríceps.",
          "iconName": "arrow_upward",
          "difficulty": "Principiante",
          "category": "Pecho",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Pectorales", "Tríceps", "Hombros"],
          "images": [
            "assets/images/exercises/flexion-inclinado1.jpg",
            "assets/images/exercises/flexion-inclinado2.jpg"
          ],
          "repetitions": 12,
          "sets": 3,
          "restTime": 60,
        },
        {
          "name": "Dips (Fondos)",
          "description": "Ejercicio avanzado para el desarrollo de pecho y tríceps. Excelente para la fuerza del tren superior.",
          "iconName": "accessibility_new",
          "difficulty": "Principiante",
          "category": "Pecho",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Pectorales", "Tríceps", "Hombros", "Serrato"],
          "images": [
            "assets/images/exercises/dominadas1.jpg",
            "assets/images/exercises/dominadas2.jpg",
            "assets/images/exercises/dominadas3.jpg",
          ],
          "repetitions": 10,
          "sets": 3,
          "restTime": 90,
        },
        {
          "name": "Sentadilla",
          "description": "Ejercicio fundamental para trabajar piernas y glúteos. Mejora la fuerza funcional y la estabilidad general.",
          "iconName": "directions_walk",
          "difficulty": "Principiante",
          "category": "Piernas",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Cuádriceps", "Glúteos", "Isquiotibiales", "Core"],
          "images": [
            "assets/images/exercises/sentadilla1.jpg",
            "assets/images/exercises/sentadilla2.jpg"
          ],
          "repetitions": 15,
          "sets": 3,
          "restTime": 60
        },
        // Ejercicios Intermedios
        {
          "name": "Sentadilla Búlgara",
          "description": "Ejercicio unilateral avanzado que fortalece las piernas y mejora el equilibrio. Se realiza con una pierna elevada en una superficie tras el cuerpo.",
          "iconName": "directions_walk",
          "difficulty": "Intermedio",
          "category": "Piernas",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Cuádriceps", "Glúteos", "Core", "Isquiotibiales"],
          "images": [
            "assets/images/exercises/sentadilla-bulgara.gif",
          ],
          "repetitions": 8,
          "sets": 3,
          "restTime": 90
        },
        {
          "name": "Flexiones Diamante",
          "description": "Las flexiones diamante son una variante de las flexiones tradicionales. Se colocan las manos cerca una de la otra, formando un rombo. Se enfocan en trabajar los tríceps y la parte interna del pecho.",
          "iconName": "star_border",
          "difficulty": "Intermedio",
          "category": "Pecho",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Pectorales", "Tríceps", "Hombros"],
          "images": [
            "assets/images/exercises/diamante1.jpg",
            "assets/images/exercises/diamante2.jpg"
          ],
          "repetitions": 10,
          "sets": 4,
          "restTime": 90,
        },
        {
          "name": "Flexión Declinada",
          "description": "Una variación avanzada de las flexiones que enfoca más en la parte superior del pecho y los hombros. Se realiza colocando los pies en una superficie elevada.",
          "iconName": "fitness_center",
          "difficulty": "Intermedio",
          "category": "Pecho",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Pectorales", "Hombros", "Tríceps"],
          "images": [
            "assets/images/exercises/flexion-declinada.gif",
          ],
          "repetitions": 10,
          "sets": 4,
          "restTime": 90
        },
        {
          "name": "Fondo usando dos sillas",
          "description": "Ejercicio que trabaja principalmente los tríceps y el pecho. Se realiza colocando las manos en dos sillas separadas y los pies apoyados en otra superficie.",
          "iconName": "accessibility_new",
          "difficulty": "Intermedio",
          "category": "Pecho",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Pectorales", "Tríceps", "Hombros"],
          "images": [
            "assets/images/exercises/fondo2.1.png",
            "assets/images/exercises/fondo2.2.png"
          ],
          "repetitions": 10,
          "sets": 4,
          "restTime": 90
        },
        {
          "name": "Fondos",
          "description": "Los fondos en la paralela son un ejercicio que trabaja los tríceps, el pecho y los hombros. Se realizan en barras paralelas, bajando el cuerpo y luego empujando hacia arriba.",
          "iconName": "fitness_center",
          "difficulty": "Intermedio",
          "category": "Pecho",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Pectorales", "Tríceps", "Hombros"],
          "images": [
            "assets/images/exercises/fondos1.jpg",
            "assets/images/exercises/fondos2.jpg",
            "assets/images/exercises/fondo2.1.png",
            "assets/images/exercises/fondo2.2.png",
          ],
          "repetitions": 10,
          "sets": 4,
          "restTime": 90,
        },
        {
          "name": "Muscle Up",
          "description": "Ejercicio avanzado que combina dominada explosiva con transición a fondo. Excelente para la fuerza superior.",
          "iconName": "fitness_center",
          "difficulty": "Intermedio",
          "category": "Espalda",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Dorsales", "Pectorales", "Tríceps", "Hombros"],
          "images": [
            "assets/images/exercises/dominadas1.jpg",
            "assets/images/exercises/dominadas2.jpg",
            "assets/images/exercises/dominadas3.jpg",
          ],
          "repetitions": 5,
          "sets": 3,
          "restTime": 120,
        },
        // Ejercicios Avanzados
        {
          "name": "Plancha Front Lever",
          "description": "Ejercicio avanzado de fuerza isométrica. Desarrolla una increíble fuerza en la espalda y el core.",
          "iconName": "accessibility_new",
          "difficulty": "Avanzado",
          "category": "Espalda",
          "createdBy": _auth.currentUser!.uid,
          "createdAt": FieldValue.serverTimestamp(),
          "musclesInvolved": ["Dorsales", "Core", "Hombros", "Brazos"],
          "images": [
            "assets/images/exercises/dominadas1.jpg",
            "assets/images/exercises/dominadas2.jpg",
            "assets/images/exercises/dominadas3.jpg",
          ],
          "repetitions": 3,
          "sets": 5,
          "restTime": 180,
        },
      ];

      debugPrint('Preparando batch write con ${exercises.length} ejercicios...');
      final batch = _firestore.batch();

      for (final exercise in exercises) {
        final docRef = _firestore.collection('exercises').doc();
        batch.set(docRef, {
          ...exercise,
          'createdAt': FieldValue.serverTimestamp(),
          'createdBy': _auth.currentUser!.uid,
        });
        debugPrint('✅ Preparado ejercicio: ${exercise['name']}');
      }

      debugPrint('Ejecutando batch write...');
      await batch.commit();
      debugPrint('✅ Ejercicios cargados exitosamente');
    } catch (e) {
      debugPrint('❌ Error al cargar ejercicios: $e');
      debugPrint('Stack trace: ${StackTrace.current}');
      rethrow;
    }
  }

  // Verificar si los ejercicios existen
  Future<bool> exercisesExist() async {
    try {
      final snapshot = await _firestore.collection('exercises').limit(1).get();
      return snapshot.docs.isNotEmpty;
    } catch (e) {
      debugPrint('Error verificando ejercicios: $e');
      return false;
    }
  }
}

Future<void> seedInitialData() async {
  try {
    debugPrint('🚀 Iniciando seedInitialData...');

    // Esperar a que el usuario esté autenticado
    await Future.delayed(const Duration(seconds: 2)); // Dar tiempo para la autenticación
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      debugPrint('⚠️ No hay usuario autenticado para cargar datos');
      return;
    }

    debugPrint('✅ Usuario autenticado: ${currentUser.email}');
    final seeder = DatabaseSeeder();

    // Verificar si ya existen ejercicios
    final hasExercises = await seeder.exercisesExist();
    if (hasExercises) {
      debugPrint('ℹ️ Los ejercicios ya están cargados');
      return;
    }

    await seeder.seedExercises();
    debugPrint('✅ Proceso de seeding completado exitosamente');
  } catch (e) {
    debugPrint('❌ Error en seedInitialData: $e');
    debugPrint('Stack trace: ${StackTrace.current}');
  }
}