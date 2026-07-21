import { Mail, Github, Linkedin, Globe, Menu, X } from 'lucide-react';
import { useState } from 'react';
import { PortfolioStore } from '../../lib/portfolioStore';

const NAV_LINKS = [
  { href: '#', label: 'Início' },
  { href: '#projetos', label: 'Projetos' },
  { href: '#habilidades', label: 'Habilidades' },
  { href: '#contato', label: 'Contato' }
];

export function Header() {
  const [language, setLanguage] = useState<'pt' | 'en'>('pt');
  const [isLangMenuOpen, setIsLangMenuOpen] = useState(false);
  const [isMobileMenuOpen, setIsMobileMenuOpen] = useState(false);
  const profile = PortfolioStore.getProfile();

  const toggleLanguage = (lang: 'pt' | 'en') => {
    setLanguage(lang);
    setIsLangMenuOpen(false);
  };

  const closeMobileMenu = () => {
    setIsMobileMenuOpen(false);
  };

  return (
    <header className="fixed top-0 left-0 right-0 z-50 bg-white/90 backdrop-blur-md border-b border-[var(--border)]">
      <div className="max-w-7xl mx-auto px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Logo/Nome */}
          <a href="#" className="flex items-center">
            <span
              style={{
                fontFamily: 'var(--font-heading)',
                fontSize: '1.25rem',
                fontWeight: 'var(--font-weight-bold)',
                color: 'var(--foreground)',
                letterSpacing: '-0.01em'
              }}
            >
              {profile.name}
            </span>
          </a>

          {/* Desktop Navigation - centered */}
          <nav className="hidden md:flex items-center gap-10 absolute left-1/2 -translate-x-1/2">
            {NAV_LINKS.map((link) => (
              <a
                key={link.href}
                href={link.href}
                className="text-sm transition-colors duration-200"
                style={{ fontFamily: 'var(--font-body)', fontWeight: 'var(--font-weight-medium)', color: 'var(--neutral-600)' }}
                onMouseEnter={(e) => { e.currentTarget.style.color = 'var(--foreground)'; }}
                onMouseLeave={(e) => { e.currentTarget.style.color = 'var(--neutral-600)'; }}
              >
                {link.label.toUpperCase()}
              </a>
            ))}
          </nav>

          {/* Desktop: idioma + social + entrar */}
          <div className="hidden md:flex items-center gap-6">
            {/* Language Switcher */}
            <div className="relative">
              <button
                onClick={() => setIsLangMenuOpen(!isLangMenuOpen)}
                className="flex items-center gap-2 text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
                aria-label="Mudar idioma"
              >
                <Globe className="w-5 h-5" />
                <span
                  className="text-sm uppercase font-medium"
                  style={{ fontFamily: 'var(--font-body)' }}
                >
                  {language}
                </span>
              </button>

              {isLangMenuOpen && (
                <div
                  className="absolute top-full right-0 mt-2 py-2 rounded-lg border border-[var(--border)] bg-white shadow-lg min-w-[120px]"
                  style={{ boxShadow: '0 10px 25px -5px rgba(0, 0, 0, 0.1)' }}
                >
                  <button
                    onClick={() => toggleLanguage('pt')}
                    className="w-full px-4 py-2 text-left text-sm hover:bg-[var(--neutral-50)] transition-colors duration-150 flex items-center gap-2"
                    style={{
                      fontFamily: 'var(--font-body)',
                      color: language === 'pt' ? 'var(--primary)' : 'var(--neutral-600)',
                      fontWeight: language === 'pt' ? '500' : '400'
                    }}
                  >
                    🇧🇷 Português
                    {language === 'pt' && <span className="ml-auto text-xs">✓</span>}
                  </button>
                  <button
                    onClick={() => toggleLanguage('en')}
                    className="w-full px-4 py-2 text-left text-sm hover:bg-[var(--neutral-50)] transition-colors duration-150 flex items-center gap-2"
                    style={{
                      fontFamily: 'var(--font-body)',
                      color: language === 'en' ? 'var(--primary)' : 'var(--neutral-600)',
                      fontWeight: language === 'en' ? '500' : '400'
                    }}
                  >
                    🇺🇸 English
                    {language === 'en' && <span className="ml-auto text-xs">✓</span>}
                  </button>
                </div>
              )}
            </div>

            {/* Social Links */}
            <div className="flex items-center gap-4">
              <a
                href={profile.githubUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
                aria-label="GitHub"
              >
                <Github className="w-5 h-5" />
              </a>
              <a
                href={profile.linkedinUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
                aria-label="LinkedIn"
              >
                <Linkedin className="w-5 h-5" />
              </a>
              <a
                href={`mailto:${profile.email}`}
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
                aria-label="Email"
              >
                <Mail className="w-5 h-5" />
              </a>
            </div>

            <a
              href="#/admin"
              className="inline-flex items-center px-5 py-2.5 rounded-lg text-sm transition-all duration-200"
              style={{
                backgroundColor: 'var(--primary)',
                color: 'var(--primary-foreground)',
                fontFamily: 'var(--font-body)',
                fontWeight: 'var(--font-weight-semibold)',
                letterSpacing: '0.03em'
              }}
              onMouseEnter={(e) => { e.currentTarget.style.opacity = '0.9'; }}
              onMouseLeave={(e) => { e.currentTarget.style.opacity = '1'; }}
            >
              ENTRAR
            </a>
          </div>

          {/* Mobile Menu Button + Language */}
          <div className="md:hidden flex items-center gap-4">
            <div className="relative">
              <button
                onClick={() => setIsLangMenuOpen(!isLangMenuOpen)}
                className="flex items-center gap-1 text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
                aria-label="Mudar idioma"
              >
                <Globe className="w-5 h-5" />
                <span
                  className="text-sm uppercase font-medium"
                  style={{ fontFamily: 'var(--font-body)' }}
                >
                  {language}
                </span>
              </button>

              {isLangMenuOpen && (
                <div
                  className="absolute top-full right-0 mt-2 py-2 rounded-lg border border-[var(--border)] bg-white shadow-lg min-w-[120px]"
                  style={{ boxShadow: '0 10px 25px -5px rgba(0, 0, 0, 0.1)' }}
                >
                  <button
                    onClick={() => toggleLanguage('pt')}
                    className="w-full px-4 py-2 text-left text-sm hover:bg-[var(--neutral-50)] transition-colors duration-150 flex items-center gap-2"
                    style={{
                      fontFamily: 'var(--font-body)',
                      color: language === 'pt' ? 'var(--primary)' : 'var(--neutral-600)',
                      fontWeight: language === 'pt' ? '500' : '400'
                    }}
                  >
                    🇧🇷 Português
                    {language === 'pt' && <span className="ml-auto text-xs">✓</span>}
                  </button>
                  <button
                    onClick={() => toggleLanguage('en')}
                    className="w-full px-4 py-2 text-left text-sm hover:bg-[var(--neutral-50)] transition-colors duration-150 flex items-center gap-2"
                    style={{
                      fontFamily: 'var(--font-body)',
                      color: language === 'en' ? 'var(--primary)' : 'var(--neutral-600)',
                      fontWeight: language === 'en' ? '500' : '400'
                    }}
                  >
                    🇺🇸 English
                    {language === 'en' && <span className="ml-auto text-xs">✓</span>}
                  </button>
                </div>
              )}
            </div>

            <button
              onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
              className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
              aria-label="Menu"
            >
              {isMobileMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
            </button>
          </div>
        </div>

        {/* Mobile Menu */}
        {isMobileMenuOpen && (
          <div className="md:hidden border-t border-[var(--border)] py-4 bg-white/95 backdrop-blur-md">
            <nav className="flex flex-col gap-4 mb-6">
              {NAV_LINKS.map((link) => (
                <a
                  key={link.href}
                  href={link.href}
                  onClick={closeMobileMenu}
                  className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200 py-2"
                  style={{ fontFamily: 'var(--font-body)' }}
                >
                  {link.label}
                </a>
              ))}
            </nav>

            <div className="flex items-center gap-6 pt-4 border-t border-[var(--border)] mb-4">
              <a
                href={profile.githubUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
                aria-label="GitHub"
              >
                <Github className="w-5 h-5" />
              </a>
              <a
                href={profile.linkedinUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
                aria-label="LinkedIn"
              >
                <Linkedin className="w-5 h-5" />
              </a>
              <a
                href={`mailto:${profile.email}`}
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
                aria-label="Email"
              >
                <Mail className="w-5 h-5" />
              </a>
            </div>

            <a
              href="#/admin"
              onClick={closeMobileMenu}
              className="inline-flex items-center px-5 py-2.5 rounded-lg text-sm"
              style={{
                backgroundColor: 'var(--primary)',
                color: 'var(--primary-foreground)',
                fontFamily: 'var(--font-body)',
                fontWeight: 'var(--font-weight-semibold)'
              }}
            >
              ENTRAR
            </a>
          </div>
        )}
      </div>
    </header>
  );
}
