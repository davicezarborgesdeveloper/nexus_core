import { Mail, Github, Linkedin, MapPin } from 'lucide-react';
import { PortfolioStore } from '../../lib/portfolioStore';

export function ContactSection() {
  const profile = PortfolioStore.getProfile();
  const githubHandle = '@' + (profile.githubUrl.split('/').filter(Boolean).pop() || 'seuusuario');
  const linkedinHandle = '/in/' + (profile.linkedinUrl.split('/').filter(Boolean).pop() || 'seuusuario');

  return (
    <section id="contato" className="py-24 bg-[var(--neutral-50)]">
      <div className="max-w-7xl mx-auto px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16">
          {/* Left Column - Info */}
          <div>
            <div 
              className="inline-block px-4 py-1 rounded-full mb-4"
              style={{ backgroundColor: 'var(--primary)', color: 'var(--primary-foreground)' }}
            >
              <span className="text-sm" style={{ fontFamily: 'var(--font-body)', fontWeight: 'var(--font-weight-medium)' }}>
                Contato
              </span>
            </div>
            
            <h2 
              className="mb-4"
              style={{ 
                fontFamily: 'var(--font-heading)',
                fontSize: 'clamp(2rem, 4vw, 3rem)',
                fontWeight: 'var(--font-weight-bold)',
                color: 'var(--foreground)',
                lineHeight: '1.2'
              }}
            >
              Vamos trabalhar juntos
            </h2>
            
            <p 
              className="mb-8"
              style={{ 
                fontFamily: 'var(--font-body)',
                fontSize: '1.125rem',
                color: 'var(--neutral-600)',
                lineHeight: '1.7'
              }}
            >
              Estou sempre aberto a discutir novos projetos, ideias criativas ou oportunidades de fazer parte de sua visão.
            </p>

            {/* Contact Info Cards */}
            <div className="space-y-4 mb-8">
              <a
                href={`mailto:${profile.email}`}
                className="flex items-center gap-4 p-4 rounded-lg border border-[var(--border)] bg-white transition-all duration-200 group"
                onMouseEnter={(e) => {
                  e.currentTarget.style.borderColor = 'var(--primary)';
                  e.currentTarget.style.transform = 'translateX(4px)';
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.borderColor = 'var(--border)';
                  e.currentTarget.style.transform = 'translateX(0)';
                }}
              >
                <div 
                  className="w-12 h-12 rounded-lg flex items-center justify-center"
                  style={{ backgroundColor: 'var(--neutral-100)' }}
                >
                  <Mail className="w-5 h-5" style={{ color: 'var(--primary)' }} />
                </div>
                <div>
                  <div 
                    className="text-sm mb-1"
                    style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}
                  >
                    Email
                  </div>
                  <div 
                    style={{ 
                      fontFamily: 'var(--font-body)',
                      fontWeight: 'var(--font-weight-medium)',
                      color: 'var(--foreground)'
                    }}
                  >
                    {profile.email}
                  </div>
                </div>
              </a>

              <a
                href={profile.githubUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-4 p-4 rounded-lg border border-[var(--border)] bg-white transition-all duration-200 group"
                onMouseEnter={(e) => {
                  e.currentTarget.style.borderColor = 'var(--primary)';
                  e.currentTarget.style.transform = 'translateX(4px)';
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.borderColor = 'var(--border)';
                  e.currentTarget.style.transform = 'translateX(0)';
                }}
              >
                <div 
                  className="w-12 h-12 rounded-lg flex items-center justify-center"
                  style={{ backgroundColor: 'var(--neutral-100)' }}
                >
                  <Github className="w-5 h-5" style={{ color: 'var(--primary)' }} />
                </div>
                <div>
                  <div 
                    className="text-sm mb-1"
                    style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}
                  >
                    GitHub
                  </div>
                  <div 
                    style={{ 
                      fontFamily: 'var(--font-body)',
                      fontWeight: 'var(--font-weight-medium)',
                      color: 'var(--foreground)'
                    }}
                  >
                    {githubHandle}
                  </div>
                </div>
              </a>

              <a
                href={profile.linkedinUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="flex items-center gap-4 p-4 rounded-lg border border-[var(--border)] bg-white transition-all duration-200 group"
                onMouseEnter={(e) => {
                  e.currentTarget.style.borderColor = 'var(--primary)';
                  e.currentTarget.style.transform = 'translateX(4px)';
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.borderColor = 'var(--border)';
                  e.currentTarget.style.transform = 'translateX(0)';
                }}
              >
                <div 
                  className="w-12 h-12 rounded-lg flex items-center justify-center"
                  style={{ backgroundColor: 'var(--neutral-100)' }}
                >
                  <Linkedin className="w-5 h-5" style={{ color: 'var(--primary)' }} />
                </div>
                <div>
                  <div 
                    className="text-sm mb-1"
                    style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}
                  >
                    LinkedIn
                  </div>
                  <div 
                    style={{ 
                      fontFamily: 'var(--font-body)',
                      fontWeight: 'var(--font-weight-medium)',
                      color: 'var(--foreground)'
                    }}
                  >
                    {linkedinHandle}
                  </div>
                </div>
              </a>

              <div 
                className="flex items-center gap-4 p-4 rounded-lg border border-[var(--border)] bg-white"
              >
                <div 
                  className="w-12 h-12 rounded-lg flex items-center justify-center"
                  style={{ backgroundColor: 'var(--neutral-100)' }}
                >
                  <MapPin className="w-5 h-5" style={{ color: 'var(--primary)' }} />
                </div>
                <div>
                  <div 
                    className="text-sm mb-1"
                    style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}
                  >
                    Localização
                  </div>
                  <div 
                    style={{ 
                      fontFamily: 'var(--font-body)',
                      fontWeight: 'var(--font-weight-medium)',
                      color: 'var(--foreground)'
                    }}
                  >
                    {profile.location}
                  </div>
                </div>
              </div>
            </div>
          </div>

          {/* Right Column - Form */}
          <div>
            <form className="space-y-6">
              <div>
                <label 
                  htmlFor="name"
                  className="block mb-2"
                  style={{ 
                    fontFamily: 'var(--font-body)',
                    fontWeight: 'var(--font-weight-medium)',
                    color: 'var(--foreground)'
                  }}
                >
                  Nome
                </label>
                <input
                  type="text"
                  id="name"
                  name="name"
                  className="w-full px-4 py-3 rounded-lg border border-[var(--border)] bg-white focus:outline-none focus:ring-2 transition-all duration-200"
                  style={{ 
                    fontFamily: 'var(--font-body)',
                    color: 'var(--foreground)'
                  }}
                  placeholder="Seu nome"
                  onFocus={(e) => {
                    e.currentTarget.style.borderColor = 'var(--primary)';
                    e.currentTarget.style.boxShadow = '0 0 0 3px rgba(30, 58, 138, 0.1)';
                  }}
                  onBlur={(e) => {
                    e.currentTarget.style.borderColor = 'var(--border)';
                    e.currentTarget.style.boxShadow = 'none';
                  }}
                />
              </div>

              <div>
                <label 
                  htmlFor="email"
                  className="block mb-2"
                  style={{ 
                    fontFamily: 'var(--font-body)',
                    fontWeight: 'var(--font-weight-medium)',
                    color: 'var(--foreground)'
                  }}
                >
                  Email
                </label>
                <input
                  type="email"
                  id="email"
                  name="email"
                  className="w-full px-4 py-3 rounded-lg border border-[var(--border)] bg-white focus:outline-none focus:ring-2 transition-all duration-200"
                  style={{ 
                    fontFamily: 'var(--font-body)',
                    color: 'var(--foreground)'
                  }}
                  placeholder="seu@email.com"
                  onFocus={(e) => {
                    e.currentTarget.style.borderColor = 'var(--primary)';
                    e.currentTarget.style.boxShadow = '0 0 0 3px rgba(30, 58, 138, 0.1)';
                  }}
                  onBlur={(e) => {
                    e.currentTarget.style.borderColor = 'var(--border)';
                    e.currentTarget.style.boxShadow = 'none';
                  }}
                />
              </div>

              <div>
                <label 
                  htmlFor="message"
                  className="block mb-2"
                  style={{ 
                    fontFamily: 'var(--font-body)',
                    fontWeight: 'var(--font-weight-medium)',
                    color: 'var(--foreground)'
                  }}
                >
                  Mensagem
                </label>
                <textarea
                  id="message"
                  name="message"
                  rows={6}
                  className="w-full px-4 py-3 rounded-lg border border-[var(--border)] bg-white focus:outline-none focus:ring-2 transition-all duration-200 resize-none"
                  style={{ 
                    fontFamily: 'var(--font-body)',
                    color: 'var(--foreground)'
                  }}
                  placeholder="Conte-me sobre seu projeto..."
                  onFocus={(e) => {
                    e.currentTarget.style.borderColor = 'var(--primary)';
                    e.currentTarget.style.boxShadow = '0 0 0 3px rgba(30, 58, 138, 0.1)';
                  }}
                  onBlur={(e) => {
                    e.currentTarget.style.borderColor = 'var(--border)';
                    e.currentTarget.style.boxShadow = 'none';
                  }}
                />
              </div>

              <button
                type="submit"
                className="w-full px-6 py-3 rounded-lg transition-all duration-200"
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
                Enviar mensagem
              </button>
            </form>
          </div>
        </div>
      </div>
    </section>
  );
}
