import type { ReactNode } from 'react';
import { X } from 'lucide-react';

export function Modal({
  title,
  children,
  onCancel,
  onSave
}: {
  title: string;
  children: ReactNode;
  onCancel: () => void;
  onSave: () => void;
}) {
  return (
    <div
      className="fixed inset-0 flex items-center justify-center p-6 z-50"
      style={{ backgroundColor: 'rgba(15, 23, 42, 0.5)' }}
      onClick={(e) => {
        if (e.target === e.currentTarget) onCancel();
      }}
    >
      <div
        className="bg-white rounded-xl w-full flex flex-col"
        style={{ maxWidth: '32rem', maxHeight: '90vh', boxShadow: '0 20px 25px -5px rgba(0, 0, 0, 0.2)' }}
      >
        <div className="flex items-center justify-between px-6 py-5 border-b border-[var(--border)]">
          <h3 style={{ fontFamily: 'var(--font-heading)' }}>{title}</h3>
          <button onClick={onCancel} aria-label="Fechar" className="text-[var(--neutral-600)]">
            <X className="w-4 h-4" />
          </button>
        </div>

        <div className="p-6 overflow-y-auto flex flex-col gap-4">{children}</div>

        <div className="flex justify-end gap-3 px-6 py-5 border-t border-[var(--border)]">
          <button
            onClick={onCancel}
            className="px-4 py-2 rounded-lg border border-[var(--border)] text-sm"
          >
            Cancelar
          </button>
          <button
            onClick={onSave}
            className="px-4 py-2 rounded-lg text-sm"
            style={{ backgroundColor: 'var(--primary)', color: 'var(--primary-foreground)', fontWeight: 'var(--font-weight-medium)' }}
          >
            Salvar
          </button>
        </div>
      </div>
    </div>
  );
}
