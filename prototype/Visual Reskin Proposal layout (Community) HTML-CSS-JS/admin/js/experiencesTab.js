// Aba "Experiências" do painel administrativo — equivalente a ExperiencesTab.tsx.

const MONTH_NAMES_PT = [
  'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho',
  'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'
];
const MONTH_NAMES_PT_SHORT = ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'];

function formatMonthLong(yyyyMm) {
  if (!yyyyMm) return '';
  const [y, m] = yyyyMm.split('-').map(Number);
  return `${MONTH_NAMES_PT[m - 1]} ${y}`;
}

function formatMonthShort(yyyyMm) {
  if (!yyyyMm) return '';
  const [y, m] = yyyyMm.split('-').map(Number);
  return `${MONTH_NAMES_PT_SHORT[m - 1]} ${y}`;
}

function formatPeriodLabel(startMonth, endMonth, current) {
  const start = formatMonthLong(startMonth) || 'Início';
  const end = current ? 'Presente' : (formatMonthLong(endMonth) || 'Fim');
  return `${start} — ${end}`;
}

function computeDurationLabel(startMonth, endMonth, current) {
  if (!startMonth) return '';
  const [sy, sm] = startMonth.split('-').map(Number);
  const now = new Date();
  const [ey, em] = current || !endMonth
    ? [now.getFullYear(), now.getMonth() + 1]
    : endMonth.split('-').map(Number);

  let totalMonths = (ey - sy) * 12 + (em - sm) + 1;
  if (totalMonths < 1) totalMonths = 1;

  const years = Math.floor(totalMonths / 12);
  const months = totalMonths % 12;

  const parts = [];
  if (years > 0) parts.push(`${years} ${years === 1 ? 'ano' : 'anos'}`);
  if (months > 0) parts.push(`${months} ${months === 1 ? 'mês' : 'meses'}`);
  return parts.length ? parts.join(' e ') : '1 mês';
}

