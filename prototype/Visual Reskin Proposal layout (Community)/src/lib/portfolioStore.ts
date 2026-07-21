// Dados padrão e camada de persistência (localStorage) compartilhada
// entre o site público (App) e o painel administrativo (admin/).

export type SkillCategory = {
  icon: 'code' | 'terminal' | 'rocket' | 'zap';
  title: string;
  skills: string[];
};

export type Experience = {
  role: string;
  company: string;
  location: string;
  period: string;
  current: boolean;
  description: string;
  achievements: string[];
  technologies: string[];
};

export type Project = {
  title: string;
  description: string;
  tags: string[];
  image: string;
  githubUrl: string;
  liveUrl: string;
};

export type Stat = {
  number: string;
  label: string;
};

export type Profile = {
  name: string;
  title: string;
  subtitle: string;
  githubUrl: string;
  linkedinUrl: string;
  email: string;
  location: string;
  available: boolean;
  stats: [Stat, Stat, Stat];
};

const STORAGE_KEYS = {
  profile: 'portfolio_profile',
  skills: 'portfolio_skills',
  experiences: 'portfolio_experiences',
  projects: 'portfolio_projects',
  auth: 'portfolio_admin_auth'
};

export const DEFAULT_PROFILE: Profile = {
  name: 'Davi Cezário Borges',
  title: 'Desenvolvedor Full Stack\nCriando soluções digitais',
  subtitle: 'Especializado em desenvolvimento web moderno, transformando ideias em aplicações escaláveis e performáticas com foco em experiência do usuário.',
  githubUrl: 'https://github.com/seuusuario',
  linkedinUrl: 'https://linkedin.com/in/seuusuario',
  email: 'seu@email.com',
  location: 'São Paulo, Brasil',
  available: true,
  stats: [
    { number: '5+', label: 'Anos de experiência' },
    { number: '50+', label: 'Projetos concluídos' },
    { number: '20+', label: 'Clientes satisfeitos' }
  ]
};

export const DEFAULT_SKILLS: SkillCategory[] = [
  { icon: 'code', title: 'Frontend', skills: ['React', 'TypeScript', 'Next.js', 'Tailwind CSS', 'Flutter'] },
  { icon: 'terminal', title: 'Backend', skills: ['Node.js', 'Python', 'PostgreSQL', 'REST APIs', 'GraphQL'] },
  { icon: 'rocket', title: 'DevOps', skills: ['Docker', 'AWS', 'CI/CD', 'Git', 'Firebase'] },
  { icon: 'zap', title: 'Soft Skills', skills: ['Trabalho em equipe', 'Comunicação', 'Resolução de problemas', 'Gestão de tempo', 'Adaptabilidade'] }
];

export const DEFAULT_EXPERIENCES: Experience[] = [
  {
    role: 'Senior Full Stack Developer',
    company: 'TechCorp Solutions',
    location: 'São Paulo, SP',
    period: 'Jan 2023 - Presente',
    current: true,
    description: 'Liderança técnica no desenvolvimento de aplicações web e mobile escaláveis. Responsável por arquitetura de sistemas, mentoria de desenvolvedores júnior e implementação de melhores práticas.',
    achievements: [
      'Reduzi o tempo de carregamento da aplicação principal em 60% através de otimizações',
      'Implementei pipeline CI/CD completo reduzindo tempo de deploy de 2h para 15min',
      'Lideranei equipe de 5 desenvolvedores em projeto de migração de monolito para microserviços'
    ],
    technologies: ['React', 'Node.js', 'TypeScript', 'AWS', 'Docker', 'PostgreSQL']
  },
  {
    role: 'Full Stack Developer',
    company: 'StartupX Inovação',
    location: 'Remoto',
    period: 'Mar 2021 - Dez 2022',
    current: false,
    description: 'Desenvolvimento full stack de plataforma SaaS para gestão empresarial. Colaboração direta com equipe de produto e design para criar experiências de usuário excepcionais.',
    achievements: [
      'Desenvolvi sistema de notificações em tempo real com WebSockets atendendo 10k+ usuários',
      'Criei arquitetura de API RESTful documentada com Swagger utilizada por 15+ clientes',
      'Implementei sistema de autenticação multi-fator aumentando segurança em 99%'
    ],
    technologies: ['Next.js', 'Python', 'FastAPI', 'MongoDB', 'Redis', 'GraphQL']
  },
  {
    role: 'Frontend Developer',
    company: 'WebDesign Agency',
    location: 'Rio de Janeiro, RJ',
    period: 'Jun 2019 - Fev 2021',
    current: false,
    description: 'Desenvolvimento de interfaces modernas e responsivas para clientes corporativos. Foco em performance, acessibilidade e experiência do usuário.',
    achievements: [
      'Entreguei mais de 30 projetos para clientes de diversos setores com 95% de satisfação',
      'Estabeleci biblioteca de componentes reutilizáveis reduzindo tempo de desenvolvimento em 40%',
      'Implementei testes automatizados aumentando cobertura de código para 85%'
    ],
    technologies: ['React', 'Vue.js', 'Tailwind CSS', 'Jest', 'Storybook']
  },
  {
    role: 'Junior Developer',
    company: 'Digital Solutions Ltda',
    location: 'São Paulo, SP',
    period: 'Jan 2018 - Mai 2019',
    current: false,
    description: 'Início da carreira profissional desenvolvendo aplicações web e aprendendo fundamentos de engenharia de software. Trabalho em equipe ágil com metodologia Scrum.',
    achievements: [
      'Contribuí para 10+ projetos web utilizando HTML, CSS, JavaScript e PHP',
      'Participei ativamente em code reviews e pair programming',
      'Recebi certificação em desenvolvimento web full stack'
    ],
    technologies: ['JavaScript', 'PHP', 'MySQL', 'Bootstrap', 'jQuery']
  }
];

