import { useEffect, useState } from "react";
import { Header } from "./components/Header";
import { HeroSection } from "./components/HeroSection";
import { SkillsSection } from "./components/SkillsSection";
import { ExperienceSection } from "./components/ExperienceSection";
import { ProjectsSection } from "./components/ProjectsSection";
import { ContactSection } from "./components/ContactSection";
import { Footer } from "./components/Footer";
import { DesignSystem } from "./components/DesignSystem";
import { AdminApp } from "./components/admin/AdminApp";

function useHashRoute() {
  const [hash, setHash] = useState(() => window.location.hash);

  useEffect(() => {
    const onHashChange = () => setHash(window.location.hash);
    window.addEventListener("hashchange", onHashChange);
    return () => window.removeEventListener("hashchange", onHashChange);
  }, []);

  return hash;
}

export default function App() {
  // Defina como true para ver o Design System, false para ver o portfólio
  const showDesignSystem = false;
  const hash = useHashRoute();

  if (hash.startsWith("#/admin")) {
    return <AdminApp />;
  }

  if (showDesignSystem) {
    return <DesignSystem />;
  }

  return (
    <div
      className="min-h-screen"
      style={{ fontFamily: "var(--font-body)" }}
    >
      <Header />
      <main>
        <HeroSection />
        <SkillsSection />
        <ExperienceSection />
        <ProjectsSection />
        <ContactSection />
      </main>
      <Footer />
    </div>
  );
}