function renderExperiencesTab(container) {
  let experiences = PortfolioStore.getExperiences();
  let editingIndex = null;
  let draft = emptyDraft();

  function emptyDraft() {
    return {
      role: '', company: '', location: '',
      startMonth: '', endMonth: '', current: false,
      description: '', achievementsText: '', technologiesText: ''
    };
  }

  function toDraft(exp) {
    return {
      role: exp.role,
      company: exp.company,
      location: exp.location,
      startMonth: exp.startMonth || '',
      endMonth: exp.endMonth || '',
      current: !!exp.current,
      description: exp.description,
      achievementsText: exp.achievements.join('\n'),
      technologiesText: exp.technologies.join('\n')
    };
  }

  function openEdit(index) {
    editingIndex = index;
    draft = toDraft(experiences[index]);
    draw();
    container.querySelector('.experiences-form-card')?.scrollIntoView({ behavior: 'smooth', block: 'start' });
  }

  function cancelEdit() {
    editingIndex = null;
    draft = emptyDraft();
    draw();
  }

  function handleSave() {
    if (!draft.company.trim() || !draft.role.trim()) {
      alert('Informe ao menos o nome da empresa e o cargo.');
      return;
    }
    const updated = {
      role: draft.role.trim(),
      company: draft.company.trim(),
      location: draft.location.trim(),
      startMonth: draft.startMonth,
      endMonth: draft.current ? '' : draft.endMonth,
      current: draft.current,
      period: formatPeriodLabel(draft.startMonth, draft.endMonth, draft.current),
      description: draft.description.trim(),
      achievements: linesToArray(draft.achievementsText),
      technologies: linesToArray(draft.technologiesText)
    };
    const next = [...experiences];
    if (editingIndex === null) next.unshift(updated);
    else next[editingIndex] = updated;
    experiences = next;
    PortfolioStore.setExperiences(next);
    cancelEdit();
  }

  function handleDelete(index) {
    if (!confirm('Excluir esta experiência?')) return;
    experiences = experiences.filter((_, i) => i !== index);
    PortfolioStore.setExperiences(experiences);
    if (editingIndex === index) cancelEdit();
    else draw();
  }

  function drawForm() {
    return `
      <div class="admin-form-card experiences-form-card">
        <div class="experiences-form-title">
          <h3>${editingIndex === null ? 'Novo Registro' : 'Editar Registro'}</h3>
          ${editingIndex !== null ? `<button type="button" class="btn-icon-square" data-cancel-edit aria-label="Cancelar edição">${Icons.x('icon-16')}</button>` : ''}
        </div>
        <hr class="experiences-form-divider" />

        <div class="admin-form-field">
          <label>Nome da Empresa</label>
          <input type="text" data-field="company" placeholder="Ex: Studio Editorial Digital" value="${escAdmin(draft.company)}" />
        </div>

        <div class="admin-form-field">
          <label>Cargo</label>
          <input type="text" data-field="role" placeholder="Ex: Lead Curator & Designer" value="${escAdmin(draft.role)}" />
        </div>

        <div class="experiences-date-row">
          <div class="admin-form-field">
            <label>Início</label>
            <input type="month" data-field="startMonth" value="${escAdmin(draft.startMonth)}" />
          </div>
          <div class="admin-form-field">
            <label>Fim (ou atual)</label>
            <input type="month" data-field="endMonth" value="${escAdmin(draft.endMonth)}" ${draft.current ? 'disabled' : ''} />
          </div>
        </div>

        <div class="checkbox-field">
          <input type="checkbox" id="expCurrent" data-field="current" ${draft.current ? 'checked' : ''} />
          <label for="expCurrent">Emprego atual</label>
        </div>

        <div class="admin-form-field">
          <label>Localização</label>
          <input type="text" data-field="location" placeholder="Ex: São Paulo, SP" value="${escAdmin(draft.location)}" />
        </div>

        <div class="admin-form-field">
          <label>Descrição das Atividades</label>
          <textarea rows="3" data-field="description" placeholder="Descreva suas responsabilidades e conquistas...">${escAdmin(draft.description)}</textarea>
        </div>

        <div class="admin-form-field">
          <label>Principais conquistas (uma por linha)</label>
          <textarea rows="3" data-field="achievementsText">${escAdmin(draft.achievementsText)}</textarea>
        </div>

        <div class="admin-form-field">
          <label>Tecnologias (uma por linha)</label>
          <textarea rows="2" data-field="technologiesText">${escAdmin(draft.technologiesText)}</textarea>
        </div>

        <button type="button" class="btn-experiences-save" data-save>${editingIndex === null ? 'Salvar Alterações' : 'Atualizar Registro'}</button>
      </div>`;
  }

  function drawHistoryCard(exp, index) {
    const durationLabel = computeDurationLabel(exp.startMonth, exp.endMonth, exp.current);
    const periodLabel = exp.startMonth ? formatPeriodLabel(exp.startMonth, exp.endMonth, exp.current) : escAdmin(exp.period);

    return `
      <div class="experiences-history-card">
        <div class="experiences-history-top">
          <div>
            ${exp.current ? `<span class="experiences-badge-current">Atual</span>` : ''}
          </div>
          <div class="experiences-history-period">
            <div class="experiences-history-period-range">${escAdmin(periodLabel)}</div>
            ${durationLabel ? `<div class="experiences-history-duration">${escAdmin(durationLabel)}</div>` : ''}
          </div>
        </div>

        <h3 class="experiences-history-role">${escAdmin(exp.role)}</h3>
        <p class="experiences-history-company">${escAdmin(exp.company)}</p>

        ${exp.description ? `<p class="experiences-history-description">${escAdmin(exp.description)}</p>` : ''}

        <div class="experiences-history-actions">
          <button type="button" class="btn-icon-square" data-edit="${index}" aria-label="Editar">${Icons.pencil('icon-16')}</button>
          <button type="button" class="btn-icon-square danger" data-delete="${index}" aria-label="Excluir">${Icons.trash2('icon-16')}</button>
        </div>
      </div>`;
  }

  function draw() {
    const historyHtml = experiences.length === 0
      ? ''
      : experiences.map((exp, index) => drawHistoryCard(exp, index)).join('');

    container.innerHTML = `
      <section class="experiences-tab">
        <div class="admin-section-header">
          <div class="admin-section-header-left">
            <h2>Experiências Profissionais</h2>
          </div>
        </div>
        <p class="experiences-intro">Mantenha seu histórico de carreira atualizado com precisão editorial e destaque suas principais realizações.</p>

        <div class="experiences-layout">
          <div class="experiences-form-col">
            ${drawForm()}
          </div>

          <div class="experiences-history-col">
            <div class="experiences-history-heading">
              <span class="experiences-history-line"></span>
              HISTÓRICO CADASTRADO
            </div>

            ${historyHtml}

            <div class="experiences-empty-state">
              ${Icons.sparkles('icon-24')}
              <h4>Espaço Editorial</h4>
              <p>Continue adicionando suas experiências para completar a narrativa da sua trajetória profissional.</p>
            </div>
          </div>
        </div>
      </section>`;

    attachEvents();
  }

  function attachEvents() {
    container.querySelectorAll('[data-field]').forEach((el) => {
      const eventName = el.type === 'checkbox' ? 'change' : 'input';
      el.addEventListener(eventName, () => {
        if (el.type === 'checkbox') {
          draft[el.dataset.field] = el.checked;
          draw();
          return;
        }
        draft[el.dataset.field] = el.value;
      });
    });

    container.querySelector('[data-save]').addEventListener('click', handleSave);

    const cancelBtn = container.querySelector('[data-cancel-edit]');
    if (cancelBtn) cancelBtn.addEventListener('click', cancelEdit);

    container.querySelectorAll('[data-edit]').forEach((btn) => {
      btn.addEventListener('click', () => openEdit(Number(btn.dataset.edit)));
    });
    container.querySelectorAll('[data-delete]').forEach((btn) => {
      btn.addEventListener('click', () => handleDelete(Number(btn.dataset.delete)));
    });
  }

  draw();
}
