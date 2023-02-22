const nav = document.querySelector('nav');
const links = document.querySelectorAll('nav a');
const indicator = document.querySelector('.indicator');

function handleLinkClick(e) {
  e.preventDefault();
  const target = e.currentTarget;
  const width = target.offsetWidth;
  const left = target.offsetLeft;
  indicator.style.width = `${width}px`;
  indicator.style.left = `${left}px`;
  links.forEach(link => link.parentElement.classList.remove('active'));
  target.parentElement.classList.add('active');
}

links.forEach(link => link.addEventListener('click', handleLinkClick));
