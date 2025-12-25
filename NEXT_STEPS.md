# 🚀 Próximos Pasos - Roadmap de Mejoras

## 📋 Estado Actual

✅ **Fase 1-4 Completadas:**
- ✅ Corregir ruta signin
- ✅ Crear SignInPage
- ✅ Refactor auth sync
- ✅ Cleanup dependencias
- ✅ Tests framework

**Estado del Análisis: 0 ERRORES CRÍTICOS** 🎉

---

## 🎯 Roadmap de Próximas Mejoras

### **Fase 5: Refactoring Widget Tree** (2-3 días)

#### `lib/view/home/home.dart` (323 líneas)
**Problema**: Widget tree muy profundo y anidaciones complejas

**Solución**:
```dart
// ANTES
Column(
  children: [
    Expanded(
      child: Center(
        child: ListView(
          children: [
            Padding(
              padding: ...,
              child: Column(
                children: [
                  Row(
                    children: [
                      AnimatedContainer(...),
                      Expanded(
                        child: AnimatedOpacity(...)
```

// DESPUÉS - Extraer a métodos
class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(child: _scaffoldBody());
  }

  Widget _scaffoldBody() { ... }
  Widget _profileSection() { ... }
  Widget _typewriterSection() { ... }
  Widget _navigationBar() { ... }
}
```

**Tareas**:
- [ ] Extraer `_profileSection()` (AnimatedContainer + profile image)
- [ ] Extraer `_typewriterSection()` (AnimatedText + content)
- [ ] Extraer `_navigationBar()` (IconMenu + actions)
- [ ] Reducir indentación a máximo 3 niveles
- [ ] Agregar comentarios descriptivos

**Impacto**:
- 🚀 Mejor performance en móviles
- 📖 Código más legible
- 🧪 Más fácil de testear

---

### **Fase 6: Asset Constants Generator** (1 día)

**Problema**: Magic strings en assets
```dart
// ❌ ANTES: Duplicación y errores propensos
Image(image: const Svg('assets/images/linkedin.svg')),
Image(image: const Svg('assets/images/linkedin.svg')), // ¿Correcta?
Image(image: const Svg('assets/images/linked-in.svg')), // Typo!
```

**Solución**: Crear constants
```dart
// ✅ DESPUÉS: lib/core/assets.dart
class Assets {
  static const String linkedinIcon = 'assets/images/linkedin.svg';
  static const String portfolioIcon = 'assets/images/portfolio.svg';
  static const String bgTile = 'assets/images/bg-tile-part-c.svg';
  // ...
}

// Uso
Image(image: Svg(Assets.linkedinIcon))
```

**Tareas**:
- [ ] Crear `lib/core/assets.dart` con todas las constantes
- [ ] Reemplazar magic strings en todos los archivos
- [ ] Agregar constants para fuentes
- [ ] Documentar en README

**Impacto**:
- 🎯 Zero asset typos
- 🔍 Fácil encontrar assets no usados
- ⚡ Build-time validation posible

---

### **Fase 7: Eliminar Duplicación Entries/News** (2-3 días)

**Problema**: `ResumedEntriesFromFirebase` y `ResumedNewsEntriesFromFirebase` casi idénticas

**Solución**: Widget genérico `ReusableEntriesList<T>`
```dart
// ✅ Generic widget
class ReusableEntriesList<T> extends ConsumerStatefulWidget {
  final int listLength;
  final int page;
  final ViewModelProvider<AsyncValue<List<T>>> viewModelProvider;
  final Widget Function(List<T>) contentBuilder;

  const ReusableEntriesList({
    required this.viewModelProvider,
    required this.contentBuilder,
    this.listLength = 3,
    this.page = 0,
  });
}

