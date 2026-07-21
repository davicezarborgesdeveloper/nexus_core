import { useState } from 'react';
import { PortfolioStore } from '../../../lib/portfolioStore';
import { AdminLogin } from './AdminLogin';
import { AdminDashboard } from './AdminDashboard';

export function AdminApp() {
  const [loggedIn, setLoggedIn] = useState(PortfolioStore.isLoggedIn());

  if (!loggedIn) {
    return <AdminLogin onLoginSuccess={() => setLoggedIn(true)} />;
  }

  return (
    <AdminDashboard
      onLogout={() => {
        PortfolioStore.logout();
        setLoggedIn(false);
      }}
    />
  );
}
