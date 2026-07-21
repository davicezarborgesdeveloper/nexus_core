import { Copy, Check } from 'lucide-react';
import { useState } from 'react';

export function DesignSystem() {
  const [copiedColor, setCopiedColor] = useState<string | null>(null);

  const copyToClipboard = (text: string, id: string) => {
    navigator.clipboard.writeText(text);
    setCopiedColor(id);
    setTimeout(() => setCopiedColor(null), 2000);
  };

  const colors = [
    { 
      name: 'Primary', 
      subtitle: 'Azul Profundo',
      hex: '#1e3a8a', 
      rgb: 'rgb(30, 58, 138)',
      flutter: '0xFF1E3A8A',
      usage: 'Identidade principal, títulos importantes, ícones'
    },
    { 
      name: 'Primary Light', 
      subtitle: 'Azul Claro',
      hex: '#3b82f6', 
      rgb: 'rgb(59, 130, 246)',
      flutter: '0xFF3B82F6',
      usage: 'Variações, estados hover'
    },
    { 
      name: 'Accent', 
      subtitle: 'Coral Vibrante',
      hex: '#f97316', 
      rgb: 'rgb(249, 115, 22)',
      flutter: '0xFFF97316',
      usage: 'CTAs, destaques, chamadas para ação'
    },
    { 
      name: 'Secondary', 
      subtitle: 'Slate',
      hex: '#475569', 
      rgb: 'rgb(71, 85, 105)',
      flutter: '0xFF475569',
      usage: 'Elementos secundários, texto normal'
    },
    { 
      name: 'Foreground', 
      subtitle: 'Quase Preto',
      hex: '#0f172a', 
      rgb: 'rgb(15, 23, 42)',
      flutter: '0xFF0F172A',
      usage: 'Texto principal, conteúdo importante'
    },
    { 
      name: 'Background', 
      subtitle: 'Branco Puro',
      hex: '#ffffff', 
      rgb: 'rgb(255, 255, 255)',
      flutter: '0xFFFFFFFF',
      usage: 'Fundo principal do site'
    },
  ];

  const neutrals = [
    { name: 'Neutral 50', hex: '#f8fafc', usage: 'Background sutil' },
    { name: 'Neutral 100', hex: '#f1f5f9', usage: 'Background seção' },
    { name: 'Neutral 200', hex: '#e2e8f0', usage: 'Bordas' },
    { name: 'Neutral 300', hex: '#cbd5e1', usage: 'Bordas hover' },
    { name: 'Neutral 400', hex: '#94a3b8', usage: 'Texto desabilitado' },
    { name: 'Neutral 500', hex: '#64748b', usage: 'Texto secundário' },
    { name: 'Neutral 600', hex: '#475569', usage: 'Texto normal' },
    { name: 'Neutral 700', hex: '#334155', usage: 'Texto destaque' },
    { name: 'Neutral 800', hex: '#1e293b', usage: 'Texto escuro' },
    { name: 'Neutral 900', hex: '#0f172a', usage: 'Texto principal' },
  ];

  const typography = [
    { name: 'H1 Hero', size: 'clamp(2.5rem, 6vw, 4.5rem)', weight: '700', family: 'Space Grotesk', sample: 'Desenvolvedor Full Stack' },
    { name: 'H2 Section', size: 'clamp(2rem, 4vw, 3rem)', weight: '700', family: 'Space Grotesk', sample: 'Expertise técnica' },
    { name: 'H3 Card', size: '1.5rem (24px)', weight: '600', family: 'Space Grotesk', sample: 'Projeto Destacado' },
    { name: 'H4 Small', size: '1.25rem (20px)', weight: '600', family: 'Space Grotesk', sample: 'Subtítulo Menor' },
    { name: 'Body Large', size: '1.25rem (20px)', weight: '400', family: 'Inter', sample: 'Texto introdutório maior para destaque' },
    { name: 'Body', size: '1rem (16px)', weight: '400', family: 'Inter', sample: 'Texto padrão do corpo do site' },
    { name: 'Small', size: '0.875rem (14px)', weight: '500', family: 'Inter', sample: 'Texto pequeno para labels e tags' },
  ];

  const spacing = [
    { name: 'xs', value: '4px', class: 'w-1 h-1' },
    { name: 'sm', value: '8px', class: 'w-2 h-2' },
    { name: 'md', value: '16px', class: 'w-4 h-4' },
    { name: 'lg', value: '24px', class: 'w-6 h-6' },
    { name: 'xl', value: '32px', class: 'w-8 h-8' },
    { name: '2xl', value: '48px', class: 'w-12 h-12' },
    { name: '3xl', value: '64px', class: 'w-16 h-16' },
    { name: '4xl', value: '80px', class: 'w-20 h-20' },
  ];

  const shadows = [
    { name: 'Subtle', css: '0 1px 3px 0 rgba(0, 0, 0, 0.1)', usage: 'Cards padrão' },
    { name: 'Medium', css: '0 10px 25px -5px rgba(0, 0, 0, 0.1)', usage: 'Cards hover' },
    { name: 'Large', css: '0 20px 25px -5px rgba(0, 0, 0, 0.1)', usage: 'Project cards hover' },
    { name: 'Accent', css: '0 10px 25px -5px rgba(249, 115, 22, 0.3)', usage: 'Botão CTA hover' },
  ];

  return (
    <div className="min-h-screen bg-white" style={{ fontFamily: 'var(--font-body)' }}>
      {/* Header */}
      <div className="sticky top-0 z-50 bg-white border-b border-[var(--border)]">
        <div className="max-w-7xl mx-auto px-6 lg:px-8 py-6">
          <h1 
            style={{ 
              fontFamily: 'var(--font-heading)',
              fontSize: '2.5rem',
              fontWeight: '700',
              color: 'var(--foreground)'
            }}
          >
            Design System
          </h1>
          <p style={{ color: 'var(--neutral-600)', marginTop: '0.5rem' }}>
            Guia completo de estilo e paleta de cores para conversão Flutter
          </p>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-6 lg:px-8 py-12">
        {/* Paleta de Cores Principal */}
        <section className="mb-20">
          <h2 
            className="mb-2"
            style={{ 
              fontFamily: 'var(--font-heading)',
              fontSize: '2rem',
              fontWeight: '700',
              color: 'var(--foreground)'
            }}
          >
            🎨 Paleta de Cores Principal
          </h2>
          <p className="mb-8" style={{ color: 'var(--neutral-600)', fontSize: '1.125rem' }}>
            Cores principais do design system com valores para diferentes plataformas
          </p>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {colors.map((color, index) => (
              <div 
                key={index}
                className="rounded-xl overflow-hidden border border-[var(--border)]"
                style={{ boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1)' }}
              >
                {/* Color Swatch */}
                <div 
                  className="h-32 relative"
                  style={{ backgroundColor: color.hex }}
                >
                  <div className="absolute bottom-3 left-3">
                    <div 
                      className="px-3 py-1 rounded-md text-sm backdrop-blur-sm"
                      style={{ 
                        backgroundColor: color.hex === '#ffffff' ? 'rgba(0,0,0,0.6)' : 'rgba(255,255,255,0.9)',
                        color: color.hex === '#ffffff' ? '#ffffff' : color.hex,
                        fontWeight: '600'
                      }}
                    >
                      {color.hex.toUpperCase()}
                    </div>
                  </div>
                </div>

                {/* Color Info */}
                <div className="p-4 bg-white">
                  <div className="mb-3">
                    <h3 
                      style={{ 
                        fontFamily: 'var(--font-heading)',
                        fontSize: '1.125rem',
                        fontWeight: '600',
                        color: 'var(--foreground)'
                      }}
                    >
                      {color.name}
                    </h3>
                    <p className="text-sm" style={{ color: 'var(--neutral-500)' }}>
                      {color.subtitle}
                    </p>
                  </div>

                  <div className="space-y-2 mb-3">
                    <div className="flex items-center justify-between p-2 rounded bg-[var(--neutral-50)]">
                      <span className="text-sm" style={{ color: 'var(--neutral-600)', fontFamily: 'monospace' }}>
                        {color.hex}
                      </span>
                      <button
                        onClick={() => copyToClipboard(color.hex, `hex-${index}`)}
                        className="p-1 hover:bg-white rounded transition-colors"
                        aria-label="Copiar HEX"
                      >
                        {copiedColor === `hex-${index}` ? (
                          <Check className="w-4 h-4" style={{ color: 'var(--accent-color)' }} />
                        ) : (
                          <Copy className="w-4 h-4" style={{ color: 'var(--neutral-600)' }} />
                        )}
                      </button>
                    </div>

                    <div className="flex items-center justify-between p-2 rounded bg-[var(--neutral-50)]">
                      <span className="text-sm" style={{ color: 'var(--neutral-600)', fontFamily: 'monospace' }}>
                        {color.flutter}
                      </span>
                      <button
                        onClick={() => copyToClipboard(color.flutter, `flutter-${index}`)}
                        className="p-1 hover:bg-white rounded transition-colors"
                        aria-label="Copiar Flutter"
                      >
                        {copiedColor === `flutter-${index}` ? (
                          <Check className="w-4 h-4" style={{ color: 'var(--accent-color)' }} />
                        ) : (
                          <Copy className="w-4 h-4" style={{ color: 'var(--neutral-600)' }} />
                        )}
                      </button>
                    </div>
                  </div>

                  <div className="text-sm" style={{ color: 'var(--neutral-600)' }}>
                    <strong>Uso:</strong> {color.usage}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Tons Neutros */}
        <section className="mb-20">
          <h2 
            className="mb-2"
            style={{ 
              fontFamily: 'var(--font-heading)',
              fontSize: '2rem',
              fontWeight: '700',
              color: 'var(--foreground)'
            }}
          >
            ⚪ Tons Neutros (Slate Scale)
          </h2>
          <p className="mb-8" style={{ color: 'var(--neutral-600)', fontSize: '1.125rem' }}>
            Escala de cinza azulado para backgrounds, bordas e hierarquia de texto
          </p>

          <div className="grid grid-cols-2 md:grid-cols-5 gap-4">
            {neutrals.map((neutral, index) => (
              <div key={index} className="space-y-2">
                <div 
                  className="h-20 rounded-lg border border-[var(--border)] relative overflow-hidden group cursor-pointer"
                  style={{ backgroundColor: neutral.hex }}
                  onClick={() => copyToClipboard(neutral.hex, `neutral-${index}`)}
                >
                  <div className="absolute inset-0 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity bg-black/20">
                    {copiedColor === `neutral-${index}` ? (
                      <Check className="w-5 h-5 text-white" />
                    ) : (
                      <Copy className="w-5 h-5 text-white" />
                    )}
                  </div>
                </div>
                <div>
                  <div 
                    className="text-sm mb-1"
                    style={{ 
                      fontFamily: 'var(--font-heading)',
                      fontWeight: '600',
                      color: 'var(--foreground)'
                    }}
                  >
                    {neutral.name}
                  </div>
                  <div 
                    className="text-xs mb-1"
                    style={{ color: 'var(--neutral-600)', fontFamily: 'monospace' }}
                  >
                    {neutral.hex}
                  </div>
                  <div className="text-xs" style={{ color: 'var(--neutral-500)' }}>
                    {neutral.usage}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Tipografia */}
        <section className="mb-20">
          <h2 
            className="mb-2"
            style={{ 
              fontFamily: 'var(--font-heading)',
              fontSize: '2rem',
              fontWeight: '700',
              color: 'var(--foreground)'
            }}
          >
            🔤 Tipografia
          </h2>
          <p className="mb-8" style={{ color: 'var(--neutral-600)', fontSize: '1.125rem' }}>
            <strong>Headings:</strong> Space Grotesk • <strong>Body:</strong> Inter
          </p>

          <div className="space-y-6">
            {typography.map((typo, index) => (
              <div 
                key={index}
                className="p-6 rounded-xl border border-[var(--border)] bg-white"
              >
                <div className="flex flex-col lg:flex-row lg:items-center gap-4 mb-4">
                  <div className="flex-1">
                    <div 
                      className="mb-1"
                      style={{ 
                        fontFamily: 'var(--font-heading)',
                        fontWeight: '600',
                        color: 'var(--foreground)'
                      }}
                    >
                      {typo.name}
                    </div>
                    <div className="flex flex-wrap gap-3 text-sm" style={{ color: 'var(--neutral-600)' }}>
                      <span><strong>Size:</strong> {typo.size}</span>
                      <span><strong>Weight:</strong> {typo.weight}</span>
                      <span><strong>Font:</strong> {typo.family}</span>
                    </div>
                  </div>
                </div>
                <div 
                  style={{ 
                    fontFamily: typo.family === 'Space Grotesk' ? 'var(--font-heading)' : 'var(--font-body)',
                    fontSize: typo.size.includes('clamp') ? typo.size : typo.size.split(' ')[0],
                    fontWeight: typo.weight,
                    color: 'var(--foreground)'
                  }}
                >
                  {typo.sample}
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Espaçamentos */}
        <section className="mb-20">
          <h2 
            className="mb-2"
            style={{ 
              fontFamily: 'var(--font-heading)',
              fontSize: '2rem',
              fontWeight: '700',
              color: 'var(--foreground)'
            }}
          >
            📏 Sistema de Espaçamento
          </h2>
          <p className="mb-8" style={{ color: 'var(--neutral-600)', fontSize: '1.125rem' }}>
            Sistema baseado em 8px para consistência visual
          </p>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
            {spacing.map((space, index) => (
              <div 
                key={index}
                className="p-6 rounded-xl border border-[var(--border)] bg-white text-center"
              >
                <div className="mb-4 flex items-center justify-center">
                  <div 
                    className={space.class}
                    style={{ backgroundColor: 'var(--primary)' }}
                  />
                </div>
                <div 
                  className="mb-1"
                  style={{ 
                    fontFamily: 'var(--font-heading)',
                    fontWeight: '600',
                    color: 'var(--foreground)'
                  }}
                >
                  {space.name}
                </div>
                <div style={{ color: 'var(--neutral-600)', fontFamily: 'monospace' }}>
                  {space.value}
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Sombras */}
        <section className="mb-20">
          <h2 
            className="mb-2"
            style={{ 
              fontFamily: 'var(--font-heading)',
              fontSize: '2rem',
              fontWeight: '700',
              color: 'var(--foreground)'
            }}
          >
            ✨ Sombras (Box Shadow)
          </h2>
          <p className="mb-8" style={{ color: 'var(--neutral-600)', fontSize: '1.125rem' }}>
            Elevações para profundidade e hierarquia visual
          </p>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {shadows.map((shadow, index) => (
              <div key={index} className="space-y-3">
                <div 
                  className="h-32 rounded-xl bg-white border border-[var(--border)]"
                  style={{ boxShadow: shadow.css }}
                />
                <div>
                  <div 
                    className="mb-1"
                    style={{ 
                      fontFamily: 'var(--font-heading)',
                      fontWeight: '600',
                      color: 'var(--foreground)'
                    }}
                  >
                    {shadow.name}
                  </div>
                  <div className="text-sm mb-2" style={{ color: 'var(--neutral-600)', fontFamily: 'monospace' }}>
                    {shadow.css}
                  </div>
                  <div className="text-sm" style={{ color: 'var(--neutral-500)' }}>
                    <strong>Uso:</strong> {shadow.usage}
                  </div>
                </div>
              </div>
            ))}
          </div>
        </section>

        {/* Botões */}
        <section className="mb-20">
          <h2 
            className="mb-2"
            style={{ 
              fontFamily: 'var(--font-heading)',
              fontSize: '2rem',
              fontWeight: '700',
              color: 'var(--foreground)'
            }}
          >
            🔘 Componentes - Botões
          </h2>
          <p className="mb-8" style={{ color: 'var(--neutral-600)', fontSize: '1.125rem' }}>
            Estados e variações de botões
          </p>

          <div className="space-y-6">
            {/* Primary Button */}
            <div className="p-6 rounded-xl border border-[var(--border)] bg-white">
              <div className="mb-4">
                <div 
                  style={{ 
                    fontFamily: 'var(--font-heading)',
                    fontWeight: '600',
                    color: 'var(--foreground)',
                    marginBottom: '0.5rem'
                  }}
                >
                  Primary CTA (Accent)
                </div>
                <p className="text-sm" style={{ color: 'var(--neutral-600)' }}>
                  Background: #f97316 • Hover: translateY(-2px) + shadow
                </p>
              </div>
              <div className="flex flex-wrap gap-4">
                <button
                  className="px-6 py-3 rounded-lg transition-all duration-200"
                  style={{ 
                    backgroundColor: 'var(--accent-color)',
                    color: 'var(--accent-foreground)',
                    fontFamily: 'var(--font-body)',
                    fontWeight: '500'
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.transform = 'translateY(-2px)';
                    e.currentTarget.style.boxShadow = '0 10px 25px -5px rgba(249, 115, 22, 0.3)';
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.transform = 'translateY(0)';
                    e.currentTarget.style.boxShadow = 'none';
                  }}
                >
                  Ver projetos
                </button>
                <button
                  className="px-6 py-3 rounded-lg transition-all duration-200"
                  style={{ 
                    backgroundColor: 'var(--accent-color)',
                    color: 'var(--accent-foreground)',
                    fontFamily: 'var(--font-body)',
                    fontWeight: '500',
                    opacity: '0.6',
                    cursor: 'not-allowed'
                  }}
                >
                  Estado desabilitado
                </button>
              </div>
            </div>

            {/* Secondary Button */}
            <div className="p-6 rounded-xl border border-[var(--border)] bg-white">
              <div className="mb-4">
                <div 
                  style={{ 
                    fontFamily: 'var(--font-heading)',
                    fontWeight: '600',
                    color: 'var(--foreground)',
                    marginBottom: '0.5rem'
                  }}
                >
                  Secondary Button
                </div>
                <p className="text-sm" style={{ color: 'var(--neutral-600)' }}>
                  Border: #e2e8f0 • Hover: bg-neutral-50
                </p>
              </div>
              <button
                className="px-6 py-3 rounded-lg border transition-all duration-200"
                style={{ 
                  borderColor: 'var(--border)',
                  color: 'var(--foreground)',
                  fontFamily: 'var(--font-body)',
                  fontWeight: '500'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.backgroundColor = 'var(--neutral-50)';
                  e.currentTarget.style.borderColor = 'var(--neutral-300)';
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.backgroundColor = 'transparent';
                  e.currentTarget.style.borderColor = 'var(--border)';
                }}
              >
                Entre em contato
              </button>
            </div>

            {/* Text Button */}
            <div className="p-6 rounded-xl border border-[var(--border)] bg-white">
              <div className="mb-4">
                <div 
                  style={{ 
                    fontFamily: 'var(--font-heading)',
                    fontWeight: '600',
                    color: 'var(--foreground)',
                    marginBottom: '0.5rem'
                  }}
                >
                  Text Button
                </div>
                <p className="text-sm" style={{ color: 'var(--neutral-600)' }}>
                  Color: neutral-600 • Hover: foreground
                </p>
              </div>
              <button
                className="px-6 py-3 transition-colors duration-200"
                style={{ 
                  color: 'var(--neutral-600)',
                  fontFamily: 'var(--font-body)',
                  fontWeight: '500'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.color = 'var(--foreground)';
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.color = 'var(--neutral-600)';
                }}
              >
                Baixar CV
              </button>
            </div>
          </div>
        </section>

        {/* Border Radius */}
        <section className="mb-20">
          <h2 
            className="mb-2"
            style={{ 
              fontFamily: 'var(--font-heading)',
              fontSize: '2rem',
              fontWeight: '700',
              color: 'var(--foreground)'
            }}
          >
            ⭕ Border Radius
          </h2>
          <p className="mb-8" style={{ color: 'var(--neutral-600)', fontSize: '1.125rem' }}>
            Arredondamentos consistentes para todos os componentes
          </p>

          <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
            <div className="text-center">
              <div 
                className="h-24 mb-3 bg-[var(--primary)]"
                style={{ borderRadius: '8px' }}
              />
              <div style={{ fontFamily: 'var(--font-heading)', fontWeight: '600', color: 'var(--foreground)' }}>
                Small
              </div>
              <div className="text-sm" style={{ color: 'var(--neutral-600)' }}>8px</div>
            </div>
            <div className="text-center">
              <div 
                className="h-24 mb-3 bg-[var(--primary)]"
                style={{ borderRadius: '12px' }}
              />
              <div style={{ fontFamily: 'var(--font-heading)', fontWeight: '600', color: 'var(--foreground)' }}>
                Default
              </div>
              <div className="text-sm" style={{ color: 'var(--neutral-600)' }}>12px</div>
            </div>
            <div className="text-center">
              <div 
                className="h-24 mb-3 bg-[var(--primary)]"
                style={{ borderRadius: '16px' }}
              />
              <div style={{ fontFamily: 'var(--font-heading)', fontWeight: '600', color: 'var(--foreground)' }}>
                Large
              </div>
              <div className="text-sm" style={{ color: 'var(--neutral-600)' }}>16px</div>
            </div>
            <div className="text-center">
              <div 
                className="h-24 mb-3 bg-[var(--primary)]"
                style={{ borderRadius: '9999px' }}
              />
              <div style={{ fontFamily: 'var(--font-heading)', fontWeight: '600', color: 'var(--foreground)' }}>
                Full
              </div>
              <div className="text-sm" style={{ color: 'var(--neutral-600)' }}>9999px</div>
            </div>
          </div>
        </section>

        {/* Quick Reference Card */}
        <section>
          <div 
            className="p-8 rounded-xl"
            style={{ 
              background: 'linear-gradient(135deg, #1e3a8a 0%, #3b82f6 100%)',
              color: 'white'
            }}
          >
            <h2 
              className="mb-4"
              style={{ 
                fontFamily: 'var(--font-heading)',
                fontSize: '2rem',
                fontWeight: '700'
              }}
            >
              📋 Quick Reference Flutter
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <h3 className="mb-3" style={{ fontFamily: 'var(--font-heading)', fontWeight: '600', opacity: '0.9' }}>
                  Cores Principais
                </h3>
                <div className="space-y-2 font-mono text-sm">
                  <div>primary: Color(0xFF1E3A8A)</div>
                  <div>accent: Color(0xFFF97316)</div>
                  <div>foreground: Color(0xFF0F172A)</div>
                </div>
              </div>
              <div>
                <h3 className="mb-3" style={{ fontFamily: 'var(--font-heading)', fontWeight: '600', opacity: '0.9' }}>
                  Fontes (Google Fonts)
                </h3>
                <div className="space-y-2 font-mono text-sm">
                  <div>GoogleFonts.spaceGrotesk()</div>
                  <div>GoogleFonts.inter()</div>
                </div>
              </div>
              <div>
                <h3 className="mb-3" style={{ fontFamily: 'var(--font-heading)', fontWeight: '600', opacity: '0.9' }}>
                  Espaçamentos
                </h3>
                <div className="space-y-2 font-mono text-sm">
                  <div>EdgeInsets.all(24.0)</div>
                  <div>SizedBox(height: 16.0)</div>
                </div>
              </div>
              <div>
                <h3 className="mb-3" style={{ fontFamily: 'var(--font-heading)', fontWeight: '600', opacity: '0.9' }}>
                  Border Radius
                </h3>
                <div className="space-y-2 font-mono text-sm">
                  <div>BorderRadius.circular(12)</div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  );
}