export const DEFAULT_PROJECTS: Project[] = [
  {
    title: 'E-commerce Platform',
    description: 'Plataforma completa de e-commerce com painel administrativo, processamento de pagamentos e sistema de gestão de inventário.',
    tags: ['React', 'Node.js', 'PostgreSQL', 'Stripe'],
    image: 'https://images.unsplash.com/photo-1557821552-17105176677c?w=800&h=600&fit=crop',
    githubUrl: 'https://github.com/seuusuario/projeto1',
    liveUrl: 'https://projeto1.com'
  },
  {
    title: 'Dashboard Analytics',
    description: 'Dashboard interativo para visualização de dados em tempo real com gráficos avançados e relatórios personalizáveis.',
    tags: ['Next.js', 'TypeScript', 'D3.js', 'Firebase'],
    image: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=800&h=600&fit=crop',
    githubUrl: 'https://github.com/seuusuario/projeto2',
    liveUrl: 'https://projeto2.com'
  },
  {
    title: 'Mobile App - Fitness Tracker',
    description: 'Aplicativo mobile para acompanhamento de exercícios físicos com monitoramento de progresso e metas personalizadas.',
    tags: ['Flutter', 'Dart', 'Firebase', 'REST API'],
    image: 'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?w=800&h=600&fit=crop',
    githubUrl: 'https://github.com/seuusuario/projeto3',
    liveUrl: 'https://projeto3.com'
  },
  {
    title: 'SaaS Collaboration Tool',
    description: 'Ferramenta SaaS para colaboração em equipe com chat em tempo real, gestão de tarefas e integração com ferramentas populares.',
    tags: ['React', 'WebSocket', 'MongoDB', 'AWS'],
    image: 'https://images.unsplash.com/photo-1552664730-d307ca884978?w=800&h=600&fit=crop',
    githubUrl: 'https://github.com/seuusuario/projeto4',
    liveUrl: 'https://projeto4.com'
  }
];

function loadData<T>(key: string, fallback: T): T {
  try {
    const raw = localStorage.getItem(key);
    if (!raw) return JSON.parse(JSON.stringify(fallback));
    return JSON.parse(raw);
  } catch {
    return JSON.parse(JSON.stringify(fallback));
  }
}

function saveData<T>(key: string, value: T) {
  localStorage.setItem(key, JSON.stringify(value));
}

export const PortfolioStore = {
  getProfile: (): Profile => Object.assign({}, DEFAULT_PROFILE, loadData(STORAGE_KEYS.profile, DEFAULT_PROFILE)),
  setProfile: (v: Profile) => saveData(STORAGE_KEYS.profile, v),

  getSkills: (): SkillCategory[] => loadData(STORAGE_KEYS.skills, DEFAULT_SKILLS),
  setSkills: (v: SkillCategory[]) => saveData(STORAGE_KEYS.skills, v),

  getExperiences: (): Experience[] => loadData(STORAGE_KEYS.experiences, DEFAULT_EXPERIENCES),
  setExperiences: (v: Experience[]) => saveData(STORAGE_KEYS.experiences, v),

  getProjects: (): Project[] => loadData(STORAGE_KEYS.projects, DEFAULT_PROJECTS),
  setProjects: (v: Project[]) => saveData(STORAGE_KEYS.projects, v),

  resetAll: () => {
    localStorage.removeItem(STORAGE_KEYS.profile);
    localStorage.removeItem(STORAGE_KEYS.skills);
    localStorage.removeItem(STORAGE_KEYS.experiences);
    localStorage.removeItem(STORAGE_KEYS.projects);
  },

  isLoggedIn: (): boolean => localStorage.getItem(STORAGE_KEYS.auth) === '1',
  login: (user: string, pass: string): boolean => {
    if (user === 'admin' && pass === 'admin123') {
      localStorage.setItem(STORAGE_KEYS.auth, '1');
      return true;
    }
    return false;
  },
  logout: () => localStorage.removeItem(STORAGE_KEYS.auth)
};
