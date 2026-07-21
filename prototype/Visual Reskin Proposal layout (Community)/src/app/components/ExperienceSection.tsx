import { Briefcase, Calendar, MapPin } from 'lucide-react';
import { PortfolioStore } from '../../lib/portfolioStore';

export function ExperienceSection() {
  const experiences = PortfolioStore.getExperiences();

  return (
    <section id="experiencia" className="py-24 bg-white">
      <div className="max-w-7xl mx-auto px-6 lg:px-8">
        {/* Header */}
        <div className="max-w-3xl mb-16">
          <div 
            className="inline-block px-4 py-1 rounded-full mb-4"
            style={{ backgroundColor: 'var(--primary)', color: 'var(--primary-foreground)' }}
          >
            <span className="text-sm" style={{ fontFamily: 'var(--font-body)', fontWeight: 'var(--font-weight-medium)' }}>
              Trajetória
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
            Experiência profissional
          </h2>
          <p style={{ fontFamily: 'var(--font-body)', fontSize: '1.125rem', color: 'var(--neutral-600)', lineHeight: '1.7' }}>
            Mais de 6 anos construindo soluções digitais inovadoras e liderando projetos de alto impacto.
          </p>
        </div>

        {/* Timeline */}
        <div className="relative">
          {/* Vertical line */}
          <div 
            className="absolute left-0 top-0 bottom-0 w-0.5 hidden lg:block"
            style={{ 
              backgroundColor: 'var(--border)',
              left: '1.5rem'
            }}
          />

          {/* Experience items */}
          <div className="space-y-12">
            {experiences.map((exp, index) => (
              <div 
                key={index}
                className="relative group"
              >
                {/* Timeline dot */}
                <div 
                  className="absolute left-0 top-6 hidden lg:block"
                  style={{ left: '0.875rem' }}
                >
                  <div 
                    className="w-5 h-5 rounded-full border-4 transition-all duration-300"
                    style={{ 
                      backgroundColor: exp.current ? 'var(--primary)' : 'white',
                      borderColor: exp.current ? 'var(--primary)' : 'var(--border)',
                      boxShadow: exp.current ? '0 0 0 4px var(--primary-light)' : 'none'
                    }}
                  />
                </div>

                {/* Content card */}
                <div 
                  className="lg:ml-16 rounded-xl p-6 border transition-all duration-300"
                  style={{ 
                    backgroundColor: 'white',
                    borderColor: 'var(--border)',
                    boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1)'
                  }}
                  onMouseEnter={(e) => {
                    e.currentTarget.style.transform = 'translateX(8px)';
                    e.currentTarget.style.boxShadow = '0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1)';
                    e.currentTarget.style.borderColor = 'var(--primary)';
                  }}
                  onMouseLeave={(e) => {
                    e.currentTarget.style.transform = 'translateX(0)';
                    e.currentTarget.style.boxShadow = '0 1px 3px 0 rgba(0, 0, 0, 0.1)';
                    e.currentTarget.style.borderColor = 'var(--border)';
                  }}
                >
                  {/* Header */}
                  <div className="flex flex-col sm:flex-row sm:items-start sm:justify-between gap-4 mb-4">
                    <div className="flex-1">
                      <div className="flex items-start gap-3 mb-2">
                        <div 
                          className="p-2 rounded-lg mt-1"
                          style={{ backgroundColor: 'var(--neutral-100)' }}
                        >
                          <Briefcase className="w-5 h-5" style={{ color: 'var(--primary)' }} />
                        </div>
                        <div>
                          <h3 
                            style={{ 
                              fontFamily: 'var(--font-heading)',
                              fontSize: '1.5rem',
                              fontWeight: 'var(--font-weight-semibold)',
                              color: 'var(--foreground)',
                              lineHeight: '1.3'
                            }}
                          >
                            {exp.role}
                          </h3>
                          <p 
                            className="mt-1"
                            style={{ 
                              fontFamily: 'var(--font-body)',
                              fontSize: '1.125rem',
                              fontWeight: 'var(--font-weight-medium)',
                              color: 'var(--primary)'
                            }}
                          >
                            {exp.company}
                          </p>
                        </div>
                      </div>
                      
                      <div className="flex flex-wrap gap-4 text-sm" style={{ color: 'var(--neutral-600)' }}>
                        <div className="flex items-center gap-1.5">
                          <Calendar className="w-4 h-4" />
                          <span style={{ fontFamily: 'var(--font-body)' }}>{exp.period}</span>
                          {exp.current && (
                            <span 
                              className="ml-2 px-2 py-0.5 rounded text-xs"
                              style={{ 
                                backgroundColor: 'var(--accent-color)',
                                color: 'var(--accent-foreground)',
                                fontWeight: 'var(--font-weight-medium)'
                              }}
                            >
                              Atual
                            </span>
                          )}
                        </div>
                        <div className="flex items-center gap-1.5">
                          <MapPin className="w-4 h-4" />
                          <span style={{ fontFamily: 'var(--font-body)' }}>{exp.location}</span>
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* Description */}
                  <p 
                    className="mb-4"
                    style={{ 
                      fontFamily: 'var(--font-body)',
                      color: 'var(--neutral-600)',
                      lineHeight: '1.7'
                    }}
                  >
                    {exp.description}
                  </p>

                  {/* Achievements */}
                  <div className="mb-4">
                    <h4 
                      className="mb-2"
                      style={{ 
                        fontFamily: 'var(--font-heading)',
                        fontSize: '0.875rem',
                        fontWeight: 'var(--font-weight-semibold)',
                        color: 'var(--foreground)',
                        textTransform: 'uppercase',
                        letterSpacing: '0.05em'
                      }}
                    >
                      Principais conquistas
                    </h4>
                    <ul className="space-y-2">
                      {exp.achievements.map((achievement, achIndex) => (
                        <li 
                          key={achIndex}
                          className="flex items-start gap-2"
                          style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)', lineHeight: '1.6' }}
                        >
                          <div 
                            className="w-1.5 h-1.5 rounded-full mt-2 flex-shrink-0" 
                            style={{ backgroundColor: 'var(--accent-color)' }} 
                          />
                          <span>{achievement}</span>
                        </li>
                      ))}
                    </ul>
                  </div>

                  {/* Technologies */}
                  <div>
                    <h4 
                      className="mb-2"
                      style={{ 
                        fontFamily: 'var(--font-heading)',
                        fontSize: '0.875rem',
                        fontWeight: 'var(--font-weight-semibold)',
                        color: 'var(--foreground)',
                        textTransform: 'uppercase',
                        letterSpacing: '0.05em'
                      }}
                    >
                      Tecnologias
                    </h4>
                    <div className="flex flex-wrap gap-2">
                      {exp.technologies.map((tech, techIndex) => (
                        <span
                          key={techIndex}
                          className="px-3 py-1 rounded-md text-sm"
                          style={{ 
                            backgroundColor: 'var(--neutral-100)',
                            color: 'var(--neutral-700)',
                            fontFamily: 'var(--font-body)',
                            fontWeight: 'var(--font-weight-medium)'
                          }}
                        >
                          {tech}
                        </span>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Download CV CTA */}
        <div className="mt-16 text-center">
          <a 
            href="/curriculo.pdf"
            download
            className="inline-flex items-center gap-2 px-8 py-4 rounded-lg transition-all duration-200"
            style={{ 
              backgroundColor: 'var(--primary)',
              color: 'var(--primary-foreground)',
              fontFamily: 'var(--font-body)',
              fontWeight: 'var(--font-weight-semibold)',
              fontSize: '1.125rem',
              boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1)'
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.transform = 'translateY(-2px)';
              e.currentTarget.style.boxShadow = '0 10px 15px -3px rgba(0, 0, 0, 0.15)';
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.transform = 'translateY(0)';
              e.currentTarget.style.boxShadow = '0 4px 6px -1px rgba(0, 0, 0, 0.1)';
            }}
          >
            <svg 
              className="w-5 h-5" 
              fill="none" 
              stroke="currentColor" 
              viewBox="0 0 24 24"
            >
              <path 
                strokeLinecap="round" 
                strokeLinejoin="round" 
                strokeWidth={2} 
                d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" 
              />
            </svg>
            Baixar currículo completo
          </a>
        </div>
      </div>
    </section>
  );
}
