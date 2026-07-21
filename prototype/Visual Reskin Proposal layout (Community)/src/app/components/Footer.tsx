import { Heart } from 'lucide-react';
import { PortfolioStore } from '../../lib/portfolioStore';

export function Footer() {
  const profile = PortfolioStore.getProfile();

  return (
    <footer className="py-12 bg-white border-t border-[var(--border)]">
      <div className="max-w-7xl mx-auto px-6 lg:px-8">
        <div className="flex flex-col md:flex-row justify-between items-center gap-4">
          {/* Left - Copyright */}
          <div className="flex items-center gap-2">
            <span style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}>
              © {new Date().getFullYear()} {profile.name}. Desenvolvido com
            </span>
            <Heart 
              className="w-4 h-4 fill-current"
              style={{ color: 'var(--accent-color)' }}
            />
            <span style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}>
              e React
            </span>
          </div>

          {/* Right - Links */}
          <div className="flex items-center gap-6">
            <a 
              href="#sobre"
              className="transition-colors duration-200"
              style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}
              onMouseEnter={(e) => {
                e.currentTarget.style.color = 'var(--foreground)';
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.color = 'var(--neutral-600)';
              }}
            >
              Sobre
            </a>
            <a 
              href="#projetos"
              className="transition-colors duration-200"
              style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}
              onMouseEnter={(e) => {
                e.currentTarget.style.color = 'var(--foreground)';
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.color = 'var(--neutral-600)';
              }}
            >
              Projetos
            </a>
            <a 
              href="#contato"
              className="transition-colors duration-200"
              style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}
              onMouseEnter={(e) => {
                e.currentTarget.style.color = 'var(--foreground)';
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.color = 'var(--neutral-600)';
              }}
            >
              Contato
            </a>
          </div>
        </div>
      </div>
    </footer>
  );
}
