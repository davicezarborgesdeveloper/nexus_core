// Helpers compartilhados entre as abas do admin.

function escAdmin(str) {
  const div = document.createElement('div');
  div.textContent = str ?? '';
  return div.innerHTML;
}

function linesToArray(text) {
  return text.split('\n').map((s) => s.trim()).filter(Boolean);
}
