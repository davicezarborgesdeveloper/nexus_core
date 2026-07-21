import { useState } from 'react';
import { User, Folder, Briefcase, Zap, ExternalLink, LogOut } from 'lucide-react';
import { ProfileTab } from './ProfileTab';
import { ProjectsTab } from './ProjectsTab';
import { ExperiencesTab } from './ExperiencesTab';
import { SkillsTab } from './SkillsTab';

type Tab = 'profile' | 'projects' | 'experiences' | 'skills' | 'settings';

const TABS: { id: Tab; label: string; icon: typeof User }[] = [
  { id: 'profile', label: 'Perfil', icon: User },
  { id: 'projects', label: 'Projetos', icon: Folder },
  { id: 'experiences', label: 'Experiências', icon: Briefcase },
  { id: 'skills', label: 'Habilidades', icon: Zap }
];

export function AdminDashboard({ onLogout }: { onLogout: () => void }) {
  const [activeTab, setActiveTab] = useState<Tab>('profile');

  return (
    <div className="min-h-screen bg-[var(--neutral-50)]" style={{ fontFamily: 'var(--font-body)' }}>
      <header className="sticky top-0 z-10 bg-white border-b border-[var(--border)]">
        <div className="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
          <div className="flex items-center gap-2" style={{ fontFamily: 'var(--font-heading)', fontWeight: 'var(--font-weight-semibold)', color: 'var(--primary)' }}>
            Painel Administrativo
          </div>
          <div className="flex items-center gap-3">
            <a
              href="#/"
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 px-4 py-2 rounded-lg border border-[var(--border)] text-sm transition-colors duration-200 hover:bg-[var(--neutral-50)]"
            >
              <ExternalLink className="w-4 h-4" />
              Ver portfólio
            </a>
            <button
              onClick={onLogout}
              className="inline-flex items-center gap-2 px-4 py-2 rounded-lg text-sm text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
            >
              <LogOut className="w-4 h-4" />
              Sair
            </button>
          </div>
        </div>
      </header>

      <div className="max-w-7xl mx-auto px-6 py-8 grid grid-cols-1 md:grid-cols-[220px_1fr] gap-8">
        <nav className="flex md:flex-col gap-2 overflow-x-auto">
          {TABS.map(({ id, label, icon: Icon }) => (
            <button
              key={id}
              onClick={() => setActiveTab(id)}
              className="flex items-center gap-2.5 px-4 py-3 rounded-lg text-left whitespace-nowrap transition-all duration-150"
              style={{
                backgroundColor: activeTab === id ? 'var(--primary)' : 'transparent',
                color: activeTab === id ? 'var(--primary-foreground)' : 'var(--neutral-600)',
                fontWeight: 'var(--font-weight-medium)'
              }}
            >
              <Icon className="w-4 h-4" />
              {label}
            </button>
          ))}
        </nav>

        <main>
          {activeTab === 'profile' && <ProfileTab />}
          {activeTab === 'projects' && <ProjectsTab />}
          {activeTab === 'experiences' && <ExperiencesTab />}
          {activeTab === 'skills' && <SkillsTab />}
        </main>
      </div>
    </div>
  );
}
