// Monta o site público (Header, Hero, Skills, Experience, Projects, Contact, Footer)
// lendo os dados do PortfolioStore (localStorage), equivalente ao App.tsx + components/*.tsx.

const NAV_LINKS = [
  { href: '#', label: 'Início' },
  { href: '#projetos', label: 'Projetos' },
  { href: '#habilidades', label: 'Habilidades' },
  { href: '#contato', label: 'Contato' }
];

const SKILL_ICON_MAP = { code: 'code', terminal: 'terminal', rocket: 'rocket', zap: 'zap', grid: 'grid', database: 'database', palette: 'palette' };

function esc(str) {
  const div = document.createElement('div');
  div.textContent = str ?? '';
  return div.innerHTML;
}

function renderHeader(profile) {
  const navLinks = NAV_LINKS.map(
    (l) => `<a href="${l.href}">${esc(l.label.toUpperCase())}</a>`
  ).join('');

  const navLinksMobile = NAV_LINKS.map(
    (l) => `<a href="${l.href}" data-close-mobile>${esc(l.label)}</a>`
  ).join('');

  const langMenu = `
    <div class="lang-menu" data-lang-menu>
      <button type="button" data-lang="pt" class="active">🇧🇷 Português<span class="check">✓</span></button>
      <button type="button" data-lang="en">🇺🇸 English</button>
    </div>`;

  return `
  <header class="site-header">
    <div class="container-lg">
      <div class="header-inner">
        <a href="#" class="logo-link"><span>${esc(profile.name)}</span></a>

        <nav class="desktop-nav">${navLinks}</nav>

        <div class="header-actions">
          <div class="lang-switcher">
            <button type="button" class="lang-btn" data-lang-toggle aria-label="Mudar idioma">
              ${Icons.globe('icon-20')}
              <span data-lang-label>pt</span>
            </button>
            ${langMenu}
          </div>

          <div class="social-links">
            <a href="${esc(profile.githubUrl)}" target="_blank" rel="noopener noreferrer" aria-label="GitHub">${Icons.github('icon-20')}</a>
            <a href="${esc(profile.linkedinUrl)}" target="_blank" rel="noopener noreferrer" aria-label="LinkedIn">${Icons.linkedin('icon-20')}</a>
            <a href="mailto:${esc(profile.email)}" aria-label="Email">${Icons.mail('icon-20')}</a>
          </div>

          <a href="#/admin" class="btn-enter">${Icons.lock('icon-16')}<span>Entrar</span></a>
        </div>

        <div class="mobile-header-actions">
          <div class="lang-switcher">
            <button type="button" class="lang-btn" data-lang-toggle aria-label="Mudar idioma">
              ${Icons.globe('icon-20')}
              <span data-lang-label>pt</span>
            </button>
            ${langMenu}
          </div>
          <button type="button" class="mobile-menu-btn" data-mobile-toggle aria-label="Menu">
            ${Icons.menu('icon-24')}
          </button>
        </div>
      </div>

      <div class="mobile-menu" data-mobile-menu>
        <nav class="mobile-nav">${navLinksMobile}</nav>
        <div class="mobile-social">
          <a href="${esc(profile.githubUrl)}" target="_blank" rel="noopener noreferrer" aria-label="GitHub">${Icons.github('icon-20')}</a>
          <a href="${esc(profile.linkedinUrl)}" target="_blank" rel="noopener noreferrer" aria-label="LinkedIn">${Icons.linkedin('icon-20')}</a>
          <a href="mailto:${esc(profile.email)}" aria-label="Email">${Icons.mail('icon-20')}</a>
        </div>
        <a href="#/admin" class="btn-enter" data-close-mobile>${Icons.lock('icon-16')}<span>Entrar</span></a>
      </div>
    </div>
  </header>`;
}

