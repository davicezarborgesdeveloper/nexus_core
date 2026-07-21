import { useState } from 'react';
import { Save, User, Type, Star, List, Droplet, Github, Linkedin, Mail, Eye, ArrowRight } from 'lucide-react';
import { PortfolioStore, PROFILE_ACCENT_COLORS, type Profile } from '../../../lib/portfolioStore';

const inputStyle: React.CSSProperties = {
  width: '100%',
  padding: '0.75rem 1rem',
  borderRadius: '0.5rem',
  border: '1px solid var(--border)',
  fontFamily: 'var(--font-body)',
  outline: 'none'
};

function focusHandlers() {
  return {
    onFocus: (e: React.FocusEvent<HTMLInputElement | HTMLTextAreaElement>) => {
      e.currentTarget.style.borderColor = 'var(--primary)';
      e.currentTarget.style.boxShadow = '0 0 0 3px rgba(30, 58, 138, 0.1)';
    },
    onBlur: (e: React.FocusEvent<HTMLInputElement | HTMLTextAreaElement>) => {
      e.currentTarget.style.borderColor = 'var(--border)';
      e.currentTarget.style.boxShadow = 'none';
    }
  };
}

function FieldLabel({ icon: Icon, children, hint }: { icon: typeof User; children: React.ReactNode; hint?: string }) {
  return (
    <label className="flex items-center gap-2 mb-1" style={{ fontWeight: 'var(--font-weight-medium)' }}>
      <Icon className="w-4 h-4" style={{ color: 'var(--neutral-500)' }} />
      {children}
      {hint && <span className="text-sm font-normal" style={{ color: 'var(--neutral-500)' }}>{hint}</span>}
    </label>
  );
}

