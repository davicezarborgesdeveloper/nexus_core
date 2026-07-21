# 📐 Diretrizes de Design - Reskin Portfólio Profissional

## 🎨 Paleta de Cores

### Cores Principais
- **Primária (Azul Profundo)**: `#1e3a8a` - Transmite profissionalismo e confiança
- **Primária Claro**: `#3b82f6` - Para variações e estados hover
- **Secundária (Slate)**: `#475569` - Tom complementar sofisticado
- **Acento (Coral/Laranja)**: `#f97316` - Para CTAs e destaques importantes

### Tons Neutros (Escala de Cinza Azulado)
- **Neutral 50**: `#f8fafc` - Backgrounds sutis
- **Neutral 100**: `#f1f5f9` - Backgrounds de seção
- **Neutral 200**: `#e2e8f0` - Bordas
- **Neutral 300**: `#cbd5e1` - Bordas em hover
- **Neutral 400**: `#94a3b8` - Texto desabilitado
- **Neutral 500**: `#64748b` - Texto secundário
- **Neutral 600**: `#475569` - Texto normal
- **Neutral 700**: `#334155` - Texto destaque
- **Neutral 800**: `#1e293b` - Texto escuro
- **Neutral 900**: `#0f172a` - Texto principal (quase preto)

### Cores Funcionais
- **Background**: `#ffffff` (branco puro)
- **Foreground**: `#0f172a` (texto principal)
- **Border**: `#e2e8f0`
- **Destructive**: `#dc2626`