// Uso
ReusableEntriesList<Entry>(
  viewModelProvider: (limit, page) => entriesViewModelProvider(limit: limit, page: page),
  contentBuilder: (entries) => ResumedEntries(entries: entries),
)
```

**Tareas**:
- [ ] Crear `lib/view/widgets/reusable_entries_list.dart`
- [ ] Refactorizar `ResumedEntriesFromFirebase` para usar generic
- [ ] Refactorizar `ResumedNewsEntriesFromFirebase` para usar generic
- [ ] Eliminar duplicación de código
- [ ] Tests unitarios para generic widget

**Impacto**:
- 🎯 DRY principle
- 📉 200+ líneas menos de código
- 🧪 Single source of truth para listas

---

### **Fase 8: Localizations Provider Wrapper** (1-2 días)

**Problema**: Localizations accedidas globalmente sin contexto
```dart
// ❌ ANTES: Acceso global, valores estáticos
final List<Map<String, String>> projects = [
  { 'name': localizations.my_website }
];

// Problema: Si cambias idioma, los valores no se actualizan
```

**Solución**: Provider wrapper context-aware
```dart
// ✅ DESPUÉS: Dynamic con Riverpod
class PortfolioContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectsProvider);
    // Se actualiza cuando cambia idioma
    return Column(children: projects.map(...).toList());
  }
}

// Provider
final projectsProvider = Provider((ref) {
  final localizations = AppLocalizations.of(context);
  return [
    { 'name': localizations.my_website },
    { 'name': localizations.api_open_builder },
  ];
});
```

**Tareas**:
- [ ] Crear `lib/core/providers/localizations_provider.dart`
- [ ] Provider para projects
- [ ] Provider para collaborators
- [ ] Provider para credits
- [ ] Actualizar widgets a usar providers

**Impacto**:
- 🌐 Cambio de idioma en vivo (sin reload)
- ✅ Garantiza consistencia
- 🧪 Más fácil de testear

---

### **Fase 9: Error Handling Global** (1-2 días)

**Problema**: Error handling incompleto
```dart
// ❌ ANTES: Errores crudos
error: (error, stackTrace) => Text('Error: $error')
```

**Solución**: Error handler interceptor
```dart
// ✅ DESPUÉS: Handler consistente
class ErrorHandler {
  static Widget buildError(Object error) {
    if (error is FirebaseAuthException) {
      return _authErrorWidget(error);
    } else if (error is FirebaseException) {
      return _firebaseErrorWidget(error);
    }
    return _genericErrorWidget(error);
  }
}

// Uso
error: (error, st) => ErrorHandler.buildError(error)
```

**Tareas**:
- [ ] Crear `lib/core/error_handler.dart`
- [ ] Mapeo de excepciones a mensajes
- [ ] Widget reusable para errores
- [ ] Logging a Firebase Crashlytics
- [ ] UX de retry automático

**Impacto**:
- 👥 Better UX para errores
- 🐛 Better debugging
- 📊 Error tracking en Firebase

---

### **Fase 10: Performance Optimization** (1-2 días)

#### 10.1: Image Lazy Loading
```dart
// ❌ ANTES: Carga todas las imágenes
Image.asset('assets/images/large.png')

// ✅ DESPUÉS: Lazy loading
import 'package:cached_network_image/cached_network_image.dart';

CachedNetworkImage(
  imageUrl: imageUrl,
  placeholder: (context, url) => Shimmer(...),
)
```

#### 10.2: List Memoization
```dart
// ❌ ANTES: Recalcula en cada build
final projects = [
  { 'name': 'Project 1' },
  { 'name': 'Project 2' },
];

// ✅ DESPUÉS: Memoized
final projectsProvider = Provider((ref) => [...]);
```

**Tareas**:
- [ ] Profile con DevTools Profiler
- [ ] Identificar bottlenecks
- [ ] Implementar lazy loading de assets
- [ ] Optimizar AnimatedContainer redispositions
- [ ] Benchmark antes/después

**Impacto**:
- ⚡ 40-50% reducción en build time
- 📱 Mejor performance en móviles
- 🎯 Lighthouse score +20 pts

---

### **Fase 11: Testing Suite Completa** (3-5 días)

#### 11.1: Unit Tests
```bash
test/
├── viewmodel/
│   ├── auth/
│   │   └── auth_view_model_test.dart ✅ Hecho
│   ├── blog/
│   │   └── entries_view_model_test.dart
│   └── news/
│       └── news_entries_view_model_test.dart
└── core/
    ├── utils_test.dart
    └── error_handler_test.dart
