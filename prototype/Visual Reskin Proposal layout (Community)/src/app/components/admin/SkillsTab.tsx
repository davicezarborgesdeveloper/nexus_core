import { useState } from 'react';
import { Pencil, Trash2 } from 'lucide-react';
import { PortfolioStore, type SkillCategory } from '../../../lib/portfolioStore';
import { Modal } from './Modal';

const ICON_OPTIONS: SkillCategory['icon'][] = ['code', 'terminal', 'rocket', 'zap'];

export function SkillsTab() {
  const [skills, setSkills] = useState<SkillCategory[]>(() => PortfolioStore.getSkills());
  const [editingIndex, setEditingIndex] = useState<number | null>(null);
  const [isNew, setIsNew] = useState(false);
  const [draft, setDraft] = useState<{ title: string; icon: SkillCategory['icon']; skillsText: string } | null>(null);

  const openNew = () => {
    setIsNew(true);
    setEditingIndex(null);
    setDraft({ title: '', icon: 'code', skillsText: '' });
  };

  const openEdit = (index: number) => {
    const cat = skills[index];
    setIsNew(false);
    setEditingIndex(index);
    setDraft({ title: cat.title, icon: cat.icon, skillsText: cat.skills.join('\n') });
  };

  const closeModal = () => {
    setDraft(null);
    setEditingIndex(null);
  };

  const handleSave = () => {
    if (!draft) return;
    if (!draft.title.trim()) {
      alert('Informe o título da categoria.');
      return;
    }
    const updated: SkillCategory = {
      title: draft.title.trim(),
      icon: draft.icon,
      skills: draft.skillsText.split('\n').map((s) => s.trim()).filter(Boolean)
    };
    const next = [...skills];
    if (isNew) next.push(updated);
    else if (editingIndex !== null) next[editingIndex] = updated;
    setSkills(next);
    PortfolioStore.setSkills(next);
    closeModal();
  };

  const handleDelete = (index: number) => {
    if (!confirm('Excluir esta categoria de habilidade?')) return;
    const next = skills.filter((_, i) => i !== index);
    setSkills(next);
    PortfolioStore.setSkills(next);
  };

  return (
    <section>
      <div className="flex items-center justify-between mb-6 flex-wrap gap-4">
        <h2 style={{ fontFamily: 'var(--font-heading)', fontSize: '1.5rem', fontWeight: 'var(--font-weight-bold)' }}>
          Habilidades
        </h2>
        <button
          onClick={openNew}
          className="px-4 py-2 rounded-lg text-sm"
          style={{ backgroundColor: 'var(--primary)', color: 'var(--primary-foreground)', fontWeight: 'var(--font-weight-medium)' }}
        >
          + Nova categoria
        </button>
      </div>

      {skills.length === 0 ? (
        <div className="text-center py-12 px-4 border border-dashed border-[var(--border)] rounded-xl" style={{ color: 'var(--neutral-600)' }}>
          Nenhuma categoria de habilidade cadastrada.
        </div>
      ) : (
        <div className="flex flex-col gap-4">
          {skills.map((cat, index) => (
            <div key={index} className="bg-white border border-[var(--border)] rounded-xl p-5 flex items-start justify-between gap-4">
              <div>
                <h3 className="mb-1" style={{ fontFamily: 'var(--font-heading)', fontSize: '1.125rem', fontWeight: 'var(--font-weight-semibold)' }}>
                  {cat.title}
                </h3>
                <div className="flex flex-wrap gap-1.5">
                  {cat.skills.map((s, i) => (
                    <span
                      key={i}
                      className="px-3 py-1 rounded-md text-sm"
                      style={{ backgroundColor: 'var(--neutral-100)', color: 'var(--neutral-700)' }}
                    >
                      {s}
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
        <Modal title={isNew ? 'Nova categoria de habilidade' : 'Editar categoria'} onCancel={closeModal} onSave={handleSave}>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Título da categoria</label>
            <input
              className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]"
              value={draft.title}
              onChange={(e) => setDraft({ ...draft, title: e.target.value })}
            />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Ícone</label>
            <select
              className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]"
              value={draft.icon}
              onChange={(e) => setDraft({ ...draft, icon: e.target.value as SkillCategory['icon'] })}
            >
              {ICON_OPTIONS.map((icon) => (
                <option key={icon} value={icon}>{icon}</option>
              ))}
            </select>
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Habilidades (uma por linha)</label>
            <textarea
              className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]"
              rows={5}
              value={draft.skillsText}
              onChange={(e) => setDraft({ ...draft, skillsText: e.target.value })}
            />
          </div>
        </Modal>
      )}
    </section>
  );
}
