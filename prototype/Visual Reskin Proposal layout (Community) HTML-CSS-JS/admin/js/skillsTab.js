// Aba "Habilidades" do painel administrativo — equivalente a SkillsTab.tsx.

const SKILLS_ICON_OPTIONS = ['grid', 'database', 'palette', 'rocket', 'zap', 'code', 'terminal'];

function renderSkillsTab(container) {
  let skills = PortfolioStore.getSkills();
  let editingIndex = null;
  let isNew = false;
  let draft = null;
  let newSkillCategory = skills.length ? 0 : null;

  function openNew() {
    isNew = true;
    editingIndex = null;
    draft = { title: '', icon: 'grid', skillsText: '' };
    draw();
  }

  function openEdit(index) {
    const cat = skills[index];
    isNew = false;
    editingIndex = index;
    draft = { title: cat.title, icon: cat.icon, skillsText: cat.skills.join('\n') };
    draw();
  }

  function closeEditor() {
    draft = null;
    editingIndex = null;
    draw();
  }

  function handleSave() {
    if (!draft.title.trim()) {
      alert('Informe o título da categoria.');
      return;
    }
    const updated = {
      title: draft.title.trim(),
      icon: draft.icon,
      skills: linesToArray(draft.skillsText)
    };
    const next = [...skills];
    if (isNew) next.push(updated);
    else if (editingIndex !== null) next[editingIndex] = updated;
    skills = next;
    PortfolioStore.setSkills(next);
    closeEditor();
  }

  function handleDeleteCategory(index) {
    if (!confirm('Excluir esta categoria de habilidade?')) return;
    skills = skills.filter((_, i) => i !== index);
    PortfolioStore.setSkills(skills);
    if (newSkillCategory === index) newSkillCategory = skills.length ? 0 : null;
    draw();
  }

  function handleAddSkill(name, categoryIndex) {
    const trimmed = name.trim();
    if (!trimmed) {
      alert('Informe o nome da habilidade.');
      return;
    }
    if (categoryIndex === null || categoryIndex === undefined) {
      alert('Selecione uma categoria.');
      return;
    }
    const next = [...skills];
    next[categoryIndex] = {
      ...next[categoryIndex],
      skills: [...next[categoryIndex].skills, trimmed]
    };
    skills = next;
    PortfolioStore.setSkills(next);
    draw();
  }

  function handleRemoveSkill(categoryIndex, skillIndex) {
    const next = [...skills];
    next[categoryIndex] = {
      ...next[categoryIndex],
      skills: next[categoryIndex].skills.filter((_, i) => i !== skillIndex)
    };
    skills = next;
    PortfolioStore.setSkills(next);
    draw();
  }

  function previewHtml() {
    const list = linesToArray(draft.skillsText);
    return `
      <div class="preview-box">
        <div class="skill-card" style="margin:0;">
          <div class="skill-icon">${Icons[draft.icon]('icon-24')}</div>
          <h3>${escAdmin(draft.title) || 'Categoria'}</h3>
          <ul>${list.map((s) => `<li><div class="skill-dot"></div>${escAdmin(s)}</li>`).join('')}</ul>
        </div>
      </div>`;
  }

  function drawEditor() {
    const options = SKILLS_ICON_OPTIONS.map(
      (icon) => `<option value="${icon}" ${draft.icon === icon ? 'selected' : ''}>${icon}</option>`
    ).join('');

    container.innerHTML = `
      <section>
        <div class="admin-section-header">
          <div class="admin-section-header-left">
            <button type="button" class="btn-icon-square" data-back aria-label="Voltar">${Icons.arrowLeft('icon-16')}</button>
            <h2>${isNew ? 'Nova categoria de habilidade' : 'Editar categoria'}</h2>
          </div>
          <button type="button" class="btn-admin-primary" data-save>${Icons.save('icon-16')} Salvar</button>
        </div>

        <div class="admin-two-col">
          <div class="admin-form-card">
            <div class="admin-form-field">
              <label>Título da categoria</label>
              <input type="text" data-field="title" value="${escAdmin(draft.title)}" />
            </div>
            <div class="admin-form-field">
              <label>Ícone</label>
              <select data-field="icon">${options}</select>
            </div>
            <div class="admin-form-field">
              <label>Habilidades (uma por linha)</label>
              <textarea rows="5" data-field="skillsText">${escAdmin(draft.skillsText)}</textarea>
            </div>
          </div>

          <div class="admin-preview-col">
            <div class="admin-preview-heading">${Icons.eye('icon-20')}<h3>Pré-visualização</h3></div>
            <p class="admin-preview-desc">Veja como esta categoria ficará para os visitantes.</p>
            <div data-preview-slot>${previewHtml()}</div>
          </div>
        </div>
      </section>`;

    container.querySelector('[data-back]').addEventListener('click', closeEditor);
    container.querySelector('[data-save]').addEventListener('click', handleSave);
    container.querySelectorAll('[data-field]').forEach((el) => {
      const eventName = el.tagName === 'SELECT' ? 'change' : 'input';
      el.addEventListener(eventName, () => {
        draft[el.dataset.field] = el.value;
        container.querySelector('[data-preview-slot]').innerHTML = previewHtml();
      });
    });
  }

  function drawList() {
    const totalSkills = skills.reduce((sum, cat) => sum + cat.skills.length, 0);
    const totalCategories = skills.length;

    const categoryOptions = skills
      .map((cat, i) => `<option value="${i}" ${newSkillCategory === i ? 'selected' : ''}>${escAdmin(cat.title)}</option>`)
      .join('');

    const cardsHtml = skills.length === 0
      ? `<div class="admin-empty">Nenhuma categoria de habilidade cadastrada.</div>`
      : `<div class="skills-cards-grid">
          ${skills.map((cat, index) => `
            <div class="skills-category-card">
              <div class="skills-category-header">
                <div class="skills-category-header-left">
                  <div class="skills-category-icon">${Icons[cat.icon]('icon-20')}</div>
                  <h3>${escAdmin(cat.title)}</h3>
                </div>
                <div class="skills-category-header-right">
                  <span class="skills-category-count">${cat.skills.length} ${cat.skills.length === 1 ? 'ITEM' : 'ITENS'}</span>
                  <button type="button" class="btn-icon-square" data-edit-cat="${index}" aria-label="Editar categoria">${Icons.pencil('icon-16')}</button>
                  <button type="button" class="btn-icon-square danger" data-delete-cat="${index}" aria-label="Excluir categoria">${Icons.trash2('icon-16')}</button>
                </div>
              </div>
              <div class="skills-tag-list">
                ${cat.skills.map((s, si) => `
                  <span class="skill-pill-removable">
                    ${escAdmin(s)}
                    <button type="button" data-remove-skill="${index}:${si}" aria-label="Remover ${escAdmin(s)}">${Icons.x('icon-16')}</button>
                  </span>`).join('')}
              </div>
            </div>`).join('')}
        </div>`;

    container.innerHTML = `
      <section>
        <div class="admin-section-header">
          <div class="admin-section-header-left">
            <h2>Habilidades</h2>
          </div>
        </div>
        <p class="skills-intro">Gerencie o seu ecossistema técnico. Adicione, categorize e refine as tecnologias que compõem o seu perfil profissional.</p>

        <div class="admin-form-card skills-add-card">
          <label class="skills-add-label">Nova Habilidade</label>
          <div class="skills-add-row">
            <input type="text" class="admin-input" data-new-skill-name placeholder="Nome da Habilidade (ex: React, Figma)" />
            <select class="admin-input skills-add-category" data-new-skill-category>${categoryOptions}</select>
            <button type="button" class="btn-admin-primary skills-add-btn" data-add-skill>+ Adicionar</button>
          </div>
          <button type="button" class="skills-new-category-link" data-new-category>+ Nova categoria</button>
        </div>

        ${cardsHtml}

        <div class="skills-footer">
          <div class="skills-footer-stats">
            <div class="skills-stat">
              <div class="skills-stat-number">${totalSkills}</div>
              <div class="skills-stat-label">Total de Habilidades</div>
            </div>
            <div class="skills-stat">
              <div class="skills-stat-number">${totalCategories}</div>
              <div class="skills-stat-label">Domínios Técnicos</div>
            </div>
          </div>
          <div class="skills-footer-updated">
            ${Icons.history('icon-16')}
            Última atualização: Agora
          </div>
        </div>
      </section>`;

    container.querySelector('[data-new-category]').addEventListener('click', openNew);
    container.querySelectorAll('[data-edit-cat]').forEach((btn) => {
      btn.addEventListener('click', () => openEdit(Number(btn.dataset.editCat)));
    });
    container.querySelectorAll('[data-delete-cat]').forEach((btn) => {
      btn.addEventListener('click', () => handleDeleteCategory(Number(btn.dataset.deleteCat)));
    });
    container.querySelectorAll('[data-remove-skill]').forEach((btn) => {
      btn.addEventListener('click', () => {
        const [catIndex, skillIndex] = btn.dataset.removeSkill.split(':').map(Number);
        handleRemoveSkill(catIndex, skillIndex);
      });
    });

    const categorySelect = container.querySelector('[data-new-skill-category]');
    if (categorySelect) {
      categorySelect.addEventListener('change', () => {
        newSkillCategory = Number(categorySelect.value);
      });
    }

    const nameInput = container.querySelector('[data-new-skill-name]');
    container.querySelector('[data-add-skill]').addEventListener('click', () => {
      const categoryIndex = categorySelect ? Number(categorySelect.value) : null;
      handleAddSkill(nameInput.value, categoryIndex);
    });
    nameInput.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') {
        e.preventDefault();
        const categoryIndex = categorySelect ? Number(categorySelect.value) : null;
        handleAddSkill(nameInput.value, categoryIndex);
      }
    });
  }

  function draw() {
    if (draft) drawEditor();
    else drawList();
  }

  draw();
}
