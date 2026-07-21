import { useState } from 'react';
import { Save } from 'lucide-react';
import { PortfolioStore, type Profile } from '../../../lib/portfolioStore';

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

      <div className="flex flex-col gap-6" style={{ maxWidth: '40rem' }}>
        <div>
          <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Nome</label>
          <input
            style={inputStyle}
            value={profile.name}
            onChange={(e) => setProfile({ ...profile, name: e.target.value })}
            {...focusHandlers()}
          />
        </div>

        <div>
          <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>
            Título (use \n para quebra de linha)
          </label>
          <input
            style={inputStyle}
            value={profile.title.replace(/\n/g, '\\n')}
            onChange={(e) => setProfile({ ...profile, title: e.target.value.replace(/\\n/g, '\n') })}
            {...focusHandlers()}
          />
        </div>

        <div>
          <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Subtítulo</label>
          <textarea
            style={{ ...inputStyle, resize: 'none' }}
            rows={3}
            value={profile.subtitle}
            onChange={(e) => setProfile({ ...profile, subtitle: e.target.value })}
            {...focusHandlers()}
          />
        </div>

        <div>
          <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>GitHub URL</label>
          <input
            style={inputStyle}
            value={profile.githubUrl}
            onChange={(e) => setProfile({ ...profile, githubUrl: e.target.value })}
            {...focusHandlers()}
          />
        </div>

        <div>
          <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>LinkedIn URL</label>
          <input
            style={inputStyle}
            value={profile.linkedinUrl}
            onChange={(e) => setProfile({ ...profile, linkedinUrl: e.target.value })}
            {...focusHandlers()}
          />
        </div>

        <div>
          <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>E-mail</label>
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
    </section>
  );
}
