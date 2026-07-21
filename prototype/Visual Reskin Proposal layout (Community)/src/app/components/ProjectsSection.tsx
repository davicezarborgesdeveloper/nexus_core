import { ExternalLink, Github } from 'lucide-react';
import { PortfolioStore } from '../../lib/portfolioStore';

export function ProjectsSection() {
  const projects = PortfolioStore.getProjects();
  const profile = PortfolioStore.getProfile();

  return (
    <section id="projetos" className="py-24 bg-white">
      <div className="max-w-7xl mx-auto px-6 lg:px-8">
        {/* Header */}
        <div className="max-w-3xl mb-16">
          <div 
            className="inline-block px-4 py-1 rounded-full mb-4"
            style={{ backgroundColor: 'var(--accent-color)', color: 'var(--accent-foreground)' }}
          >
            <span className="text-sm" style={{ fontFamily: 'var(--font-body)', fontWeight: 'var(--font-weight-medium)' }}>
              Portfólio
            </span>
          </div>
          <h2 
            className="mb-4"
            style={{ 
              fontFamily: 'var(--font-heading)',
              fontSize: 'clamp(2rem, 4vw, 3rem)',
              fontWeight: 'var(--font-weight-bold)',
              color: 'var(--foreground)',
              lineHeight: '1.2'
            }}
          >
            Projetos em destaque
          </h2>
          <p style={{ fontFamily: 'var(--font-body)', fontSize: '1.125rem', color: 'var(--neutral-600)', lineHeight: '1.7' }}>
            Uma seleção de projetos que demonstram minha capacidade de criar soluções completas e escaláveis.
          </p>
        </div>

        {/* Projects Grid */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {projects.map((project, index) => (
            <div
              key={index}
              className="group rounded-xl overflow-hidden bg-white border border-[var(--border)] transition-all duration-300"
              style={{ boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1)' }}
              onMouseEnter={(e) => {
                e.currentTarget.style.transform = 'translateY(-8px)';
                e.currentTarget.style.boxShadow = '0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04)';
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.transform = 'translateY(0)';
                e.currentTarget.style.boxShadow = '0 1px 3px 0 rgba(0, 0, 0, 0.1)';
              }}
            >
              {/* Image */}
              <div className="relative h-64 overflow-hidden bg-[var(--neutral-200)]">
                <img 
                  src={project.image} 
                  alt={project.title}
                  className="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300" />
                
                {/* Links overlay */}
                <div className="absolute bottom-4 right-4 flex gap-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                  <a 
                    href={project.githubUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="p-2 rounded-lg transition-colors duration-200"
                    style={{ backgroundColor: 'white', color: 'var(--foreground)' }}
                    onClick={(e) => e.stopPropagation()}
                    aria-label="Ver código no GitHub"
                  >
                    <Github className="w-5 h-5" />
                  </a>
                  <a 
                    href={project.liveUrl}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="p-2 rounded-lg transition-colors duration-200"
                    style={{ backgroundColor: 'white', color: 'var(--foreground)' }}
                    onClick={(e) => e.stopPropagation()}
                    aria-label="Ver projeto ao vivo"
                  >
                    <ExternalLink className="w-5 h-5" />
                  </a>
                </div>
              </div>

              {/* Content */}
              <div className="p-6">
                <h3 
                  className="mb-2"
                  style={{ 
                    fontFamily: 'var(--font-heading)',
                    fontSize: '1.5rem',
                    fontWeight: 'var(--font-weight-semibold)',
                    color: 'var(--foreground)'
                  }}
                >
                  {project.title}
                </h3>
                
                <p 
                  className="mb-4"
                  style={{ 
                    fontFamily: 'var(--font-body)',
                    color: 'var(--neutral-600)',
                    lineHeight: '1.6'
                  }}
                >
                  {project.description}
                </p>

                {/* Tags */}
                <div className="flex flex-wrap gap-2">
                  {project.tags.map((tag, tagIndex) => (
                    <span
                      key={tagIndex}
                      className="px-3 py-1 rounded-md text-sm"
                      style={{ 
                        backgroundColor: 'var(--neutral-100)',
                        color: 'var(--neutral-700)',
                        fontFamily: 'var(--font-body)',
                        fontWeight: 'var(--font-weight-medium)'
                      }}
                    >
                      {tag}
                    </span>
                  ))}
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* CTA */}
        <div className="mt-12 text-center">
          <a 
            href={profile.githubUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-2 px-6 py-3 rounded-lg border transition-all duration-200"
            style={{ 
              borderColor: 'var(--border)',
              color: 'var(--foreground)',
              fontFamily: 'var(--font-body)',
              fontWeight: 'var(--font-weight-medium)'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.backgroundColor = 'var(--neutral-50)';
              e.currentTarget.style.borderColor = 'var(--neutral-300)';
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.backgroundColor = 'transparent';
              e.currentTarget.style.borderColor = 'var(--border)';
            }}
          >
            Ver todos os projetos no GitHub
            <ExternalLink className="w-4 h-4" />
          </a>
        </div>
      </div>
    </section>
  );
}