function renderHero(profile) {
  const titleLines = profile.title.split('\n');
  const titleHtml = titleLines
    .map((line, i) =>
      i === titleLines.length - 1
        ? `<span class="accent" style="--hero-accent:${esc(profile.accentColor)}">${esc(line)}</span>`
        : `<span>${esc(line)}<br /></span>`
    )
    .join('');

  const badge = profile.available
    ? `<div class="hero-badge">
        <div class="dot"></div>
        <span>Disponível para novos projetos</span>
      </div>`
    : '';

  const statsHtml = profile.stats
    .map(
      (s) => `
      <div>
        <div class="stat-number">${esc(s.number)}</div>
        <div class="stat-label">${esc(s.label)}</div>
      </div>`
    )
    .join('');

  return `
  <section class="hero">
    <div class="hero-bg">
      <div class="hero-blob-1"></div>
      <div class="hero-blob-2"></div>
    </div>

    <div class="container-lg hero-content">
      ${badge}

      <h1 class="hero-title">${titleHtml}</h1>

      <p class="hero-subtitle">${esc(profile.subtitle)}</p>

      <div class="hero-ctas">
        <a href="#projetos" class="btn-primary-cta">
          Ver projetos
          ${Icons.arrowRight('icon-16')}
        </a>
        <a href="#contato" class="btn-secondary-cta">Entre em contato</a>
        <a href="/cv.pdf" download class="btn-ghost-cta">
          ${Icons.download('icon-16')}
          Baixar CV
        </a>
      </div>

      <div class="hero-stats">${statsHtml}</div>
    </div>
  </section>`;
}

function renderSkills(skillCategories) {
  const cards = skillCategories
    .map((category) => {
      const iconName = SKILL_ICON_MAP[category.icon] || 'code';
      const skillsHtml = category.skills
        .map((s) => `<li><div class="skill-dot"></div>${esc(s)}</li>`)
        .join('');
      return `
      <div class="skill-card">
        <div class="skill-icon">${Icons[iconName]('icon-24')}</div>
        <h3>${esc(category.title)}</h3>
        <ul>${skillsHtml}</ul>
      </div>`;
    })
    .join('');

  return `
  <section id="habilidades" class="section section-bg-alt">
    <div class="container-lg">
      <div class="section-header">
        <div class="section-tag"><span>Habilidades</span></div>
        <h2 class="section-title">Expertise técnica e competências</h2>
        <p class="section-desc">Conjunto abrangente de tecnologias e habilidades para entregar soluções completas de alta qualidade.</p>
      </div>

      <div class="skills-grid">${cards}</div>
    </div>
  </section>`;
}

function renderExperience(experiences) {
  const items = experiences
    .map((exp) => {
      const achievementsHtml = exp.achievements
        .map((a) => `<li><div class="dot"></div><span>${esc(a)}</span></li>`)
        .join('');
      const techHtml = exp.technologies
        .map((t) => `<span class="pill">${esc(t)}</span>`)
        .join('');
      const currentBadge = exp.current ? `<span class="badge-current">Atual</span>` : '';

      return `
      <div class="timeline-item">
        <div class="timeline-dot-wrap">
          <div class="timeline-dot ${exp.current ? 'current' : ''}"></div>
        </div>

        <div class="timeline-card">
          <div class="exp-header">
            <div class="flex-1">
              <div class="exp-title-row">
                <div class="exp-icon">${Icons.briefcase('icon-20')}</div>
                <div>
                  <h3 class="exp-role">${esc(exp.role)}</h3>
                  <p class="exp-company">${esc(exp.company)}</p>
                </div>
              </div>

              <div class="exp-meta">
                <div>${Icons.calendar('icon-16')}<span>${esc(exp.period)}</span>${currentBadge}</div>
                <div>${Icons.mapPin('icon-16')}<span>${esc(exp.location)}</span></div>
              </div>
            </div>
          </div>

          <p class="exp-description">${esc(exp.description)}</p>

          <div class="exp-achievements">
            <h4 class="exp-block-title">Principais conquistas</h4>
            <ul>${achievementsHtml}</ul>
          </div>

          <div>
            <h4 class="exp-block-title">Tecnologias</h4>
            <div class="tech-pills">${techHtml}</div>
          </div>
        </div>
      </div>`;
    })
    .join('');

  return `
  <section id="experiencia" class="section">
    <div class="container-lg">
      <div class="section-header">
        <div class="section-tag"><span>Trajetória</span></div>
        <h2 class="section-title">Experiência profissional</h2>
        <p class="section-desc">Mais de 6 anos construindo soluções digitais inovadoras e liderando projetos de alto impacto.</p>
      </div>

      <div class="timeline">
        <div class="timeline-line"></div>
        <div class="timeline-items">${items}</div>
      </div>

      <div class="section-cta">
        <a href="/curriculo.pdf" download class="btn-cv">
          ${Icons.download('icon-20')}
          Baixar currículo completo
        </a>
      </div>
    </div>
  </section>`;
}

