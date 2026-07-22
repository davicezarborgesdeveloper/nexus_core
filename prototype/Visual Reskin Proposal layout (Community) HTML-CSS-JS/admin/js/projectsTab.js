// Aba "Projetos" do painel administrativo — equivalente a ProjectsTab.tsx.

function renderProjectsTab(container) {
  let projects = PortfolioStore.getProjects();
  let editingIndex = null;
  let isNew = false;
  let draft = null;

  function toDraft(p) {
    return {
      title: p.title,
      description: p.description,
      image: p.image,
      githubUrl: p.githubUrl,
      liveUrl: p.liveUrl,
      tagsText: p.tags.join('\n'),
      category: p.category || '',
      status: p.status || 'draft'
    };
  }

  function openNew() {
    isNew = true;
    editingIndex = null;
    draft = { title: '', description: '', image: '', githubUrl: '', liveUrl: '', tagsText: '', category: '', status: 'draft' };
    draw();
  }

  function openEdit(index) {
    isNew = false;
    editingIndex = index;
    draft = toDraft(projects[index]);
    draw();
  }

  function closeEditor() {
    draft = null;
    editingIndex = null;
    draw();
  }

  function handleSave() {
    if (!draft.title.trim()) {
      alert('Informe o título do projeto.');
      return;
    }
    const updated = {
      title: draft.title.trim(),
      description: draft.description.trim(),
      image: draft.image.trim(),
      githubUrl: draft.githubUrl.trim(),
      liveUrl: draft.liveUrl.trim(),
      tags: linesToArray(draft.tagsText),
      category: draft.category.trim(),
      status: draft.status
    };
    const next = [...projects];
    if (isNew) next.unshift(updated);
    else if (editingIndex !== null) next[editingIndex] = updated;
    projects = next;
    PortfolioStore.setProjects(next);
    closeEditor();
  }

  function handleDelete(index) {
    if (!confirm('Excluir este projeto?')) return;
    projects = projects.filter((_, i) => i !== index);
    PortfolioStore.setProjects(projects);
    draw();
  }

  function drawEditor() {
    const tags = linesToArray(draft.tagsText);
    const tagsHtml = tags.map((t) => `<span class="pill">${escAdmin(t)}</span>`).join('');

    container.innerHTML = `
      <section>
        <div class="admin-section-header">
          <div class="admin-section-header-left">
            <button type="button" class="btn-icon-square" data-back aria-label="Voltar">${Icons.arrowLeft('icon-16')}</button>
            <h2>${isNew ? 'Novo projeto' : 'Editar projeto'}</h2>
          </div>
          <button type="button" class="btn-admin-primary" data-save>${Icons.save('icon-16')} Salvar</button>
        </div>

        <div class="admin-two-col">
          <div class="admin-form-card">
            <div class="admin-form-field">
              <label>Título</label>
              <input type="text" data-field="title" value="${escAdmin(draft.title)}" />
            </div>
            <div class="admin-form-field">
              <label>Descrição</label>
              <textarea rows="3" data-field="description">${escAdmin(draft.description)}</textarea>
            </div>
            <div class="admin-form-field">
              <label>Categoria <span class="hint">Ex: Dashboard, E-commerce, App Nativo</span></label>
              <input type="text" data-field="category" value="${escAdmin(draft.category)}" />
            </div>
            <div class="admin-form-field">
              <label>Status</label>
              <div class="field-row-between">
                <label>Publicado</label>
                <button type="button" class="switch-toggle ${draft.status === 'published' ? 'on' : ''}" data-toggle-status aria-pressed="${draft.status === 'published'}">
                  <span class="knob"></span>
                </button>
              </div>
            </div>
            <div class="admin-form-field">
              <label>URL da imagem</label>
              <input type="text" data-field="image" value="${escAdmin(draft.image)}" />
            </div>
            <div class="admin-form-field">
              <label>URL do GitHub</label>
              <input type="text" data-field="githubUrl" value="${escAdmin(draft.githubUrl)}" />
            </div>
            <div class="admin-form-field">
              <label>URL do projeto ao vivo</label>
              <input type="text" data-field="liveUrl" value="${escAdmin(draft.liveUrl)}" />
            </div>
            <div class="admin-form-field">
              <label>Tags/tecnologias (uma por linha)</label>
              <textarea rows="3" data-field="tagsText">${escAdmin(draft.tagsText)}</textarea>
            </div>
          </div>

          <div class="admin-preview-col">
            <div class="admin-preview-heading">${Icons.eye('icon-20')}<h3>Pré-visualização</h3></div>
            <p class="admin-preview-desc">Veja como este projeto ficará para os visitantes.</p>

            <div class="project-card" style="box-shadow:0 1px 3px 0 rgba(0,0,0,0.1);">
              <div class="project-image-wrap" style="height:12rem;">
                ${draft.image
                  ? `<img src="${escAdmin(draft.image)}" alt="${escAdmin(draft.title)}" />`
                  : `<div class="flex items-center justify-center" style="width:100%;height:100%;color:var(--neutral-500);font-size:0.875rem;">Sem imagem</div>`}
                <div class="project-links" style="opacity:1;">
                  ${draft.githubUrl ? `<span style="padding:0.5rem;border-radius:0.5rem;background-color:#fff;color:var(--foreground);">${Icons.github('icon-16')}</span>` : ''}
                  ${draft.liveUrl ? `<span style="padding:0.5rem;border-radius:0.5rem;background-color:#fff;color:var(--foreground);">${Icons.externalLink('icon-16')}</span>` : ''}
                </div>
              </div>
              <div class="project-body">
                <h3>${escAdmin(draft.title) || 'Título do projeto'}</h3>
                ${draft.description ? `<p>${escAdmin(draft.description)}</p>` : ''}
                ${tags.length ? `<div class="tag-pills">${tagsHtml}</div>` : ''}
              </div>
            </div>
          </div>
        </div>
      </section>`;

    container.querySelector('[data-back]').addEventListener('click', closeEditor);
    container.querySelector('[data-save]').addEventListener('click', handleSave);
    container.querySelectorAll('[data-field]').forEach((el) => {
      el.addEventListener('input', () => {
        draft[el.dataset.field] = el.value;
        drawEditorPreviewOnly();
      });
    });
    const statusToggle = container.querySelector('[data-toggle-status]');
    if (statusToggle) {
      statusToggle.addEventListener('click', () => {
        draft.status = draft.status === 'published' ? 'draft' : 'published';
        drawEditor();
      });
    }
  }

  function drawEditorPreviewOnly() {
    const tags = linesToArray(draft.tagsText);
    const card = container.querySelector('.project-card');
    if (!card) return;
    const imgWrap = card.querySelector('.project-image-wrap');
    imgWrap.innerHTML = `
      ${draft.image
        ? `<img src="${escAdmin(draft.image)}" alt="${escAdmin(draft.title)}" />`
        : `<div class="flex items-center justify-center" style="width:100%;height:100%;color:var(--neutral-500);font-size:0.875rem;">Sem imagem</div>`}
      <div class="project-links" style="opacity:1;">
        ${draft.githubUrl ? `<span style="padding:0.5rem;border-radius:0.5rem;background-color:#fff;color:var(--foreground);">${Icons.github('icon-16')}</span>` : ''}
        ${draft.liveUrl ? `<span style="padding:0.5rem;border-radius:0.5rem;background-color:#fff;color:var(--foreground);">${Icons.externalLink('icon-16')}</span>` : ''}
      </div>`;
    const body = card.querySelector('.project-body');
    body.innerHTML = `
      <h3>${escAdmin(draft.title) || 'Título do projeto'}</h3>
      ${draft.description ? `<p>${escAdmin(draft.description)}</p>` : ''}
      ${tags.length ? `<div class="tag-pills">${tags.map((t) => `<span class="pill">${escAdmin(t)}</span>`).join('')}</div>` : ''}`;
  }

  function drawList() {
    const rowsHtml = projects.map((p, index) => `
      <div class="projects-table-row">
        <div class="projects-table-cell projects-table-info">
          <div class="projects-table-thumb">
            ${p.image ? `<img src="${escAdmin(p.image)}" alt="${escAdmin(p.title)}" />` : ''}
          </div>
          <div class="projects-table-info-text">
            <h3>${escAdmin(p.title)}</h3>
            <p>${escAdmin(p.description)}</p>
          </div>
        </div>
        <div class="projects-table-cell">
          ${p.category ? `<span class="projects-category-pill">${escAdmin(p.category)}</span>` : ''}
        </div>
        <div class="projects-table-cell">
          <span class="projects-status ${p.status === 'published' ? 'published' : 'draft'}">
            <span class="projects-status-dot"></span>
            ${p.status === 'published' ? 'Publicado' : 'Rascunho'}
          </span>
        </div>
        <div class="projects-table-cell projects-table-actions">
          <button type="button" class="btn-icon-square" data-edit="${index}" aria-label="Editar">${Icons.pencil('icon-16')}</button>
          <button type="button" class="btn-icon-square danger" data-delete="${index}" aria-label="Excluir">${Icons.trash2('icon-16')}</button>
        </div>
      </div>`).join('');

    const tableHtml = projects.length === 0
      ? ''
      : `<div class="projects-table">
          <div class="projects-table-header">
            <div>Informações do Projeto</div>
            <div>Categoria</div>
            <div>Status</div>
            <div>Ações</div>
          </div>
          ${rowsHtml}
        </div>`;

    const emptyStateHtml = `
      <div class="projects-empty-state">
        ${Icons.sparkles('icon-24')}
        <p>Fim da lista editorial. Use o botão acima para curar novos trabalhos.</p>
      </div>`;

    container.innerHTML = `
      <section>
        <div class="admin-section-header">
          <div class="admin-section-header-left">
            <div>
              <div class="projects-eyebrow">Administração</div>
              <h2>Projetos</h2>
            </div>
          </div>
          <button type="button" class="btn-admin-primary" data-new>${Icons.folder('icon-16')} Adicionar Novo Projeto</button>
        </div>
        ${projects.length === 0 ? `<div class="admin-empty">Nenhum projeto cadastrado.</div>` : tableHtml}
        ${emptyStateHtml}
      </section>`;

    container.querySelector('[data-new]').addEventListener('click', openNew);
    container.querySelectorAll('[data-edit]').forEach((btn) => {
      btn.addEventListener('click', () => openEdit(Number(btn.dataset.edit)));
    });
    container.querySelectorAll('[data-delete]').forEach((btn) => {
      btn.addEventListener('click', () => handleDelete(Number(btn.dataset.delete)));
    });
  }

  function draw() {
    if (draft) drawEditor();
    else drawList();
  }

  draw();
}