export function ProfileTab() {
  const [profile, setProfile] = useState<Profile>(() => PortfolioStore.getProfile());

  const updateStat = (index: 0 | 1 | 2, field: 'number' | 'label', value: string) => {
    const stats = [...profile.stats] as Profile['stats'];
    stats[index] = { ...stats[index], [field]: value };
    setProfile({ ...profile, stats });
  };

  const handleSave = () => {
    if (!profile.name.trim()) {
      alert('Informe o nome.');
      return;
    }
    PortfolioStore.setProfile(profile);
    alert('Perfil salvo com sucesso.');
  };

  const titleLines = profile.title.split('\n');

  return (
    <section>
      <div className="flex items-center justify-between mb-6 flex-wrap gap-4">
        <h2 style={{ fontFamily: 'var(--font-heading)', fontSize: '1.5rem', fontWeight: 'var(--font-weight-bold)' }}>
          Perfil
        </h2>
        <button
          onClick={handleSave}
          className="inline-flex items-center gap-2 px-4 py-2 rounded-lg text-sm"
          style={{ backgroundColor: 'var(--primary)', color: 'var(--primary-foreground)', fontWeight: 'var(--font-weight-medium)' }}
        >
          <Save className="w-4 h-4" />
          Salvar
        </button>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">
        {/* Coluna esquerda: formulário */}
        <div className="rounded-xl border p-6" style={{ borderColor: 'var(--border)' }}>
          <div className="flex items-center gap-2 mb-1">
            <User className="w-5 h-5" style={{ color: 'var(--primary)' }} />
            <h3 style={{ fontWeight: 'var(--font-weight-semibold)' }}>Perfil</h3>
          </div>
          <p className="text-sm mb-6" style={{ color: 'var(--neutral-500)' }}>
            Edite as informações que serão exibidas no seu perfil.
          </p>

          <div className="flex flex-col gap-5">
            <div>
              <FieldLabel icon={User}>Nome</FieldLabel>
              <input
                style={inputStyle}
                value={profile.name}
                onChange={(e) => setProfile({ ...profile, name: e.target.value })}
                {...focusHandlers()}
              />
            </div>

            <div>
              <FieldLabel icon={Type} hint="Ex: Desenvolvedor Full Stack">Título principal</FieldLabel>
              <input
                style={inputStyle}
                value={titleLines[0] ?? ''}
                onChange={(e) => {
                  const rest = titleLines.slice(1).join('\n');
                  setProfile({ ...profile, title: rest ? `${e.target.value}\n${rest}` : e.target.value });
                }}
                {...focusHandlers()}
              />
            </div>

            <div>
              <FieldLabel icon={Star} hint="Ex: Criando soluções digitais">Destaque / Frase de impacto</FieldLabel>
              <input
                style={inputStyle}
                value={titleLines.slice(1).join('\n')}
                onChange={(e) => setProfile({ ...profile, title: `${titleLines[0] ?? ''}\n${e.target.value}` })}
                {...focusHandlers()}
              />
            </div>

            <div>
              <FieldLabel icon={List} hint="Fale um pouco sobre você e seu trabalho">Descrição</FieldLabel>
              <textarea
                style={{ ...inputStyle, resize: 'none' }}
                rows={3}
                value={profile.subtitle}
                onChange={(e) => setProfile({ ...profile, subtitle: e.target.value })}
                {...focusHandlers()}
              />
            </div>

            <div>
              <FieldLabel icon={Droplet} hint="Escolha a cor da frase de destaque">Cor do destaque</FieldLabel>
              <div className="flex items-center gap-3">
                {PROFILE_ACCENT_COLORS.map((color) => (
                  <button
                    key={color}
                    type="button"
                    aria-label={color}
                    onClick={() => setProfile({ ...profile, accentColor: color })}
                    className="rounded-lg flex items-center justify-center transition-transform duration-150"
                    style={{
                      width: '2.25rem',
                      height: '2.25rem',
                      backgroundColor: color,
                      outline: profile.accentColor === color ? '2px solid var(--foreground)' : 'none',
                      outlineOffset: '2px'
                    }}
                  >
                    {profile.accentColor === color && <span style={{ color: 'white' }}>✓</span>}
                  </button>
                ))}
              </div>
            </div>

            <div>
              <FieldLabel icon={Github}>GitHub URL</FieldLabel>
              <input
                style={inputStyle}
                placeholder="https://github.com/seuusuario"
                value={profile.githubUrl}
                onChange={(e) => setProfile({ ...profile, githubUrl: e.target.value })}
                {...focusHandlers()}
              />
            </div>

            <div>
              <FieldLabel icon={Linkedin}>LinkedIn URL</FieldLabel>
              <input
                style={inputStyle}
                value={profile.linkedinUrl}
                onChange={(e) => setProfile({ ...profile, linkedinUrl: e.target.value })}
                {...focusHandlers()}
              />
            </div>

            <div>
              <FieldLabel icon={Mail}>E-mail</FieldLabel>
              <input
                type="email"
                style={inputStyle}
                value={profile.email}
                onChange={(e) => setProfile({ ...profile, email: e.target.value })}
                {...focusHandlers()}
              />
            </div>

            <div>
              <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Localização</label>
              <input
                style={inputStyle}
                value={profile.location}
                onChange={(e) => setProfile({ ...profile, location: e.target.value })}
                {...focusHandlers()}
              />
            </div>

            <div className="flex items-center justify-between">
              <label style={{ fontWeight: 'var(--font-weight-medium)' }}>Disponível para projetos</label>
              <button
                type="button"
                onClick={() => setProfile({ ...profile, available: !profile.available })}
                className="relative rounded-full transition-colors duration-200"
                style={{
                  width: '2.75rem',
                  height: '1.5rem',
                  backgroundColor: profile.available ? 'var(--primary)' : 'var(--neutral-300)',
                  flexShrink: 0
                }}
                aria-pressed={profile.available}
              >
                <span
                  className="absolute rounded-full bg-white transition-transform duration-200"
                  style={{
                    width: '1.125rem',
                    height: '1.125rem',
                    top: '0.1875rem',
                    left: '0.1875rem',
                    transform: profile.available ? 'translateX(1.25rem)' : 'translateX(0)'
                  }}
                />
              </button>
            </div>

            <div>
              <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Stats</label>
              <div className="grid grid-cols-3 gap-3">
                {[0, 1, 2].map((i) => (
                  <input
                    key={`number-${i}`}
                    style={inputStyle}
                    value={profile.stats[i as 0 | 1 | 2].number}
                    onChange={(e) => updateStat(i as 0 | 1 | 2, 'number', e.target.value)}
                    placeholder={['5+', '50+', '20+'][i]}
                    {...focusHandlers()}
                  />
                ))}
                {[0, 1, 2].map((i) => (
                  <input
                    key={`label-${i}`}
                    style={inputStyle}
                    value={profile.stats[i as 0 | 1 | 2].label}
                    onChange={(e) => updateStat(i as 0 | 1 | 2, 'label', e.target.value)}
                    placeholder={['Anos de experiência', 'Projetos concluídos', 'Clientes satisfeitos'][i]}
                    {...focusHandlers()}
                  />
                ))}
              </div>
            </div>
          </div>
        </div>

        {/* Coluna direita: preview ao vivo */}
        <div className="lg:sticky" style={{ top: '1.5rem' }}>
          <div className="flex items-center gap-2 mb-1">
            <Eye className="w-5 h-5" style={{ color: 'var(--primary)' }} />
            <h3 style={{ fontWeight: 'var(--font-weight-semibold)' }}>Pré-visualização</h3>
          </div>
          <p className="text-sm mb-4" style={{ color: 'var(--neutral-500)' }}>
            Veja como seu perfil ficará para os visitantes.
          </p>

          <div className="rounded-xl border p-8" style={{ borderColor: 'var(--border)', backgroundColor: 'var(--neutral-50)' }}>
            <h1
              className="mb-4"
              style={{
                fontFamily: 'var(--font-heading)',
                fontSize: 'clamp(1.75rem, 4vw, 2.5rem)',
                fontWeight: 'var(--font-weight-bold)',
                lineHeight: '1.15',
                color: 'var(--foreground)',
                letterSpacing: '-0.02em'
              }}
            >
              {titleLines.map((line, i) => (
                i === titleLines.length - 1 ? (
                  <span key={i} style={{ color: profile.accentColor }}>{line}</span>
                ) : (
                  <span key={i}>{line}<br /></span>
                )
              ))}
            </h1>

            <p
              className="mb-6"
              style={{
                fontFamily: 'var(--font-body)',
                fontSize: '1rem',
                lineHeight: '1.7',
                color: 'var(--neutral-600)'
              }}
            >
              {profile.subtitle}
            </p>

            <div className="flex flex-wrap items-center gap-3">
              <a
                href={profile.githubUrl || '#'}
                className="inline-flex items-center gap-2 px-5 py-2.5 rounded-lg text-sm"
                style={{
                  backgroundColor: profile.accentColor,
                  color: 'white',
                  fontFamily: 'var(--font-body)',
                  fontWeight: 'var(--font-weight-medium)'
                }}
              >
                <Github className="w-4 h-4" />
                Ver no GitHub
                <ArrowRight className="w-4 h-4" />
              </a>

              {profile.linkedinUrl && (
                <a
                  href={profile.linkedinUrl}
                  className="rounded-full border flex items-center justify-center"
                  style={{ width: '2.5rem', height: '2.5rem', borderColor: 'var(--border)', color: 'var(--foreground)' }}
                >
                  <Linkedin className="w-4 h-4" />
                </a>
              )}

              {profile.email && (
                <a
                  href={`mailto:${profile.email}`}
                  className="rounded-full border flex items-center justify-center"
                  style={{ width: '2.5rem', height: '2.5rem', borderColor: 'var(--border)', color: 'var(--foreground)' }}
                >
                  <Mail className="w-4 h-4" />
                </a>
              )}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
