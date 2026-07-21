import { ArrowRight, Download } from 'lucide-react';
import { PortfolioStore } from '../../lib/portfolioStore';

export function HeroSection() {
  const profile = PortfolioStore.getProfile();
  const titleLines = profile.title.split('\n');

  return (
    <section className="relative min-h-screen flex items-center justify-center bg-white pt-16">
      {/* Background decorativo */}
      <div className="absolute inset-0 overflow-hidden">
        <div
          className="absolute top-0 right-0 w-[500px] h-[500px] rounded-full opacity-[0.08]"
          style={{
            background: 'radial-gradient(circle, var(--primary) 0%, transparent 70%)',
            filter: 'blur(80px)'
          }}
        />
        <div
          className="absolute bottom-0 left-0 w-[400px] h-[400px] rounded-full opacity-[0.06]"
          style={{
            background: 'radial-gradient(circle, var(--accent-color) 0%, transparent 70%)',
            filter: 'blur(80px)'
          }}
        />
      </div>

      <div className="relative max-w-7xl mx-auto px-6 lg:px-8 py-20">
        <div className="max-w-4xl">
          {/* Tag de status */}
          {profile.available && (
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-[var(--neutral-100)] mb-8">
              <div className="w-2 h-2 rounded-full bg-[var(--accent-color)] animate-pulse" />
              <span className="text-sm" style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-700)' }}>
                Disponível para novos projetos
              </span>
            </div>
          )}

          {/* Título principal */}
          <h1
            className="mb-6"
            style={{
              fontFamily: 'var(--font-heading)',
              fontSize: 'clamp(2.5rem, 6vw, 4.5rem)',
              fontWeight: 'var(--font-weight-bold)',
              lineHeight: '1.1',
              color: 'var(--foreground)',
              letterSpacing: '-0.02em'
            }}
          >
            {titleLines.map((line, i) => (
              i === titleLines.length - 1 ? (
                <span key={i} style={{ color: 'var(--primary)' }}>{line}</span>
              ) : (
                <span key={i}>{line}<br /></span>
              )
            ))}
          </h1>

          {/* Subtítulo */}
          <p
            className="mb-10 max-w-2xl"
            style={{
              fontFamily: 'var(--font-body)',
              fontSize: '1.25rem',
              lineHeight: '1.7',
              color: 'var(--neutral-600)'
            }}
          >
            {profile.subtitle}
          </p>

          {/* CTAs */}
          <div className="flex flex-wrap items-center gap-4">
            <a
              href="#projetos"
              className="group inline-flex items-center gap-2 px-6 py-3 rounded-lg transition-all duration-200"
              style={{
                backgroundColor: 'var(--accent-color)',
                color: 'var(--accent-foreground)',
                fontFamily: 'var(--font-body)',
                fontWeight: 'var(--font-weight-medium)'
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
              <ArrowRight className="w-4 h-4 group-hover:translate-x-1 transition-transform duration-200" />
            </a>

            <a
              href="#contato"
              className="inline-flex items-center gap-2 px-6 py-3 rounded-lg border transition-all duration-200"
              style={{
                borderColor: 'var(--border)',
                color: 'var(--foreground)',
                fontFamily: 'var(--font-body)',
                fontWeight: 'var(--font-weight-medium)'
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
            </a>

            <a
              href="/cv.pdf"
              download
              className="inline-flex items-center gap-2 px-6 py-3 transition-colors duration-200"
              style={{
                color: 'var(--neutral-600)',
                fontFamily: 'var(--font-body)',
                fontWeight: 'var(--font-weight-medium)'
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.color = 'var(--foreground)';
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.color = 'var(--neutral-600)';
              }}
            >
              <Download className="w-4 h-4" />
              Baixar CV
            </a>
          </div>

          {/* Stats */}
          <div className="grid grid-cols-3 gap-8 mt-16 pt-16 border-t border-[var(--border)]">
            {profile.stats.map((stat, i) => (
              <div key={i}>
                <div
                  className="mb-1"
                  style={{
                    fontFamily: 'var(--font-heading)',
                    fontSize: '2rem',
                    fontWeight: 'var(--font-weight-bold)',
                    color: 'var(--primary)'
                  }}
                >
                  {stat.number}
                </div>
                <div style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}>
                  {stat.label}
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
