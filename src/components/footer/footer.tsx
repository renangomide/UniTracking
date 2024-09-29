import React from 'react';

export default function Footer() {
  return (
    <footer className="bg-gray-800 text-white py-4 fixed bottom-0 w-full">
      <div className="container mx-auto text-center">
        <p>&copy; {new Date().getFullYear()} UniTracking. Todos os direitos reservados.</p>
        <ul className="flex justify-center space-x-4 mt-2">
          <li>
            <a href="https://github.com/Daniel-Thielmann/UniTracking" target="_blank" rel="noopener noreferrer" className="hover:underline">
              GitHub
            </a>
          </li>
          <li>
            <a href="https://linkedin.com/in/seu-perfil" target="_blank" rel="noopener noreferrer" className="hover:underline">
              LinkedIn
            </a>
          </li>
          <li>
            <a href="https://twitter.com/seu-perfil" target="_blank" rel="noopener noreferrer" className="hover:underline">
              Twitter
            </a>
          </li>
        </ul>
      </div>
    </footer>
  );
}
