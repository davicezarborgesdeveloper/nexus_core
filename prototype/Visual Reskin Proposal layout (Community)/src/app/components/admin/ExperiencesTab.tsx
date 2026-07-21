import { useState } from 'react';
import { Pencil, Trash2 } from 'lucide-react';
import { PortfolioStore, type Experience } from '../../../lib/portfolioStore';
import { Modal } from './Modal';

type Draft = {
  role: string;
  company: string;
  location: string;
  period: string;
  current: boolean;
  description: string;
  achievementsText: string;
  technologiesText: string;
};

const EMPTY_DRAFT: Draft = {
  role: '', company: '', location: '', period: '', current: false,
  description: '', achievementsText: '', technologiesText: ''
};

function toDraft(exp: Experience): Draft {
  return {
    role: exp.role,
    company: exp.company,
    location: exp.location,
    period: exp.period,
    current: exp.current,
    description: exp.description,
    achievementsText: exp.achievements.join('\n'),
    technologiesText: exp.technologies.join('\n')
  };
}

export function ExperiencesTab() {
  const [experiences, setExperiences] = useState<Experience[]>(() => PortfolioStore.getExperiences());
  const [editingIndex, setEditingIndex] = useState<number | null>(null);
  const [isNew, setIsNew] = useState(false);
  const [draft, setDraft] = useState<Draft | null>(null);

  const openNew = () => {
    setIsNew(true);
    setEditingIndex(null);
    setDraft({ ...EMPTY_DRAFT });
  };

  const openEdit = (index: number) => {
    setIsNew(false);
    setEditingIndex(index);
    setDraft(toDraft(experiences[index]));
  };

  const closeModal = () => {
    setDraft(null);
    setEditingIndex(null);
  };

  const handleSave = () => {
    if (!draft) return;
    if (!draft.role.trim() || !draft.company.trim()) {
      alert('Informe ao menos o cargo e a empresa.');
      return;
    }
    const updated: Experience = {
      role: draft.role.trim(),
      company: draft.company.trim(),
      location: draft.location.trim(),
      period: draft.period.trim(),
      current: draft.current,
      description: draft.description.trim(),
      achievements: draft.achievementsText.split('\n').map((s) => s.trim()).filter(Boolean),
      technologies: draft.technologiesText.split('\n').map((s) => s.trim()).filter(Boolean)
    };
    const next = [...experiences];
    if (isNew) next.unshift(updated);
    else if (editingIndex !== null) next[editingIndex] = updated;
    setExperiences(next);
    PortfolioStore.setExperiences(next);
    closeModal();
  };

  const handleDelete = (index: number) => {
    if (!confirm('Excluir esta experiência?')) return;
    const next = experiences.filter((_, i) => i !== index);
    setExperiences(next);
    PortfolioStore.setExperiences(next);
  };

  return (
    <section>
      <div className="flex items-center justify-between mb-6 flex-wrap gap-4">
        <h2 style={{ fontFamily: 'var(--font-heading)', fontSize: '1.5rem', fontWeight: 'var(--font-weight-bold)' }}>
          Experiências
        </h2>
        <button
          onClick={openNew}
          className="px-4 py-2 rounded-lg text-sm"
          style={{ backgroundColor: 'var(--primary)', color: 'var(--primary-foreground)', fontWeight: 'var(--font-weight-medium)' }}
        >
          + Nova experiência
        </button>
      </div>

      {experiences.length === 0 ? (
        <div className="text-center py-12 px-4 border border-dashed border-[var(--border)] rounded-xl" style={{ color: 'var(--neutral-600)' }}>
          Nenhuma experiência cadastrada.
        </div>
      ) : (
        <div className="flex flex-col gap-4">
          {experiences.map((exp, index) => (
            <div key={index} className="bg-white border border-[var(--border)] rounded-xl p-5 flex items-start justify-between gap-4">
              <div>
                <h3 className="mb-1 flex items-center gap-2" style={{ fontFamily: 'var(--font-heading)', fontSize: '1.125rem', fontWeight: 'var(--font-weight-semibold)' }}>
                  {exp.role}
                  {exp.current && (
                    <span
                      className="px-2 py-0.5 rounded text-xs"
                      style={{ backgroundColor: 'var(--accent-color)', color: 'var(--accent-foreground)', fontWeight: 'var(--font-weight-medium)' }}
                    >
                      Atual
                    </span>
                  )}
                </h3>
                <p className="mb-2" style={{ color: 'var(--neutral-600)', fontSize: '0.9375rem' }}>
                  {exp.company} · {exp.period} · {exp.location}
                </p>
                <div className="flex flex-wrap gap-1.5">
                  {exp.technologies.map((t, i) => (
                    <span key={i} className="px-3 py-1 rounded-md text-sm" style={{ backgroundColor: 'var(--neutral-100)', color: 'var(--neutral-700)' }}>
                      {t}
                    </span>
                  ))}
                </div>
              </div>
              <div className="flex gap-2 flex-shrink-0">
                <button
                  onClick={() => openEdit(index)}
                  className="w-9 h-9 rounded-lg border border-[var(--border)] flex items-center justify-center text-[var(--neutral-600)] hover:text-[var(--foreground)]"
                  aria-label="Editar"
                >
                  <Pencil className="w-4 h-4" />
                </button>
                <button
                  onClick={() => handleDelete(index)}
                  className="w-9 h-9 rounded-lg border border-[var(--border)] flex items-center justify-center text-[var(--neutral-600)] hover:text-red-600 hover:border-red-600"
                  aria-label="Excluir"
                >
                  <Trash2 className="w-4 h-4" />
                </button>
              </div>
            </div>
          ))}
        </div>
      )}

      {draft && (
        <Modal title={isNew ? 'Nova experiência' : 'Editar experiência'} onCancel={closeModal} onSave={handleSave}>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Cargo</label>
            <input className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" value={draft.role} onChange={(e) => setDraft({ ...draft, role: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Empresa</label>
            <input className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" value={draft.company} onChange={(e) => setDraft({ ...draft, company: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Localização</label>
            <input className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" value={draft.location} onChange={(e) => setDraft({ ...draft, location: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Período (ex: Jan 2023 - Presente)</label>
            <input className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" value={draft.period} onChange={(e) => setDraft({ ...draft, period: e.target.value })} />
          </div>
          <div className="flex items-center gap-2">
            <input
              type="checkbox"
              id="expCurrent"
              checked={draft.current}
              onChange={(e) => setDraft({ ...draft, current: e.target.checked })}
            />
            <label htmlFor="expCurrent">Emprego atual</label>
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Descrição</label>
            <textarea className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" rows={3} value={draft.description} onChange={(e) => setDraft({ ...draft, description: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Principais conquistas (uma por linha)</label>
            <textarea className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" rows={3} value={draft.achievementsText} onChange={(e) => setDraft({ ...draft, achievementsText: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Tecnologias (uma por linha)</label>
            <textarea className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" rows={3} value={draft.technologiesText} onChange={(e) => setDraft({ ...draft, technologiesText: e.target.value })} />
          </div>
        </Modal>
      )}
    </section>
  );
}
