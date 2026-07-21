import { useState } from 'react';
import { ArrowLeft, Eye, EyeOff, Settings } from 'lucide-react';
import { PortfolioStore } from '../../../lib/portfolioStore';

export function AdminLogin({ onLoginSuccess }: { onLoginSuccess: () => void }) {
  const [user, setUser] = useState('');
  const [pass, setPass] = useState('');
  const [showPass, setShowPass] = useState(false);
  const [error, setError] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (PortfolioStore.login(user.trim(), pass)) {
      setError(false);
      onLoginSuccess();
    } else {
      setError(true);
    }
  };

  return (
    <div className="min-h-screen flex flex-col" style={{ fontFamily: 'var(--font-body)' }}>
      <div className="border-b border-[var(--border)] px-6 py-5 flex justify-end">
        <a
          href="#/"
          className="inline-flex items-center gap-2 text-[var(--neutral-600)] hover:text-[var(--foreground)] transition-colors duration-200"
        >
          <ArrowLeft className="w-4 h-4" />
          Voltar ao portfólio
        </a>
      </div>

      <div className="flex-1 flex flex-col items-center justify-center px-6 py-8">
        <form
          onSubmit={handleSubmit}
          className="w-full text-center bg-white border border-[var(--border)] rounded-xl p-10"
          style={{ maxWidth: '26rem', boxShadow: '0 10px 25px -5px rgba(0, 0, 0, 0.1)' }}
        >
          <div
            className="w-14 h-14 rounded-xl flex items-center justify-center mx-auto mb-6"
            style={{ backgroundColor: 'var(--primary)', color: '#fff' }}
          >
            <Settings className="w-7 h-7" />
          </div>

          <h1
            className="mb-2"
            style={{ fontFamily: 'var(--font-heading)', fontSize: '1.5rem', fontWeight: 'var(--font-weight-bold)' }}
          >
            Área Administrativa
          </h1>
          <p className="mb-6" style={{ color: 'var(--neutral-600)' }}>
            Faça login para acessar o painel
          </p>

          <div className="text-left mb-5">
            <label htmlFor="loginUser" className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>
              Usuário
            </label>
            <input
              id="loginUser"
              type="text"
              value={user}
              onChange={(e) => setUser(e.target.value)}
              placeholder="Digite seu usuário"
              autoComplete="username"
              required
              className="w-full px-4 py-3 rounded-lg border border-[var(--border)] focus:outline-none transition-all duration-200"
              onFocus={(e) => {
                e.currentTarget.style.borderColor = 'var(--primary)';
                e.currentTarget.style.boxShadow = '0 0 0 3px rgba(30, 58, 138, 0.1)';
              }}
              onBlur={(e) => {
                e.currentTarget.style.borderColor = 'var(--border)';
                e.currentTarget.style.boxShadow = 'none';
              }}
            />
          </div>

          <div className="text-left mb-5">
            <label htmlFor="loginPass" className="block mb-2" style={{ fontWeight: 'var(--font-weight-medium)' }}>
              Senha
            </label>
            <div className="relative">
              <input
                id="loginPass"
                type={showPass ? 'text' : 'password'}
                value={pass}
                onChange={(e) => setPass(e.target.value)}
                placeholder="Digite sua senha"
                autoComplete="current-password"
                required
                className="w-full px-4 py-3 pr-11 rounded-lg border border-[var(--border)] focus:outline-none transition-all duration-200"
                onFocus={(e) => {
                  e.currentTarget.style.borderColor = 'var(--primary)';
                  e.currentTarget.style.boxShadow = '0 0 0 3px rgba(30, 58, 138, 0.1)';
                }}
                onBlur={(e) => {
                  e.currentTarget.style.borderColor = 'var(--border)';
                  e.currentTarget.style.boxShadow = 'none';
                }}
              />
              <button
                type="button"
                onClick={() => setShowPass(!showPass)}
                aria-label={showPass ? 'Ocultar senha' : 'Mostrar senha'}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-[var(--neutral-600)] hover:text-[var(--foreground)]"
              >
                {showPass ? <EyeOff className="w-4 h-4" /> : <Eye className="w-4 h-4" />}
              </button>
            </div>
          </div>

          {error && (
            <p className="text-left mb-4" style={{ color: '#dc2626', fontSize: '0.875rem' }}>
              Usuário ou senha inválidos.
            </p>
          )}

          <button
            type="submit"
            className="w-full py-3 rounded-full transition-all duration-200"
            style={{
              backgroundColor: 'var(--primary)',
              color: 'var(--primary-foreground)',
              fontWeight: 'var(--font-weight-semibold)'
            }}
          >
            Entrar
          </button>
        </form>

        <p className="mt-6 text-sm" style={{ color: 'var(--neutral-400)' }}>
          Acesso restrito ao administrador do portfólio
        </p>
      </div>
    </div>
  );
}