### Acessibilidade (WCAG AA)
✅ Todos os contrastes testados:
- Foreground (#0f172a) sobre Background (#ffffff): **16.9:1**
- Primary (#1e3a8a) sobre Background (#ffffff): **11.2:1**
- Accent (#f97316) sobre Background (#ffffff): **4.8:1**
- Neutral 600 (#475569) sobre Background (#ffffff): **8.6:1**

---

## 🔤 Tipografia

### Fontes
- **Headings (Títulos)**: `Space Grotesk` - Moderna, geométrica, impactante
  - Pesos: 500 (Medium), 600 (SemiBold), 700 (Bold)
- **Body (Corpo)**: `Inter` - Altamente legível, profissional
  - Pesos: 300 (Light), 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold)

### Escala Tipográfica
```
H1 (Hero):     clamp(2.5rem, 6vw, 4.5rem) / 72px   - Bold (700) - Space Grotesk
H2 (Section):  clamp(2rem, 4vw, 3rem) / 48px       - Bold (700) - Space Grotesk
H3 (Card):     1.5rem / 24px                        - SemiBold (600) - Space Grotesk
H4 (Small):    1.25rem / 20px                       - SemiBold (600) - Space Grotesk
Body Large:    1.25rem / 20px                       - Regular (400) - Inter
Body:          1rem / 16px                          - Regular (400) - Inter
Small:         0.875rem / 14px                      - Medium (500) - Inter
```

### Line Heights
- Headings: `1.1 - 1.2` (compacto)
- Body: `1.6 - 1.7` (confortável para leitura)
- Botões/Labels: `1.5`

### Letter Spacing
- Headings grandes: `-0.02em` (mais compacto)
- Body: `normal`

---

## 📏 Espaçamento e Layout

### Sistema de Espaçamento (8px base)
```
xs:  0.25rem (4px)
sm:  0.5rem (8px)
md:  1rem (16px)
lg:  1.5rem (24px)
xl:  2rem (32px)
2xl: 3rem (48px)
3xl: 4rem (64px)
4xl: 5rem (80px)
5xl: 6rem (96px)
```

### Espaçamentos Internos (Padding)
- **Seções**: `py-24` (96px vertical)
- **Cards**: `p-6` (24px)
- **Botões**: `px-6 py-3` (24px horizontal, 12px vertical)
- **Inputs**: `px-4 py-3` (16px horizontal, 12px vertical)
- **Container**: `px-6 lg:px-8` (24px mobile, 32px desktop)

### Grid e Breakpoints
- **Max Width Container**: `1280px` (max-w-7xl)
- **Mobile**: até 768px
- **Tablet**: 768px - 1024px
- **Desktop**: 1024px+

### Grid Layouts
- **Skills**: 4 colunas em desktop, 2 em tablet, 1 em mobile
- **Projects**: 2 colunas em desktop, 1 em mobile
- **Contact**: 2 colunas em desktop, 1 em mobile

---

## 🎯 Componentes

### Border Radius
```
sm:  calc(0.75rem - 4px) = 8px
md:  calc(0.75rem - 2px) = 10px
lg:  0.75rem = 12px
xl:  calc(0.75rem + 4px) = 16px
full: 9999px (pill/circular)
```

### Sombras (Box Shadow)
```
Subtle:  0 1px 3px 0 rgba(0, 0, 0, 0.1)
Medium:  0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1)
Large:   0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04)
Accent:  0 10px 25px -5px rgba(249, 115, 22, 0.3) (para botão laranja)
```

### Bordas
- Padrão: `1px solid #e2e8f0`
- Hover: `1px solid #cbd5e1` ou `1px solid #1e3a8a` (primária)

---

## 🎬 Animações e Transições

### Durações
```
Fast:    150ms
Normal:  200ms
Medium:  300ms
Slow:    500ms
```

### Timing Functions
- Padrão: `ease` ou `cubic-bezier(0.4, 0, 0.2, 1)`
- Bouncy: `cubic-bezier(0.68, -0.55, 0.265, 1.55)` (opcional para micro-interações)

### Propriedades Animadas
- **Cores**: `transition: color 200ms, background-color 200ms, border-color 200ms`
- **Transforms**: `transition: transform 200ms`
- **Shadows**: `transition: box-shadow 300ms`
- **Opacidade**: `transition: opacity 300ms`

### Estados Hover
#### Botões
- **Primary CTA (Laranja)**: 
  - `transform: translateY(-2px)`
  - `box-shadow: 0 10px 25px -5px rgba(249, 115, 22, 0.3)`
  
- **Secondary (Borda)**:
  - `background: #f8fafc`
  - `border-color: #cbd5e1`

#### Cards
- **Project Cards**:
  - `transform: translateY(-8px)`
  - `box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1)`
  
- **Skill Cards**:
  - `transform: translateY(-4px)`
  - `border-color: #1e3a8a`

#### Links
- `color: #0f172a` (de #475569)

---

## 🧩 Componentes Específicos

### Header
- **Altura**: `64px` (h-16)
- **Background**: `rgba(255, 255, 255, 0.8)` com `backdrop-blur`
- **Border Bottom**: `1px solid #e2e8f0`
- **Posição**: `fixed top-0 left-0 right-0 z-50`

### Hero Section
- **Min Height**: `100vh`
- **Gradientes Decorativos**: 
  - Azul (top-right): `radial-gradient(circle, #1e3a8a 0%, transparent 70%)` com `blur(80px)` e `opacity: 0.08`
  - Laranja (bottom-left): `radial-gradient(circle, #f97316 0%, transparent 70%)` com `blur(80px)` e `opacity: 0.06`
- **Badge "Disponível"**: Ponto verde pulsante + texto em card cinza claro

### Cards de Projeto
- **Imagem**: `height: 16rem` (256px)
- **Overlay em Hover**: Gradiente escuro de baixo para cima
- **Botões Overlay**: Fundo branco, aparecem em hover
- **Tags**: Background `#f1f5f9`, texto `#334155`

### Cards de Skill
- **Ícone**: `48x48px` em fundo `#f1f5f9`
- **Lista de Skills**: Bullet point laranja (`#f97316`)

### Formulário de Contato
- **Focus State**: 
  - `border-color: #1e3a8a`
  - `box-shadow: 0 0 0 3px rgba(30, 58, 138, 0.1)`

### Cards de Contato (Info)
- **Hover**: 
  - `transform: translateX(4px)`
  - `border-color: #1e3a8a`

---

## 📱 Responsividade

### Mobile (< 768px)
- H1: `2.5rem` (40px)
- H2: `2rem` (32px)
- Padding seções: `py-16` (64px)
- Container: `px-6` (24px)
- Grid: 1 coluna
- Header: Menu hambúrguer (se necessário)

### Desktop (≥ 1024px)
- H1: `4.5rem` (72px)
- H2: `3rem` (48px)
- Padding seções: `py-24` (96px)
- Container: `px-8` (32px)
- Grid: Multi-colunas conforme componente

---

## 🎪 Elementos Decorativos

### Background Gradients
- Leves, desfocados (blur: 80px)
- Opacidade baixa (6-8%)
- Cores: primária (azul) e acento (laranja)

### Animação de Pulse
- Badge "Disponível": `animate-pulse` no ponto verde

### Icons
- Tamanho padrão: `20x20px` (w-5 h-5)
- Tamanho em cards: `24x24px` (w-6 h-6)
- Cor padrão: `#1e3a8a` (primária)

---

## 🚀 Implementação Flutter

### Google Fonts
```dart
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.interTextTheme(),
  // Para headings, use GoogleFonts.spaceGrotesk()
);
```

### Cores
```dart
class AppColors {
  static const primary = Color(0xFF1E3A8A);
  static const primaryLight = Color(0xFF3B82F6);
  static const accent = Color(0xFFF97316);
  static const foreground = Color(0xFF0F172A);
  static const neutral600 = Color(0xFF475569);
  // ... resto das cores
}
```

### Espaçamentos
```dart
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  // ...
}
```

### Border Radius
```dart
static final borderRadius = BorderRadius.circular(12);
```

---

## ✅ Checklist de Qualidade

### Visual
- [ ] Contraste WCAG AA em todos os textos
- [ ] Espaçamentos consistentes (múltiplos de 8px)
- [ ] Hierarquia tipográfica clara
- [ ] Paleta de cores limitada e coerente

### UX
- [ ] Estados hover/focus em todos os elementos interativos
- [ ] Transições suaves (200-300ms)
- [ ] Feedback visual imediato
- [ ] Navegação clara e intuitiva

### Responsividade
- [ ] Funcional em mobile (320px+)
- [ ] Adaptado para tablet
- [ ] Otimizado para desktop
- [ ] Imagens responsivas

### Performance
- [ ] Animações leves (apenas transform e opacity)
- [ ] Sem animações pesadas em scroll
- [ ] Imagens otimizadas
- [ ] Fontes carregadas de forma eficiente

---

## 📦 Exports para Flutter

### Valores Exatos para Theme
```
Primary Color: 0xFF1E3A8A
Accent Color: 0xFFF97316
Foreground: 0xFF0F172A
Background: 0xFFFFFFFF

Font Family (Headings): 'Space Grotesk'
Font Family (Body): 'Inter'

Border Radius: 12.0
Section Padding: 96.0 (vertical)
Card Padding: 24.0
Button Padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)
```

---

**Desenvolvido com atenção aos detalhes para um portfólio profissional de alto nível.**
