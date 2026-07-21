import { useState } from 'react';
import { Pencil, Trash2 } from 'lucide-react';
import { PortfolioStore, type Project } from '../../../lib/portfolioStore';
import { Modal } from './Modal';

type Draft = {
  title: string;
  description: string;
  image: string;
  githubUrl: string;
  liveUrl: string;
  tagsText: string;
};

const EMPTY_DRAFT: Draft = { title: '', description: '', image: '', githubUrl: '', liveUrl: '', tagsText: '' };

function toDraft(p: Project): Draft {
  return {
    title: p.title,
    description: p.description,
    image: p.image,
    githubUrl: p.githubUrl,
    liveUrl: p.liveUrl,
    tagsText: p.tags.join('\n')
  };
}

export function ProjectsTab() {
  const [projects, setProjects] = useState<Project[]>(() => PortfolioStore.getProjects());
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
    setDraft(toDraft(projects[index]));
  };

  const closeModal = () => {
    setDraft(null);
    setEditingIndex(null);
  };

  const handleSave = () => {
    if (!draft) return;
    if (!draft.title.trim()) {
      alert('Informe o título do projeto.');
      return;
    }
    const updated: Project = {
      title: draft.title.trim(),
      description: draft.description.trim(),
      image: draft.image.trim(),
      githubUrl: draft.githubUrl.trim(),
      liveUrl: draft.liveUrl.trim(),
      tags: draft.tagsText.split('\n').map((s) => s.trim()).filter(Boolean)
    };
    const next = [...projects];
    if (isNew) next.unshift(updated);
    else if (editingIndex !== null) next[editingIndex] = updated;
    setProjects(next);
    PortfolioStore.setProjects(next);
    closeModal();
  };

  const handleDelete = (index: number) => {
    if (!confirm('Excluir este projeto?')) return;
    const next = projects.filter((_, i) => i !== index);
    setProjects(next);
    PortfolioStore.setProjects(next);
  };

  return (
    <section>
      <div className="flex items-center justify-between mb-6 flex-wrap gap-4">
        <h2 style={{ fontFamily: 'var(--font-heading)', fontSize: '1.5rem', fontWeight: 'var(--font-weight-bold)' }}>
          Projetos
        </h2>
        <button
          onClick={openNew}
          className="px-4 py-2 rounded-lg text-sm"
          style={{ backgroundColor: 'var(--primary)', color: 'var(--primary-foreground)', fontWeight: 'var(--font-weight-medium)' }}
        >
          + Novo projeto
        </button>
      </div>

      {projects.length === 0 ? (
        <div className="text-center py-12 px-4 border border-dashed border-[var(--border)] rounded-xl" style={{ color: 'var(--neutral-600)' }}>
          Nenhum projeto cadastrado.
        </div>
      ) : (
        <div className="flex flex-col gap-4">
          {projects.map((p, index) => (
            <div key={index} className="bg-white border border-[var(--border)] rounded-xl p-5 flex items-start justify-between gap-4">
              <div>
                <h3 className="mb-1" style={{ fontFamily: 'var(--font-heading)', fontSize: '1.125rem', fontWeight: 'var(--font-weight-semibold)' }}>
                  {p.title}
                </h3>
                <p className="mb-2" style={{ color: 'var(--neutral-600)', fontSize: '0.9375rem' }}>
                  {p.description}
                </p>
                <div className="flex flex-wrap gap-1.5">
                  {p.tags.map((t, i) => (
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
        <Modal title={isNew ? 'Novo projeto' : 'Editar projeto'} onCancel={closeModal} onSave={handleSave}>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Título</label>
            <input className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" value={draft.title} onChange={(e) => setDraft({ ...draft, title: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Descrição</label>
            <textarea className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" rows={3} value={draft.description} onChange={(e) => setDraft({ ...draft, description: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>URL da imagem</label>
            <input className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" value={draft.image} onChange={(e) => setDraft({ ...draft, image: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>URL do GitHub</label>
            <input className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" value={draft.githubUrl} onChange={(e) => setDraft({ ...draft, githubUrl: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>URL do projeto ao vivo</label>
            <input className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" value={draft.liveUrl} onChange={(e) => setDraft({ ...draft, liveUrl: e.target.value })} />
          </div>
          <div>
            <label className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>Tags/tecnologias (uma por linha)</label>
            <textarea className="w-full px-3.5 py-2.5 rounded-lg border border-[var(--border)]" rows={3} value={draft.tagsText} onChange={(e) => setDraft({ ...draft, tagsText: e.target.value })} />
          </div>
        </Modal>
      )}
    </section>
  );
}