function renderProjects(projects, profile) {
  const cards = projects
    .map((project) => {
      const tagsHtml = project.tags.map((t) => `<span class="pill">${esc(t)}</span>`).join('');
      return `
      <div class="project-card">
        <div class="project-image-wrap">
          <img src="${esc(project.image)}" alt="${esc(project.title)}" />
          <div class="project-image-overlay"></div>
          <div class="project-links">
            <a href="${esc(project.githubUrl)}" target="_blank" rel="noopener noreferrer" aria-label="Ver código no GitHub">${Icons.github('icon-20')}</a>
            <a href="${esc(project.liveUrl)}" target="_blank" rel="noopener noreferrer" aria-label="Ver projeto ao vivo">${Icons.externalLink('icon-20')}</a>
          </div>
        </div>
        <div class="project-body">
          <h3>${esc(project.title)}</h3>
          <p>${esc(project.description)}</p>
          <div class="tag-pills">${tagsHtml}</div>
        </div>
      </div>`;
    })
    .join('');

  return `
  <section id="projetos" class="section">
    <div class="container-lg">
      <div class="section-header">
        <div class="section-tag accent"><span>Portfólio</span></div>
        <h2 class="section-title">Projetos em destaque</h2>
        <p class="section-desc">Uma seleção de projetos que demonstram minha capacidade de criar soluções completas e escaláveis.</p>
      </div>

      <div class="projects-grid">${cards}</div>

      <div class="section-cta">
        <a href="${esc(profile.githubUrl)}" target="_blank" rel="noopener noreferrer" class="btn-secondary-cta">
          Ver todos os projetos no GitHub
          ${Icons.externalLink('icon-16')}
        </a>
      </div>
    </div>
  </section>`;
}

function renderContact(profile) {
  const githubHandle = '@' + (profile.githubUrl.split('/').filter(Boolean).pop() || 'seuusuario');
  const linkedinHandle = '/in/' + (profile.linkedinUrl.split('/').filter(Boolean).pop() || 'seuusuario');

  return `
  <section id="contato" class="section section-bg-alt">
    <div class="container-lg">
      <div class="contact-grid">
        <div>
          <div class="section-tag"><span>Contato</span></div>
          <h2 class="section-title">Vamos trabalhar juntos</h2>
          <p class="contact-lead">Estou sempre aberto a discutir novos projetos, ideias criativas ou oportunidades de fazer parte de sua visão.</p>

          <div class="contact-cards">
            <a href="mailto:${esc(profile.email)}" class="contact-card is-link">
              <div class="contact-card-icon">${Icons.mail('icon-20')}</div>
              <div>
                <div class="contact-card-label">Email</div>
                <div class="contact-card-value">${esc(profile.email)}</div>
              </div>
            </a>

            <a href="${esc(profile.githubUrl)}" target="_blank" rel="noopener noreferrer" class="contact-card is-link">
              <div class="contact-card-icon">${Icons.github('icon-20')}</div>
              <div>
                <div class="contact-card-label">GitHub</div>
                <div class="contact-card-value">${esc(githubHandle)}</div>
              </div>
            </a>

            <a href="${esc(profile.linkedinUrl)}" target="_blank" rel="noopener noreferrer" class="contact-card is-link">
              <div class="contact-card-icon">${Icons.linkedin('icon-20')}</div>
              <div>
                <div class="contact-card-label">LinkedIn</div>
                <div class="contact-card-value">${esc(linkedinHandle)}</div>
              </div>
            </a>

            <div class="contact-card">
              <div class="contact-card-icon">${Icons.mapPin('icon-20')}</div>
              <div>
                <div class="contact-card-label">Localização</div>
                <div class="contact-card-value">${esc(profile.location)}</div>
              </div>
            </div>
          </div>
        </div>

        <div>
          <form class="contact-form" data-contact-form>
            <div class="form-field">
              <label for="name">Nome</label>
              <input type="text" id="name" name="name" placeholder="Seu nome" />
            </div>

            <div class="form-field">
              <label for="email">Email</label>
              <input type="email" id="email" name="email" placeholder="seu@email.com" />
            </div>

            <div class="form-field">
              <label for="message">Mensagem</label>
              <textarea id="message" name="message" rows="6" placeholder="Conte-me sobre seu projeto..."></textarea>
            </div>

            <button type="submit" class="btn-submit">Enviar mensagem</button>
          </form>
        </div>
      </div>
    </div>
  </section>`;
}

