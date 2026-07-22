// Aba "Segurança" do painel administrativo — dados de sessões/atividade são mockados.

const MOCK_ACTIVE_SESSIONS = [
  { device: 'MacBook Pro 14"', icon: 'monitorSession', location: 'São Paulo, BR', status: 'ATUAL' },
  { device: 'iPhone 15 Pro', icon: 'smartphoneSession', location: 'Rio de Janeiro, BR', status: '2H ATRÁS' }
];

const MOCK_ACCESS_LOG = [
  { date: '24 Mai, 14:32', device: 'Chrome (Windows)', icon: 'download', location: 'Curitiba, PR', status: 'success' },
  { date: '23 Mai, 09:15', device: 'App Mobile (iOS)', icon: 'smartphoneSession', location: 'São Paulo, SP', status: 'success' },
  { date: '21 Mai, 23:45', device: 'Desconhecido', icon: 'globe', location: 'Kyiv, UA', status: 'blocked' }
];

function renderSecurityTab(container) {
  let twoFactorEnabled = false;

  function draw() {
    const sessionsHtml = MOCK_ACTIVE_SESSIONS.map(
      (s) => `
      <div class="security-session-item">
        <div class="security-session-icon">${Icons[s.icon]('icon-20')}</div>
        <div>
          <div class="security-session-device">${escAdmin(s.device)}</div>
          <div class="security-session-meta">${escAdmin(s.location)} • ${escAdmin(s.status)}</div>
        </div>
      </div>`
    ).join('');

    const logRowsHtml = MOCK_ACCESS_LOG.map(
      (row) => `
      <tr>
        <td>${escAdmin(row.date)}</td>
        <td class="security-log-device">${Icons[row.icon]('icon-16')} ${escAdmin(row.device)}</td>
        <td>${escAdmin(row.location)}</td>
        <td><span class="security-badge ${row.status === 'success' ? 'success' : 'blocked'}">${row.status === 'success' ? 'SUCESSO' : 'BLOQUEADO'}</span></td>
      </tr>`
    ).join('');

    container.innerHTML = `
      <section class="security-tab">
        <h2 class="security-title">Segurança da Conta</h2>
        <p class="security-subtitle">Gerencie suas credenciais de acesso, monitore atividades recentes e configure camadas adicionais de proteção para sua curadoria digital.</p>

        <div class="security-top-grid">
          <div class="admin-form-card">
            <div class="admin-form-card-title">
              ${Icons.lock('icon-20')}
              <h3>Alterar Senha</h3>
            </div>

            <div class="admin-form-field">
              <label>Senha atual</label>
              <input type="password" data-field="currentPassword" placeholder="Digite sua senha atual" />
            </div>

            <div class="security-pass-row">
              <div class="admin-form-field">
                <label>Nova senha</label>
                <input type="password" data-field="newPassword" placeholder="Digite a nova senha" />
              </div>
              <div class="admin-form-field">
                <label>Confirmar nova senha</label>
                <input type="password" data-field="confirmPassword" placeholder="Confirme a nova senha" />
              </div>
            </div>

            <button type="button" class="btn-admin-primary" data-update-password>Atualizar Senha</button>
          </div>

          <div class="security-2fa-card">
            <div class="security-2fa-title">
              ${Icons.shield('icon-20')}
              <h3>Autenticação 2FA</h3>
            </div>
            <p>Adicione uma camada extra de proteção. Além da sua senha, solicitaremos um código único enviado ao seu dispositivo para garantir que apenas você tenha acesso.</p>

            <div class="security-2fa-status">
              <div>
                <div class="security-2fa-status-label">Status:</div>
                <div class="security-2fa-status-value">${twoFactorEnabled ? 'Ativado' : 'Desativado'}</div>
              </div>
              <button type="button" class="btn-2fa-toggle" data-toggle-2fa>${twoFactorEnabled ? 'DESATIVAR' : 'ATIVAR AGORA'}</button>
            </div>
          </div>
        </div>

        <div class="security-bottom-grid">
          <div class="admin-form-card">
            <div class="admin-form-card-title security-card-title-row">
              <h3>Sessões Ativas</h3>
              ${Icons.monitorSession('icon-20')}
            </div>
            <div class="security-session-list">${sessionsHtml}</div>
            <button type="button" class="btn-icon-square security-end-sessions" data-end-sessions>Encerrar outras sessões</button>
          </div>

          <div class="admin-form-card">
            <div class="admin-form-card-title security-card-title-row">
              <h3>Atividade de Acesso</h3>
              <span class="security-badge success">SEGURO</span>
            </div>
            <div class="security-log-table-wrap">
              <table class="security-log-table">
                <thead>
                  <tr>
                    <th>Data &amp; Hora</th>
                    <th>Dispositivo</th>
                    <th>Localização</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>${logRowsHtml}</tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="security-audit-banner">
          ${Icons.shield('icon-20')}
          <div class="security-audit-text">
            <strong>Última auditoria de segurança</strong>
            <p>Sua conta foi verificada automaticamente há 12 horas. Nenhum comportamento suspeito foi detectado nos seus arquivos de curadoria.</p>
          </div>
          <button type="button" class="btn-security-report" data-view-report>Relatório completo</button>
        </div>
      </section>`;

    attachEvents();
  }

  function attachEvents() {
    container.querySelector('[data-update-password]').addEventListener('click', () => {
      const newPass = container.querySelector('[data-field="newPassword"]').value;
      const confirmPass = container.querySelector('[data-field="confirmPassword"]').value;
      if (!newPass || newPass !== confirmPass) {
        alert('As senhas não coincidem.');
        return;
      }
      alert('Senha atualizada com sucesso.');
    });

    container.querySelector('[data-toggle-2fa]').addEventListener('click', () => {
      twoFactorEnabled = !twoFactorEnabled;
      draw();
    });

    container.querySelector('[data-end-sessions]').addEventListener('click', () => {
      alert('Outras sessões encerradas.');
    });

    container.querySelector('[data-view-report]').addEventListener('click', () => {
      alert('Relatório completo em breve.');
    });
  }

  draw();
}
