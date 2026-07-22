// Aba "Perfil" do painel administrativo — equivalente a ProfileTab.tsx.

function renderProfileTab(container) {
  let profile = PortfolioStore.getProfile();

  function draw() {
    const titleLines = profile.title.split('\n');
    const mainTitle = titleLines[0] ?? '';
    const highlight = titleLines.slice(1).join('\n');

    const swatches = PROFILE_ACCENT_COLORS.map(
      (color) => `
      <button type="button" class="color-swatch ${profile.accentColor === color ? 'active' : ''}" data-color="${color}" style="background-color:${color}">
        ${profile.accentColor === color ? '✓' : ''}
      </button>`
    ).join('');

    const previewTitle = titleLines
      .map((line, i) =>
        i === titleLines.length - 1
          ? `<span style="color:${escAdmin(profile.accentColor)}">${escAdmin(line)}</span>`
          : `<span>${escAdmin(line)}<br /></span>`
      )
      .join('');

    container.innerHTML = `
      <section>
        <div class="admin-section-header">
          <h2>Perfil</h2>
          <button type="button" class="btn-admin-primary" data-save-profile>
            ${Icons.save('icon-16')}
            Salvar
          </button>
        </div>

        <div class="admin-two-col">
          <div class="admin-form-card">
            <div class="admin-form-card-title">
              ${Icons.user('icon-20')}
              <h3>Perfil</h3>
            </div>
            <p class="admin-form-card-desc">Edite as informações que serão exibidas no seu perfil.</p>

            <div class="admin-form-field">
              <label>${Icons.user('icon-16')} Nome</label>
              <input type="text" data-field="name" value="${escAdmin(profile.name)}" />
            </div>

            <div class="admin-form-field">
              <label>${Icons.type('icon-16')} Título principal <span class="hint">Ex: Desenvolvedor Full Stack</span></label>
              <input type="text" data-field="mainTitle" value="${escAdmin(mainTitle)}" />
            </div>

            <div class="admin-form-field">
              <label>${Icons.star('icon-16')} Destaque / Frase de impacto <span class="hint">Ex: Criando soluções digitais</span></label>
              <input type="text" data-field="highlight" value="${escAdmin(highlight)}" />
            </div>

            <div class="admin-form-field">
              <label>${Icons.list('icon-16')} Descrição <span class="hint">Fale um pouco sobre você e seu trabalho</span></label>
              <textarea rows="3" data-field="subtitle">${escAdmin(profile.subtitle)}</textarea>
            </div>

            <div class="admin-form-field">
              <label>${Icons.droplet('icon-16')} Cor do destaque <span class="hint">Escolha a cor da frase de destaque</span></label>
              <div class="color-swatches" data-color-swatches>${swatches}</div>
            </div>

            <div class="admin-form-field">
              <label>${Icons.github('icon-16')} GitHub URL</label>
              <input type="text" data-field="githubUrl" placeholder="https://github.com/seuusuario" value="${escAdmin(profile.githubUrl)}" />
            </div>

            <div class="admin-form-field">
              <label>${Icons.linkedin('icon-16')} LinkedIn URL</label>
              <input type="text" data-field="linkedinUrl" value="${escAdmin(profile.linkedinUrl)}" />
            </div>

            <div class="admin-form-field">
              <label>${Icons.mail('icon-16')} E-mail</label>
              <input type="email" data-field="email" value="${escAdmin(profile.email)}" />
            </div>

            <div class="admin-form-field">
              <label>Localização</label>
              <input type="text" data-field="location" value="${escAdmin(profile.location)}" />
            </div>

            <div class="field-row-between">
              <label>Disponível para projetos</label>
              <button type="button" class="switch-toggle ${profile.available ? 'on' : ''}" data-toggle-available aria-pressed="${profile.available}">
                <span class="knob"></span>
              </button>
            </div>

            <div>
              <label>Stats</label>
              <div class="stats-grid-admin">
                <input type="text" class="compact-input" data-stat="0-number" value="${escAdmin(profile.stats[0].number)}" placeholder="5+" />
                <input type="text" class="compact-input" data-stat="1-number" value="${escAdmin(profile.stats[1].number)}" placeholder="50+" />
                <input type="text" class="compact-input" data-stat="2-number" value="${escAdmin(profile.stats[2].number)}" placeholder="20+" />
                <input type="text" class="compact-input" data-stat="0-label" value="${escAdmin(profile.stats[0].label)}" placeholder="Anos de experiência" />
                <input type="text" class="compact-input" data-stat="1-label" value="${escAdmin(profile.stats[1].label)}" placeholder="Projetos concluídos" />
                <input type="text" class="compact-input" data-stat="2-label" value="${escAdmin(profile.stats[2].label)}" placeholder="Clientes satisfeitos" />
              </div>
            </div>
          </div>

          <div class="admin-preview-col">
            <div class="admin-preview-heading">
              ${Icons.eye('icon-20')}
              <h3>Pré-visualização</h3>
            </div>
            <p class="admin-preview-desc">Veja como seu perfil ficará para os visitantes.</p>

            <div class="preview-box">
              <h1 style="font-family:var(--font-heading);font-size:1.75rem;font-weight:var(--font-weight-bold);line-height:1.15;color:var(--foreground);letter-spacing:-0.02em;margin-bottom:1rem;word-break:break-word;">
                ${previewTitle}
              </h1>
              <p style="font-size:1rem;line-height:1.7;color:var(--neutral-600);margin-bottom:1.5rem;">
                ${escAdmin(profile.subtitle)}
              </p>
              <div class="flex flex-wrap items-center gap-3">
                <a href="${escAdmin(profile.githubUrl) || '#'}" class="inline-flex items-center gap-2" style="padding:0.625rem 1.25rem;border-radius:0.5rem;font-size:0.875rem;background-color:${escAdmin(profile.accentColor)};color:white;font-weight:var(--font-weight-medium);">
                  ${Icons.github('icon-16')} Ver no GitHub ${Icons.arrowRight('icon-16')}
                </a>
                ${profile.linkedinUrl ? `<a href="${escAdmin(profile.linkedinUrl)}" class="flex items-center justify-center" style="width:2.5rem;height:2.5rem;border-radius:9999px;border:1px solid var(--border);color:var(--foreground);">${Icons.linkedin('icon-16')}</a>` : ''}
                ${profile.email ? `<a href="mailto:${escAdmin(profile.email)}" class="flex items-center justify-center" style="width:2.5rem;height:2.5rem;border-radius:9999px;border:1px solid var(--border);color:var(--foreground);">${Icons.mail('icon-16')}</a>` : ''}
              </div>
            </div>
          </div>
        </div>
      </section>`;

    attachEvents();
  }

  function attachEvents() {
    container.querySelectorAll('[data-field]').forEach((el) => {
      el.addEventListener('input', () => {
        const field = el.dataset.field;
        if (field === 'mainTitle') {
          const rest = profile.title.split('\n').slice(1).join('\n');
          profile.title = rest ? `${el.value}\n${rest}` : el.value;
        } else if (field === 'highlight') {
          const first = profile.title.split('\n')[0] ?? '';
          profile.title = `${first}\n${el.value}`;
        } else {
          profile[field] = el.value;
        }
        // Atualiza apenas a pré-visualização sem perder o foco do campo
        updatePreviewOnly();
      });
    });

    container.querySelectorAll('[data-color]').forEach((btn) => {
      btn.addEventListener('click', () => {
        profile.accentColor = btn.dataset.color;
        draw();
      });
    });

    const availableToggle = container.querySelector('[data-toggle-available]');
    if (availableToggle) {
      availableToggle.addEventListener('click', () => {
        profile.available = !profile.available;
        draw();
      });
    }

    container.querySelectorAll('[data-stat]').forEach((el) => {
      el.addEventListener('input', () => {
        const [index, field] = el.dataset.stat.split('-');
        profile.stats[Number(index)][field] = el.value;
      });
    });

    container.querySelector('[data-save-profile]').addEventListener('click', () => {
      if (!profile.name.trim()) {
        alert('Informe o nome.');
        return;
      }
      PortfolioStore.setProfile(profile);
      alert('Perfil salvo com sucesso.');
    });
  }

  function updatePreviewOnly() {
    const titleLines = profile.title.split('\n');
    const previewTitle = titleLines
      .map((line, i) =>
        i === titleLines.length - 1
          ? `<span style="color:${escAdmin(profile.accentColor)}">${escAdmin(line)}</span>`
          : `<span>${escAdmin(line)}<br /></span>`
      )
      .join('');
    const titleEl = container.querySelector('.preview-box h1');
    const subtitleEl = container.querySelector('.preview-box p');
    if (titleEl) titleEl.innerHTML = previewTitle;
    if (subtitleEl) subtitleEl.textContent = profile.subtitle;
  }

  draw();
}