```

#### 11.2: Widget Tests
```bash
test/
├── view/
│   ├── auth/
│   │   └── sign_in_page_test.dart ✅ Hecho
│   ├── home/
│   │   └── home_test.dart
│   └── drawer/
│       └── main_drawer_test.dart
```

#### 11.3: Integration Tests
```bash
integration_test/
├── auth_flow_test.dart
├── navigation_test.dart
└── blog_entries_test.dart
```

**Tareas**:
- [ ] Unit tests para todos los ViewModels
- [ ] Widget tests para páginas principales
- [ ] Integration tests para flujos críticos
- [ ] Coverage mínimo 80%
- [ ] CI/CD con GitHub Actions

**Impacto**:
- 🛡️ Confianza en cambios
- 🐛 Catch regressions automáticamente
- 📈 Coverage: 0% → 80%

---

### **Fase 12: CI/CD Setup** (1-2 días)

#### `.github/workflows/flutter.yml`
```yaml
name: Flutter CI/CD

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter analyze
      - run: flutter test
      - run: flutter build web
```

**Tareas**:
- [ ] Configurar GitHub Actions
- [ ] Lint + Analyze en cada PR
- [ ] Run tests automáticamente
- [ ] Deploy a Firebase Hosting
- [ ] Code coverage reports

**Impacto**:
- ✅ Lint checks automáticos
- 🚀 Deploy automatizado
- 📊 Coverage tracking

---

## 🗓️ Timeline Estimado

| Fase | Horas | Prioridad | Blocker |
|------|-------|-----------|---------|
| 5. Widget refactor | 16 | ALTA | Rendimiento |
| 6. Assets constants | 8 | MEDIA | DX |
| 7. Eliminar duplicación | 16 | ALTA | Mantenimiento |
| 8. Localizations wrapper | 12 | MEDIA | UX |
| 9. Error handler | 12 | MEDIA | UX/DX |
| 10. Performance | 12 | BAJA | Mobile UX |
| 11. Testing suite | 24 | CRÍTICA | Confiabilidad |
| 12. CI/CD | 8 | ALTA | DevOps |
| **TOTAL** | **108** | - | - |

**Total: ~3 semanas de trabajo**

---

## 🎯 Quick Wins (máximo 1 día)

Si tienes poco tiempo, haz estas primero:

```
1. [ ] Crear lib/core/assets.dart (30 min)
2. [ ] Reemplazar magic strings (1 hora)
3. [ ] Refactorizar home.dart main methods (2 horas)
4. [ ] Agregar más unit tests (2 horas)
```

---

## 📊 Checklist de Verificación

Antes de cada fase:
```
[ ] Code está compilando sin errores
[ ] flutter analyze pasa con 0 errores
[ ] flutter test ejecuta sin fallos
[ ] Cambios están en rama feature/
[ ] PR escrito con descripción clara
```

---

## 🤝 Próximas Acciones Recomendadas

1. **Hacer commit del trabajo actual**:
   ```bash
   git add -A
   git commit -m "feat(auth): implement signin page & refactor auth sync"
   ```

2. **Crear rama para Fase 5**:
   ```bash
   git checkout -b feature/refactor-home-widget-tree
   ```

3. **Continuar con widget refactoring**:
   - Enfocarse en `lib/view/home/home.dart`
   - Extraer métodos pequeños
   - Agregar tests

---

## 📚 Recursos Útiles

- [Flutter Performance Best Practices](https://flutter.dev/docs/testing/best-practices)
- [Riverpod Documentation](https://riverpod.dev)
- [Golden Files Testing](https://flutter.dev/docs/testing/unit-testing#testing-images)
- [GitHub Actions Flutter](https://marketplace.visualstudio.com/items?itemName=natemoo-re.vscode-action-buttons)

---

**Documento generado: 2025-12-25**
**Proyecto: javier_website**
**Estado: LISTO PARA SIGUIENTE FASE**
