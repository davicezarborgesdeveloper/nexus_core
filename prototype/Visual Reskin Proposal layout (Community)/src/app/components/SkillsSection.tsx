import { Code, Terminal, Rocket, Zap } from 'lucide-react';
import { PortfolioStore } from '../../lib/portfolioStore';

const iconMap = { code: Code, terminal: Terminal, rocket: Rocket, zap: Zap };

export function SkillsSection() {
  const skillCategories = PortfolioStore.getSkills();

  return (
    <section id="habilidades" className="py-24 bg-[var(--neutral-50)]">
      <div className="max-w-7xl mx-auto px-6 lg:px-8">
        {/* Header */}
        <div className="max-w-3xl mb-16">
          <div
            className="inline-block px-4 py-1 rounded-full mb-4"
            style={{ backgroundColor: 'var(--primary)', color: 'var(--primary-foreground)' }}
          >
            <span className="text-sm" style={{ fontFamily: 'var(--font-body)', fontWeight: 'var(--font-weight-medium)' }}>
              Habilidades
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
            Expertise técnica e competências
          </h2>
          <p style={{ fontFamily: 'var(--font-body)', fontSize: '1.125rem', color: 'var(--neutral-600)', lineHeight: '1.7' }}>
            Conjunto abrangente de tecnologias e habilidades para entregar soluções completas de alta qualidade.
          </p>
        </div>

        {/* Skills Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {skillCategories.map((category, index) => {
            const Icon = iconMap[category.icon] || Code;
            return (
              <div
                key={index}
                className="group p-6 rounded-xl bg-white border border-[var(--border)] transition-all duration-300 hover:shadow-lg"
                style={{
                  boxShadow: '0 1px 3px 0 rgba(0, 0, 0, 0.1)'
                }}
                onMouseEnter={(e) => {
                  e.currentTarget.style.transform = 'translateY(-4px)';
                  e.currentTarget.style.boxShadow = '0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1)';
                  e.currentTarget.style.borderColor = 'var(--primary)';
                }}
                onMouseLeave={(e) => {
                  e.currentTarget.style.transform = 'translateY(0)';
                  e.currentTarget.style.boxShadow = '0 1px 3px 0 rgba(0, 0, 0, 0.1)';
                  e.currentTarget.style.borderColor = 'var(--border)';
                }}
              >
                {/* Icon */}
                <div
                  className="w-12 h-12 rounded-lg flex items-center justify-center mb-4 transition-colors duration-300"
                  style={{ backgroundColor: 'var(--neutral-100)' }}
                >
                  <Icon className="w-6 h-6" style={{ color: 'var(--primary)' }} />
                </div>

                {/* Title */}
                <h3
                  className="mb-3"
                  style={{
                    fontFamily: 'var(--font-heading)',
                    fontSize: '1.25rem',
                    fontWeight: 'var(--font-weight-semibold)',
                    color: 'var(--foreground)'
                  }}
                >
                  {category.title}
                </h3>

                {/* Skills List */}
                <ul className="space-y-2">
                  {category.skills.map((skill, skillIndex) => (
                    <li
                      key={skillIndex}
                      className="flex items-center gap-2"
                      style={{ fontFamily: 'var(--font-body)', color: 'var(--neutral-600)' }}
                    >
                      <div className="w-1.5 h-1.5 rounded-full" style={{ backgroundColor: 'var(--accent-color)' }} />
                      {skill}
                    </li>
                  ))}
                </ul>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