function renderFooter(profile) {
  return `
  <footer class="site-footer">
    <div class="container-lg footer-inner">
      <div class="footer-copy">
        <span>© ${new Date().getFullYear()} ${esc(profile.name)}. Desenvolvido com</span>
        ${Icons.heart('icon-16')}
        <span>e HTML/CSS/JS</span>
      </div>

      <div class="footer-links">
        <a href="#sobre">Sobre</a>
        <a href="#projetos">Projetos</a>
        <a href="#contato">Contato</a>
      </div>
    </div>
  </footer>`;
}

function renderSite() {
  const profile = PortfolioStore.getProfile();
  const skills = PortfolioStore.getSkills();
  const experiences = PortfolioStore.getExperiences();
  const projects = PortfolioStore.getProjects();

  const root = document.getElementById('root');
  root.innerHTML = `
    <div class="min-h-screen">
      ${renderHeader(profile)}
      <main>
        ${renderHero(profile)}
        ${renderSkills(skills)}
        ${renderExperience(experiences)}
        ${renderProjects(projects, profile)}
        ${renderContact(profile)}
      </main>
      ${renderFooter(profile)}
    </div>`;

  attachSiteEvents();
}

function attachSiteEvents() {
  const root = document.getElementById('root');

  // Language switcher (todos os dropdowns de idioma na página)
  root.querySelectorAll('[data-lang-toggle]').forEach((btn) => {
    btn.addEventListener('click', () => {
      const menu = btn.parentElement.querySelector('[data-lang-menu]');
      menu.classList.toggle('open');
    });
  });

  root.querySelectorAll('[data-lang-menu] button').forEach((btn) => {
    btn.addEventListener('click', () => {
      const menu = btn.closest('[data-lang-menu]');
      const lang = btn.dataset.lang;
      menu.querySelectorAll('button').forEach((b) => {
        b.classList.toggle('active', b === btn);
        const check = b.querySelector('.check');
        if (check) check.remove();
        if (b === btn) {
          const span = document.createElement('span');
          span.className = 'check';
          span.textContent = '✓';
          b.appendChild(span);
        }
      });
      const wrapper = menu.closest('.lang-switcher').parentElement.parentElement;
      wrapper.querySelectorAll('[data-lang-label]').forEach((label) => {
        label.textContent = lang;
      });
      menu.classList.remove('open');
    });
  });

  document.addEventListener('click', (e) => {
    if (!e.target.closest('.lang-switcher')) {
      root.querySelectorAll('[data-lang-menu].open').forEach((m) => m.classList.remove('open'));
    }
  });

  // Mobile menu
  const mobileToggle = root.querySelector('[data-mobile-toggle]');
  const mobileMenu = root.querySelector('[data-mobile-menu]');
  if (mobileToggle && mobileMenu) {
    mobileToggle.addEventListener('click', () => {
      const isOpen = mobileMenu.classList.toggle('open');
      mobileToggle.innerHTML = isOpen ? Icons.x('icon-24') : Icons.menu('icon-24');
    });
    mobileMenu.querySelectorAll('[data-close-mobile]').forEach((el) => {
      el.addEventListener('click', () => {
        mobileMenu.classList.remove('open');
        mobileToggle.innerHTML = Icons.menu('icon-24');
      });
    });
  }

  // Contact form (demo apenas)
  const form = root.querySelector('[data-contact-form]');
  if (form) {
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      alert('Mensagem enviada! (demonstração)');
      form.reset();
    });
  }
}

function route() {
  if (window.location.hash.startsWith('#/admin')) {
    window.location.href = 'admin/index.html';
    return;
  }
  renderSite();
}

window.addEventListener('hashchange', route);
document.addEventListener('DOMContentLoaded', route);
