import { Mail, Github, Linkedin, Globe, Menu, X, Settings } from 'lucide-react';
import { useState } from 'react';
import { PortfolioStore } from '../../lib/portfolioStore';

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
    <header className="fixed top-0 left-0 right-0 z-50 bg-white/80 backdrop-blur-md border-b border-[var(--border)]">
      <div className="max-w-7xl mx-auto px-6 lg:px-8">
        <div className="flex items-center justify-between h-16">
          {/* Logo/Nome */}
          <div className="flex items-center">
            <span className="font-bold tracking-tight" style={{ fontFamily: 'var(--font-heading)', fontSize: '1.25rem', color: 'var(--foreground)' }}>
              {profile.name}
            </span>
          </div>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center gap-8">
            <a 
              href="#sobre" 
              className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
              style={{ fontFamily: 'var(--font-body)' }}
            >
              Sobre
            </a>
            <a 
              href="#habilidades" 
              className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
              style={{ fontFamily: 'var(--font-body)' }}
            >
              Habilidades
            </a>
            <a 
              href="#experiencia" 
              className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
              style={{ fontFamily: 'var(--font-body)' }}
            >
              Experiência
            </a>
            <a 
              href="#projetos" 
              className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
              style={{ fontFamily: 'var(--font-body)' }}
            >
              Projetos
            </a>
            <a 
              href="#contato" 
              className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
              style={{ fontFamily: 'var(--font-body)' }}
            >
              Contato
            </a>
          </nav>

          {/* Desktop Language Switch + Social Links */}
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

              {/* Dropdown Menu */}
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
                    {language === 'pt' && (
                      <span className="ml-auto text-xs">✓</span>
                    )}
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
                    {language === 'en' && (
                      <span className="ml-auto text-xs">✓</span>
                    )}
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
              <div className="w-px h-5 bg-[var(--border)]"></div>
              <a
                href="#/admin"
                className="text-[var(--neutral-600)] hover:text-[var(--primary)] transition-colors duration-200"
                aria-label="Área Administrativa"
                title="Área Administrativa"
              >
                <Settings className="w-5 h-5" />
              </a>
            </div>
          </div>

          {/* Mobile Menu Button + Language */}
          <div className="md:hidden flex items-center gap-4">
            {/* Language Switcher Mobile */}
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

              {/* Dropdown Menu Mobile */}
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
                    {language === 'pt' && (
                      <span className="ml-auto text-xs">✓</span>
                    )}
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
                    {language === 'en' && (
                      <span className="ml-auto text-xs">✓</span>
                    )}
                  </button>
                </div>
              )}
            </div>

            {/* Hamburger Button */}
            <button
              onClick={() => setIsMobileMenuOpen(!isMobileMenuOpen)}
              className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
              aria-label="Menu"
            >
              {isMobileMenuOpen ? (
                <X className="w-6 h-6" />
              ) : (
                <Menu className="w-6 h-6" />
              )}
            </button>
          </div>
        </div>

        {/* Mobile Menu */}
        {isMobileMenuOpen && (
          <div className="md:hidden border-t border-[var(--border)] py-4 bg-white/95 backdrop-blur-md">
            {/* Mobile Navigation */}
            <nav className="flex flex-col gap-4 mb-6">
              <a 
                href="#sobre" 
                onClick={closeMobileMenu}
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200 py-2"
                style={{ fontFamily: 'var(--font-body)' }}
              >
                Sobre
              </a>
              <a 
                href="#habilidades" 
                onClick={closeMobileMenu}
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200 py-2"
                style={{ fontFamily: 'var(--font-body)' }}
              >
                Habilidades
              </a>
              <a 
                href="#experiencia" 
                onClick={closeMobileMenu}
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200 py-2"
                style={{ fontFamily: 'var(--font-body)' }}
              >
                Experiência
              </a>
              <a 
                href="#projetos" 
                onClick={closeMobileMenu}
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200 py-2"
                style={{ fontFamily: 'var(--font-body)' }}
              >
                Projetos
              </a>
              <a 
                href="#contato" 
                onClick={closeMobileMenu}
                className="text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200 py-2"
                style={{ fontFamily: 'var(--font-body)' }}
              >
                Contato
              </a>
            </nav>

            {/* Mobile Social Links */}
            <div className="flex items-center gap-6 pt-4 border-t border-[var(--border)]">
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
              <div className="w-px h-5 bg-[var(--border)]"></div>
              <a
                href="#/admin"
                className="text-[var(--neutral-600)] hover:text-[var(--primary)] transition-colors duration-200"
                aria-label="Área Administrativa"
                title="Área Administrativa"
              >
                <Settings className="w-5 h-5" />
              </a>
            </div>
          </div>
        )}
      </div>
    </header>
  );
}