// Shell do painel administrativo: login + dashboard com abas.
// Equivalente a AdminApp.tsx + AdminLogin.tsx + AdminDashboard.tsx.

const ADMIN_TABS = [
  { id: 'profile', label: 'Perfil', icon: 'user' },
  { id: 'experiences', label: 'Experiências', icon: 'briefcase' },
  { id: 'projects', label: 'Projetos', icon: 'folder' },
  { id: 'skills', label: 'Habilidades', icon: 'zap' },
  { id: 'settings', label: 'Configurações', icon: 'settings' },
  { id: 'security', label: 'Segurança', icon: 'shield' }
];

let currentTab = 'profile';

function renderAdminLogin() {
  const root = document.getElementById('root');
  root.innerHTML = `
    <div class="admin-login-page">
      <div class="admin-login-body">
        <div class="admin-login-icon">${Icons.lock('icon-24')}</div>
        <h1>Área Administrativa</h1>
        <p class="admin-login-subtitle">Faça login para acessar o painel</p>

        <form class="admin-login-form" data-login-form>
          <div class="admin-field">
            <label for="loginUser">Usuário</label>
            <input id="loginUser" type="text" placeholder="Digite seu usuário" autocomplete="username" required />
          </div>

          <div class="admin-field">
            <label for="loginPass">Senha</label>
            <div class="admin-field-pass-wrap">
              <input id="loginPass" type="password" placeholder="Digite sua senha" autocomplete="current-password" required />
              <button type="button" class="toggle-pass" data-toggle-pass aria-label="Mostrar senha">
                ${Icons.eye('icon-16')}
              </button>
            </div>
          </div>

          <p class="admin-login-error" data-login-error hidden>Usuário ou senha inválidos.</p>

          <button type="submit" class="btn-login-submit">Entrar</button>
        </form>

        <a href="../index.html" class="back-link">
          ${Icons.arrowLeft('icon-16')}
          Voltar ao portfólio
        </a>
      </div>
    </div>`;

  const form = root.querySelector('[data-login-form]');
  const toggleBtn = root.querySelector('[data-toggle-pass]');
  const passInput = root.querySelector('#loginPass');
  const errorEl = root.querySelector('[data-login-error]');
  let showPass = false;

  toggleBtn.addEventListener('click', () => {
    showPass = !showPass;
    passInput.type = showPass ? 'text' : 'password';
    toggleBtn.innerHTML = showPass ? Icons.eyeOff('icon-16') : Icons.eye('icon-16');
    toggleBtn.setAttribute('aria-label', showPass ? 'Ocultar senha' : 'Mostrar senha');
  });

  form.addEventListener('submit', (e) => {
    e.preventDefault();
    const user = root.querySelector('#loginUser').value.trim();
    const pass = passInput.value;
    if (PortfolioStore.login(user, pass)) {
      errorEl.hidden = true;
      renderAdminDashboard();
    } else {
      errorEl.hidden = false;
    }
  });
}

function renderAdminDashboard() {
  const root = document.getElementById('root');

  const navButtons = ADMIN_TABS.map(
    (t) => `
    <button type="button" data-tab="${t.id}" class="${t.id === currentTab ? 'active' : ''}">
      ${Icons[t.icon]('icon-16')}
      ${t.label}
    </button>`
  ).join('');

  root.innerHTML = `
    <div class="admin-dashboard dark-theme">
      <header class="admin-header">
        <div class="admin-header-inner">
          <div class="admin-brand">${Icons.sparkles('icon-20')} Dashboard Editorial</div>
          <div class="admin-header-search">
            ${Icons.search('icon-16')}
            <input type="text" placeholder="Buscar experiência..." data-header-search />
          </div>
          <div class="admin-header-actions">
            <button type="button" class="admin-header-icon-btn" aria-label="Notificações">${Icons.bell('icon-16')}</button>
            <button type="button" class="admin-header-icon-btn" aria-label="Ajuda">${Icons.helpCircle('icon-16')}</button>
            <a href="../design-system/storybook.html" target="_blank" rel="noopener noreferrer" class="btn-view-portfolio is-secondary" aria-label="Storybook">
              ${Icons.palette('icon-16')}
              <span>Storybook</span>
            </a>
            <a href="../index.html" target="_blank" rel="noopener noreferrer" class="btn-view-portfolio">
              ${Icons.externalLink('icon-16')}
              Ver portfólio
            </a>
            <button type="button" class="btn-logout" data-logout>
              ${Icons.logOut('icon-16')}
              Sair
            </button>
          </div>
        </div>
      </header>

      <div class="admin-body">
        <nav class="admin-nav">${navButtons}</nav>
        <main data-tab-content></main>
      </div>
    </div>`;

  root.querySelector('[data-logout]').addEventListener('click', () => {
    PortfolioStore.logout();
    renderAdminLogin();
  });

  root.querySelectorAll('[data-tab]').forEach((btn) => {
    btn.addEventListener('click', () => {
      currentTab = btn.dataset.tab;
      root.querySelectorAll('[data-tab]').forEach((b) => b.classList.toggle('active', b === btn));
      renderCurrentTab();
    });
  });

  renderCurrentTab();
}

function renderCurrentTab() {
  const container = document.querySelector('[data-tab-content]');
  if (!container) return;

  if (currentTab === 'profile') renderProfileTab(container);
  else if (currentTab === 'projects') renderProjectsTab(container);
  else if (currentTab === 'experiences') renderExperiencesTab(container);
  else if (currentTab === 'skills') renderSkillsTab(container);
  else if (currentTab === 'settings') renderSettingsTab(container);
  else if (currentTab === 'security') renderSecurityTab(container);
}

function bootAdmin() {
  if (PortfolioStore.isLoggedIn()) {
    renderAdminDashboard();
  } else {
    renderAdminLogin();
  }
}

document.addEventListener('DOMContentLoaded', bootAdmin);
