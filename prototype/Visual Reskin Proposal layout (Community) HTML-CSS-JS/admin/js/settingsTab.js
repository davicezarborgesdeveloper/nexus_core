// Aba "Configurações" do painel administrativo — preferências e integrações são simuladas.

const MOCK_API_KEY = 'pk_live_51M0curador782Xz909kLp';

function renderSettingsTab(container) {
  let displayMode = 'light';

  function draw() {
    container.innerHTML = `
      <section class="settings-tab">
        <h2 class="security-title">Configurações</h2>
        <p class="security-subtitle">Gerencie as preferências visuais e conexões externas do seu ecossistema digital.</p>

        <div class="settings-section-row">
          <div class="settings-section-intro">
            <h3>Preferências</h3>
            <p>Personalize a interface do painel para melhor se adaptar ao seu fluxo de trabalho editorial.</p>
          </div>

          <div class="settings-pref-grid">
            <div class="admin-form-card">
              ${Icons.globe('icon-24')}
              <h3>Idioma do Sistema</h3>
              <select class="admin-input" data-language>
                <option>Português (Brasil)</option>
                <option>English (US)</option>
                <option>Español</option>
              </select>
            </div>

            <div class="admin-form-card">
              ${Icons.moon('icon-24')}
              <h3>Modo de Exibição</h3>
              <div class="settings-mode-toggle">
                <button type="button" class="settings-mode-btn ${displayMode === 'light' ? 'active' : ''}" data-mode="light">Claro</button>
                <button type="button" class="settings-mode-btn ${displayMode === 'dark' ? 'active' : ''}" data-mode="dark">Escuro</button>
              </div>
            </div>
          </div>
        </div>

        <div class="settings-section-row">
          <div class="settings-section-intro">
            <h3>Integrações</h3>
            <p>Conecte seus canais sociais e configure chaves de API para automatizar sua presença digital.</p>
          </div>

          <div class="admin-form-card settings-integrations-card">
            <div class="settings-integration-item">
              <div class="settings-integration-icon">${Icons.link2('icon-20')}</div>
              <div class="settings-integration-info">
                <div class="settings-integration-title">Behance Portfolio</div>
                <div class="settings-integration-url">behance.net/ocurador</div>
              </div>
              <span class="security-badge success">CONECTADO</span>
            </div>

            <div class="settings-api-field">
              <label>Chave de API (Geral)</label>
              <div class="settings-api-row">
                <input type="text" class="admin-input" data-api-key readonly value="${escAdmin(MOCK_API_KEY)}" />
                <button type="button" class="btn-security-report" data-copy-key>Copiar</button>
              </div>
              <p class="settings-api-hint">Nunca compartilhe suas chaves secretas em ambientes públicos.</p>
            </div>
          </div>
        </div>

        <div class="settings-danger-zone">
          <div>
            <h3>Zona Crítica</h3>
            <p>A exclusão da conta é permanente e removerá todos os seus projetos e histórico do sistema.</p>
          </div>
          <button type="button" class="btn-danger-delete" data-delete-account>
            ${Icons.trash2('icon-16')}
            Excluir Conta
          </button>
        </div>
      </section>`;

    attachEvents();
  }

  function attachEvents() {
    container.querySelectorAll('[data-mode]').forEach((btn) => {
      btn.addEventListener('click', () => {
        displayMode = btn.dataset.mode;
        draw();
      });
    });

    container.querySelector('[data-copy-key]').addEventListener('click', () => {
      const input = container.querySelector('[data-api-key]');
      input.select();
      navigator.clipboard?.writeText(input.value).catch(() => {});
      alert('Chave copiada para a área de transferência.');
    });

    container.querySelector('[data-delete-account]').addEventListener('click', () => {
      const confirmed = confirm('Tem certeza que deseja excluir sua conta? Esta ação é irreversível.');
      if (!confirmed) return;
      PortfolioStore.resetAll();
      PortfolioStore.logout();
      renderAdminLogin();
    });
  }

  draw();
}
